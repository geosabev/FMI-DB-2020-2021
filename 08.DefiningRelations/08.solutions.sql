---- 08. Defining Relations ----

CREATE DATABASE ex9_products

USE ex9_products;

-- 01.a.
CREATE TABLE Product(
	maker CHAR(1),
	model CHAR(4),
	type VARCHAR(7)
);

CREATE TABLE Printer(
	code INT,
	model CHAR(4),
	price DECIMAL(16,2)
);

-- 01.b.
INSERT INTO Product (maker, model, type) VALUES ('A', '1', 'printer');
INSERT INTO Printer (code, model, price) VALUES (5, '1', 260.50);

-- 01.c.
ALTER TABLE Printer ADD type VARCHAR(6);
ALTER TABLE Printer ADD color CHAR(1) DEFAULT 'n';

-- 01.d.
ALTER TABLE Printer DROP COLUMN price;

-- 01.e.
DROP TABLE Printer;
DROP TABLE Product;

CREATE DATABASE ex9_facebook;

USE ex9_facebook;

-- 02.a.
CREATE TABLE Users(
	id INTEGER,
	email VARCHAR(255),
	password VARCHAR(255),
	registration_date DATETIME DEFAULT GETDATE()
);

CREATE TABLE Friends(
	userID INTEGER,
	friendID INTEGER
);

CREATE TABLE Walls(
	ownerID INTEGER,
	writerID INTEGER,
	text VARCHAR(255),
	date DATETIME DEFAULT GETDATE()
);

CREATE TABLE Groups(
	groupID INTEGER,
	name VARCHAR(255),
	description VARCHAR(255) DEFAULT ''
);

CREATE TABLE GroupMembers(
	userID INTEGER,
	groupID INTEGER
);

-- 02.b.
INSERT INTO Users(id, email, password) VALUES (1, 'u1@abv.bg', '123456');
INSERT INTO Users(id, email, password) VALUES (2, 'u2@abv.bg', '654321');

INSERT INTO Friends(userID, friendID) VALUES (1, 2);
INSERT INTO Friends(userID, friendID) VALUES (2, 1);

INSERT INTO Walls(ownerID, writerID, text) VALUES (2, 1, 'opa ko staa, bro');

INSERT INTO Groups(groupID, name, description) VALUES (1, 'grupichka', 'za birichka');

INSERT INTO GroupMembers(userID, groupID) VALUES (1, 1);
INSERT INTO GroupMembers(userID, groupID) VALUES (2, 1);

SELECT * FROM Users;
SELECT * FROM Friends;
SELECT * FROM Walls;
SELECT * FROM Groups;
SELECT * FROM GroupMembers;