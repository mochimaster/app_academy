PRAGMA foreign_keys = on;

DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id INTEGER PRIMARY KEY, 
  fname TEXT NOT NULL, 
  lname TEXT NOT NULL
); 

INSERT INTO 
  users(fname,lname)
VALUES 
  ('kee','ngiam'),
  ('devin', 'flood'), 
  ('Jimmy', 'Smithy'), 
  ('Walter', 'White'), 
  ('Tuco', 'OG'), 
  ('Jessie', 'Pinkman'), 
  ('Saul', 'Goodman');
  

DROP TABLE IF EXISTS questions;

CREATE TABLE questions(
  id INTEGER PRIMARY KEY, 
  title TEXT NOT NULL, 
  body TEXT NOT NULL,
  user_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO 
  questions(title,body,user_id)
VALUES
  ('Life difficulty','Why is life in Aa so hard?',1),
  ('B', 'Do you have my money?!?', 5),
  ('C', 'Do YOU have my money?', 5);


DROP TABLE IF EXISTS question_follows;

CREATE TABLE question_follows(
  id INTEGER PRIMARY KEY, 
  question_id INTEGER NOT NULL, 
  user_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO 
  question_follows(question_id, user_id)
VALUES
  (1,2);


DROP TABLE IF EXISTS replies;

CREATE TABLE replies(
  id INTEGER PRIMARY KEY, 
  question_id INTEGER NOT NULL, 
  user_id INTEGER NOT NULL,
  body TEXT NOT NULL,
  reply_id INTEGER ,

  FOREIGN KEY (reply_id) REFERENCES replies(id),
  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO
  replies(question_id, user_id, body, reply_id)
VALUES
  (1, 2, "Because anything worth doing is worth doing right.", NULL),
  (1, 3, "Because aA hates you", 1),
  (2, 4, "You're god damn right I do", NULL),
  (2, 6, "We're not giving you any money", 3);




DROP TABLE IF EXISTS question_likes;

CREATE TABLE question_likes(
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL, 
  likes INTEGER NOT NULL,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO 
  question_likes(question_id, user_id, likes)
VALUES
  (1, 1, 1),
  (1, 2, 1);




