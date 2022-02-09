const db = require('./database')

module.exports = {
    getCustomerByApiKey : function getCustomerByApiKey (hashedAPIKey) {
        return new Promise((resolve, reject) => {
            let sql = `SELECT id, customerId, apiKey, itemId, active FROM mk8_customers WHERE apiKey='${hashedAPIKey}'`
            db.query(sql, (err, res, fields) => {
                if (err) return reject(err);
                resolve(res[0])
            });
        })
    }
}



