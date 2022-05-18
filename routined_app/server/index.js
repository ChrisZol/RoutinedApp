import express from 'express';
import sqlite3  from 'sqlite3';

const app = express();

// Starting the server
app.listen(3000, () => {
    console.log("Server started");
});