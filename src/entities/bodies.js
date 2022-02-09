const express = require('express');
const app = express();
const db = require('../database')
const constants = require('../const');

module.exports = function(app){

    // Get all bodies
    app.get('/api/bodies', (req, res) => {
        db.query(`SELECT * FROM ${constants.BODIES_TABLE_NAME}`, (err, rows, fields) => {
            if (err) throw err;
            res.send(rows);
        });
    })

    // Get body by id
    app.get('/api/bodies/:id', (req, res) => {
        const id = req.params.id
        db.query(`SELECT * FROM ${constants.BODIES_TABLE_NAME} WHERE id = ${id}`, (err, rows, fields) => {
            if (err) throw err;
            res.send(rows);
        });
    })

}

