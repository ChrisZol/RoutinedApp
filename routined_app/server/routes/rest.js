import express from 'express';
import * as posts  from '../controller/rest.js';

var router = express.Router();
// GET Requests
router.get('/', posts.getRoutinesOfDay);
router.get('/routines', posts.getRoutines);
router.get('/routine/:id', posts.getRoutine);
router.get('/routine/:id/tasks', posts.getTasksOfRoutine);
router.get('/task/:id', posts.getTask);

// POST Requests
router.post('/routine/:id', posts.createRoutine);
router.post('/task/:id', posts.createTask);

// PATCH Requests
router.patch('/routine/:id', posts.updateRoutine)
router.patch('/task/:id', posts.updateTask);

export default router;