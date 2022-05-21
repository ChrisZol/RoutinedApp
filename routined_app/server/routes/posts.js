import express from 'express';
import * as posts  from '../controller/posts.js';

var app = express();

// GET Requests

app.get('/', (req, res) => {
    console.log('Welcome to the home page');
});

app.get('/routines', posts.getRoutines);

app.get('/routine/:id', posts.getRoutine);

app.get('/task/:id', posts.getTask);

export default app;