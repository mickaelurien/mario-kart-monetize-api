const path = require('path');
const express = require('express');
const app = express();


module.exports = function(app) {
    app.get('/', (req, res) => {
        res.sendFile(path.join(__dirname + '/front/index.html'))
    })
    

}

