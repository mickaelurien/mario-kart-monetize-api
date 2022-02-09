require('dotenv').config()
const express = require('express');
const app = express();
const path = require('path');
const db = require('./src/database')
const stripe = require('stripe')(process.env.STRIPE_SECRET_KEY)
const crypto = require('crypto')
const router = express.Router();
const functions = require('./src/functions')
const constants = require('./src/const')

// Import front routing
require('./src/routes')(app)

// Import endpoints for each entities
require('./src/entities/drivers')(app)
require('./src/entities/bodies')(app)
require('./src/entities/tires')(app)
require('./src/entities/gliders')(app)


// DATA
let storeApiKeys = [] // Use to avoid database calls
let currentHashedKey = null
// MIDDLEWARES 
// Middleware to verify if the client is subscribed
let activeOn = function (path, middleware) {
  return function (req, res, next) {
    if (req.path.includes(path)) {
      middleware(req, res, next)
    } else {
      next();
    }
  }
}

// Middleware required for css
app.use(express.static(__dirname + '/src/front'));

// Middleware active only on api/*
app.use(activeOn('/api', verifySubscribed))

// Middleware required for Webhook Handler
app.use(
  express.json({
    verify: (req, res, buffer) => (req['rawBody'] = buffer),
  })
);



async function verifySubscribed(req, res, next) {
  console.log(`---------- MIDDLEWARE IS UP ${req.path} ----------`)
  console.log('--- THE STORE IS ---', storeApiKeys)
  let apiKey = req.get('api_key');
  let customer = ''
  if (!apiKey) {
    res.status(409).send({
      message: "api_key is not present in headers"
    }) // Bad request
    return;
  } else {
    if (!storeApiKeys[apiKey]) { // If its first connection -> look in db
      console.log('CHECK FOR CUSTOMER IN DB')
      // currentHashedKey = hashApiKey(apiKey)
      // console.log('current hash key', currentHashedKey)
      functions.getCustomerByApiKey(apiKey).then(response => { // Wait for the db response
        customer = response;
        // console.log('CUSTOMER', customer)
        if (!customer) { // The customer is not found
          res.status(404).send({
            message: "No customer found for the given api_key"
          })
          return;
        }
        if (customer.active == 0) { // Not authorized TODO : Front page not authorized
          res.status(403).send({
            message: "Current customer not authorized"
          })
          return;
        }
        storeApiKeys[apiKey] = customer.itemId
        // console.log('STORE VALUES', storeApiKeys)
        saveRecord(storeApiKeys[apiKey]);
        next();
      });

    } else { // Already connected, check in store
      console.log('CHECK FOR CUSTOMER IN STORE')
      customer = storeApiKeys[apiKey]
      if (!customer) { // The customer is not found
        res.status(404).send({
          message: "No customer found for the given api_key"
        })
        return;
      }
      if (customer.active == 0) { // Not authorized TODO : Front page not authorized
        res.status(403).send({
          message: "Current customer not authorized"
        })
        return;
      }
      saveRecord(storeApiKeys[apiKey]);
      next();
    }
  }

}

// function hashApiKey(apiKey) {
//   const {
//     createHash
//   } = crypto;
//   const hashedApiKey = createHash('md5').update(apiKey).digest('hex');
//   return hashedApiKey;
// }

function generateAPIKey() {
  const {
    randomBytes
  } = crypto
  const apiKey = 'api_pk_' + randomBytes(16).toString('hex'); // Generate api key
  // const hashedAPIKey = hashApiKey(apiKey); // Hash the generate api key to store in the database

  // Ensure API key is unique
  if (storeApiKeys[apiKey]) {
    generateAPIKey();
  } else {
    // return {
    //   hashedAPIKey,
    //   apiKey
    // };
    return apiKey
  }
}

async function saveRecord(customerId) {
  // Record usage with Stripe Billing
  await stripe.subscriptionItems.createUsageRecord(
    customerId, {
      quantity: 1,
      timestamp: 'now',
      action: 'increment'
    }
  )
  console.log('RECORD SAVE', storeApiKeys)
}



app.get('/api', async (req, res) => {
  console.log('API STORE KEYS', storeApiKeys)
  res.send('/api welcome')
})

// Show the invoices of a specific customer
app.get('/usage/:customer', async (req, res) => {
  const customerId = req.params.customer;
  const invoice = await stripe.invoices.retrieveUpcoming({
    customer: customerId
  })
  res.send(invoice)
})

