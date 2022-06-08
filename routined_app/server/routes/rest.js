import express from 'express';
import * as posts  from '../controller/rest.js';

var app = express();
app.use(express.json())

// GET Requests
app.get('/', posts.getRoutinesOfDay);
app.get('/routines', posts.getRoutines);
app.get('/routine/:id', posts.getRoutine);
app.get('/task/:id', posts.getTask);

// POST Requests
app.post('/routine/:id', posts.createRoutine);
app.post('/task/:id', posts.createTask);

// PATCH Requests
app.patch('/routine/:id', posts.updateRoutine)
app.patch('/task/:id', posts.updateTask);

export default app;