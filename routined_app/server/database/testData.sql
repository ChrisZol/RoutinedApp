
INSERT INTO user_accounts (username, email)
VALUES('Chris', 'test1@mail.com');

INSERT INTO routines (name, occurence, start_time, end_time, user_id)
VALUES ('TestRoutine', 'Weekly', 12, 14, 1);

INSERT INTO tasks(name, duration, description, routine_id)
VALUES ('Task_1', 1000, 'This is a cool task', 1);