app.post('/checkout', async (req, res) => {
  const session = await stripe.checkout.sessions.create({
    mode: 'subscription',
    payment_method_types: ['card'],
    line_items: [{
      price: process.env.STRIPE_PRODUCT_PRICE,
    }],
    success_url: 'http://localhost:8080/success?session_id={CHECKOUT_SESSION_ID}',
    cancel_url: 'http://localhost:8080/'
  });
  res.send(session);
})

// Listen to webhooks from Stripe when important events happen
app.post('/webhook', async (req, res) => {
  let data;
  let eventType;
  // Check if webhook signing is configured.
  const webhookSecret = process.env.STRIPE_WEBHOOK_KEY;

  if (webhookSecret) {
    // Retrieve the event by verifying the signature using the raw body and secret.
    let event;
    let signature = req.headers['stripe-signature'];
    try {
      event = stripe.webhooks.constructEvent(
        req['rawBody'],
        signature,
        webhookSecret
      );
    } catch (err) {
      console.log(`⚠️  Webhook signature verification failed.`);
      return res.sendStatus(400);
    }
    // Extract the object from the event.
    data = event.data;
    eventType = event.type;
  } else {
    // Webhook signing is recommended, but if the secret is not configured in `config.js`,
    // retrieve the event data directly from the request body.
    data = req.body.data;
    eventType = req.body.type;
  }

  switch (eventType) {
    case 'checkout.session.completed':
      console.log(`👌 Checkout session completed`)
      // Data included in the event object:
      const customerId = data.object.customer;
      const subscriptionId = data.object.subscription;

      console.log(
        `💰 Customer ${customerId} subscribed to plan ${subscriptionId}`
      );

      // Get the subscription. The first item is the plan the user subscribed to.
      const subscription = await stripe.subscriptions.retrieve(subscriptionId);
      const itemId = subscription.items.data[0].id;

      // Generate API key
      const apiKey = generateAPIKey();
      console.log(`User's API Key: ${apiKey}`);
      // console.log(`Hashed API Key: ${hashedAPIKey}`);

      // Store the API key in your database.
      // FIXME : The api is store in clear because we need to give it to the user
      const sql = `INSERT INTO ${constants.CUSTOMERS_TABLE_NAME}(apiKey, customerId, itemId, active) VALUES ('${apiKey}', '${customerId}','${itemId}',1)`
      db.query(sql,
        (err, rows, fields) => {
          if (err) throw err;
          console.log('--- CUSTOMER ADDED ---');
        });
      storeApiKeys[apiKey] = customerId // Save the key to give it to the user 
      storeApiKeys = storeApiKeys
      console.log('WEBHOOK STORE APIKEYS', storeApiKeys)
      break;
    case 'invoice.paid':
      // Continue to provision the subscription as payments continue to be made.
      // Store the status in your database and check when a user accesses your service.
      // This approach helps you avoid hitting rate limits.
      break;
    case 'invoice.payment_failed':
      // The payment failed or the customer does not have a valid payment method.
      // The subscription becomes past_due. Notify your customer and send them to the
      // customer portal to update their payment information.

      // Set active to 0 on the customers db
      let sqlUpdateCustomer = `UPDATE ${constants.CUSTOMERS_TABLE_NAME} SET active = 0 WHERE customerId=${customerId}`;
      db.query(sqlUpdateCustomer,
        (err, rows, fields) => {
          if (err) throw err;
          console.log('--- CUSTOMER SET ACTIVE 0 ---');
        }
      );
      
      // TODO : Need to notify the customer

      break;
    default:
      // Unhandled event type
  }

  res.sendStatus(200);
});

app.get('/success', async (req, res) => {
  res.sendFile(path.join(__dirname + '/src/front/success.html'))
})

// Route use on /success btn click, need this because can't pass with Node a file + a variable
app.get('/getmykey', async (req, res) => {
  const session = await stripe.checkout.sessions.retrieve(req.query.session_id);
  const customer = await stripe.customers.retrieve(session.customer);
  db.query(`SELECT apiKey FROM ${constants.CUSTOMERS_TABLE_NAME} WHERE customerId='${customer.id}'`, (err, rows, fields) => {
    if (err) throw err;
    res.send(JSON.stringify(rows[0].apiKey)) // Stringify needed because can't get the result in html
  });
})

app.listen(8080);