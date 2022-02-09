var mysql = require('mysql')
// require('dotenv').config();

module.exports = mysql.createConnection({
    host     : 'localhost',
    user     : 'root',
    password : '',
    database: 'mk8'
})
