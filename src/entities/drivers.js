const express = require('express');
const app = express();
const db = require('../database');
const constants = require('../const');

module.exports = function(app){
    

    // Get all drivers
    app.get('/api/drivers', (req, res) => {
        db.query(`SELECT * FROM ${constants.DRIVERS_TABLE_NAME}`, (err, rows, fields) => {
            if (err) throw err;
            res.send(rows);
        });
    })

    // Get driver by id
    app.get('/api/drivers/:id', (req, res) => {
        const id = req.params.id
        db.query(`SELECT * FROM ${constants.DRIVERS_TABLE_NAME} WHERE id = ${id}`, (err, rows, fields) => {
            if (err) throw err;
            res.send(rows);
        });
    })

}

