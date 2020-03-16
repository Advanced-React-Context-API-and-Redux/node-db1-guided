const express = require('express');

// database access using knex
const db = require('../data/db-config.js');

const router = express.Router();

router.get('/', (req, res) => {
    // get the data from the database
    // select * from posts
    db.select('*')
        .from('posts')
        .then(rows => {
            res.status(200).json({ data: rows });
        })
        .catch(err => {
            res.status(500).json({ message: 'sorry, ran into an error'})
        })
});

router.get('/:id', (req, res) => {
    db('posts')
        // .where('id', '=', req.params.id) --> another option
        .where({ id: req.params.id })
        .first()
        .then(post => {
            if(post){
                res.status(200).json({ data: post });
            } else {
                res.status(404).json({ message: 'Post not found'})
            }
        })
        .catch(err => {
            res.status(500).json({ message: 'sorry, ran into an error'})
        })
});

router.post('/', (req, res) => {
    db('posts')
        .insert(req.body, 'id')
        .then(ids => {
            res.status(201).json({ results: ids})
        })
        .catch(err => {
            res.status(500).json({ message: 'sorry, ran into an error'})
        })
});

router.put('/:id', (req, res) => {

});

router.delete('/:id', (req, res) => {

});

module.exports = router;