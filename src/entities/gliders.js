const express = require('express');
const app = express();
const db = require('../database')
const constants = require('../const');

module.exports = function(app){

    // Get all gliders
    app.get('/api/gliders', (req, res) => {
        db.query(`SELECT * FROM ${constants.GLIDERS_TABLE_NAME}`, (err, rows, fields) => {
            if (err) throw err
            res.send(rows);
        });
    })

    // Get glider by id
    app.get('/api/gliders/:id', (req, res) => {
        const id = req.params.id
        db.query(`SELECT * FROM ${constants.GLIDERS_TABLE_NAME} WHERE id = ${id}`, (err, rows, fields) => {
            if (err) throw err;
            res.send(rows);
        });
    })

}

