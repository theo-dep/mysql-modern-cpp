CREATE DATABASE `test_test_test`;
USE `test_test_test`;

CREATE TABLE person(
    id int unsigned auto_increment PRIMARY KEY,
    name varchar(50),
    weight double,
    birthday date,
    avatar int
);

LOCK TABLES `person` WRITE;
INSERT INTO person(name, weight, birthday, avatar) VALUES
    ("Nguyen Van X", 62.54, "1981-07-18", 4),
    ("Tran Thi Y", 56.78, "1999-05-12", 3),
    ("Bui Xuan Z", NULL, NULL, 5);
UNLOCK TABLES;
