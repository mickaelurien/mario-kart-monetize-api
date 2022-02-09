const express = require('express');
const app = express();
const db = require('../database')
const constants = require('../const');

module.exports = function(app){

    // Get all tires
    app.get('/api/tires', (req, res) => {
        db.query(`SELECT * FROM ${constants.TIRES_TABLE_NAME}`, (err, rows, fields) => {
            if (err) throw err;
            res.send(rows);
        });
    })

    // Get tire by id
    app.get('/api/tires/:id', (req, res) => {
        const id = req.params.id
        db.query(`SELECT * FROM ${constants.TIRES_TABLE_NAME} WHERE id = ${id}`, (err, rows, fields) => {
            if (err) throw err;
            res.send(rows);
        });
    })

}

