CREATE TABLE IF NOT EXISTS user_accounts (
    user_id INTEGER PRIMARY KEY,
    username TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS routines (
    routine_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    occurence TEXT CHECK(occurence IN('Daily', 'Weekly', 'Monthly', 'Yearly')) NOT NULL,
    start_time NOT NULL,
    end_time NOT NULL,
    user_id INTEGER NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user_accounts (user_id)
);

CREATE TABLE IF NOT EXISTS tasks (
    task_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    duration INTEGER NOT NULL,
    description TEXT NOT NULL,
    routine_id INTEGER NOT NULL,
    FOREIGN KEY (routine_id) REFERENCES routines (routine_id)
);