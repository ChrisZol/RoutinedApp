import express from 'express';
import * as db from './database/db.js';

const app = express();

db.connectDB();
db.initDB();

// Starting the server
app.listen(3000, () => {
    console.log("Server started");
});