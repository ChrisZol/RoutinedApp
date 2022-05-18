import fs from 'fs'
import sqlite3 from 'sqlite3'

const sqlData = fs.readFileSync("./init.sql").toString();

let db = new sqlite3.Database("./routined_db.db", err =>{
    if(err){
        return console.log(err.message);
    }

    console.log("Connected to the database.");
});

const sqlDataArr = sqlData.split(";");

db.serialize(() =>{
    db.run("BEGIN TRANSACTION;");

    sqlDataArr.forEach((query) => {
        if(query){
            query += ";";
            db.run(query, (err) => {
                if(err) console.log("Error during database transaction:\n", err);
            });
        }
    });

    db.run("COMMIT;");
});

db.close((err) => {
    if (err) {
      return console.error(err.message);
    }
    console.log('Closed the database connection.');
  });