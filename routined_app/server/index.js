import app from './routes/rest.js';
import * as db from './database/db.js';
import cors from 'cors';

//db.connectDB();
//db.initDB();

app.use(cors());
app.all('*', function(req, res, next) {
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Headers", "X-Requested-With");
    next();
 });

// Starting the server
app.listen(3000, () => {
    console.log("Server started");
});