import app from './routes/posts.js';
import * as db from './database/db.js';

db.connectDB();
// db.initDB();

// Starting the server
app.listen(3000, () => {
    console.log("Server started");
});