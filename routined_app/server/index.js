import express from 'express';
import cors from 'cors';

import routes from './routes/rest.js';

var app = express();
app.use(express.json())
app.use(cors({origin: 'http://localhost:8100'}));
app.use('/', routes);

// Starting the server
app.listen(3000, () => {
    console.log("Server started");
});

export default app;