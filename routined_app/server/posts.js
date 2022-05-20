import express from 'express';

var app = express();

app.get('/routines', (req, res) => {
    console.log('Welcome to routines');
});

export default app;