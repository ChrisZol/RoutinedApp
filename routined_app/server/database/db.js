import fs from 'fs';
import sqlite3 from 'sqlite3';
import path from 'path';
import {fileURLToPath} from 'url';

let db;
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

export function connectDB(){
    db = new sqlite3.Database(__dirname + "\\routined_db.db", err =>{
        if(err){
            return console.log(err.message);
        }
        
        console.log("Connected to the database.");
    });
}

export function initDB(){
    const sqlData = fs.readFileSync(__dirname + "\\init.sql").toString();
    const sqlDataArr = sqlData.split(";");

    if(!db) return;
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
}

export function closeDB(){
    if(!db) return;
    db.close((err) => {
        if (err) {
            return console.error(err.message);
        }
        console.log('Closed the database connection.');
        });
}
