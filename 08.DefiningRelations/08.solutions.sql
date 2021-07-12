---- ДЕФИНИРАНЕ НА СХЕМИ НА РЕЛАЦИИ: ЗАДАЧИ - 20.04.2021 г. ----

-- CREATE DATABASE ex9_products

USE ex9_products;

-- 01.а. Дефинирайте следните релации:
--       Product (maker, model, type), където: модел е низ от точно 4 символа, производител е низ от точно 1 символ, тип е низ до 7 символа;
--		 Printer (code, model, price), където: код е цяло число, модел е низ от точно 4 символа, цена с точност до два знака след десетичната запетая.
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

-- 01.б. Добавете кортежи с примерни данни към новосъздадените релации.
INSERT INTO Product (maker, model, type) VALUES ('A', '1', 'printer');
INSERT INTO Printer (code, model, price) VALUES (5, '1', 260.50);

-- 01.в. Добавете към релацията Printer атрибути:
--       type - низ до 6 символа (забележка: type може да приема стойност 'laser', 'matrix' или 'jet'),
--       color - низ от точно 1 символ, стойност по подразбиране 'n' (забележка: color може да приема стойност 'y' или 'n').
ALTER TABLE Printer ADD type VARCHAR(6);
ALTER TABLE Printer ADD color CHAR(1) DEFAULT 'n';

-- 01.г. Напишете заявка, която премахва атрибута price от релацията Printer.
ALTER TABLE Printer DROP COLUMN price;

-- 01.д. Изтрийте релациите, които сте създали в Задача 1.
DROP TABLE Printer;
DROP TABLE Product;

-- CREATE DATABASE ex9_facebook;

USE ex9_facebook;

-- 02.а Нека създадем мини вариант на Facebook. Искаме да имаме следните релации (може да предложите и друг вариант):
--      Users: уникален номер (id), email, парола, дата на регистрация.
--      Friends: двойки от номера на потребители, напр. ако 12 е приятел на 21, 25 и 40, ще има кортежи (12,21), (12,25), (12,40).
--      Walls: номер на потребител, номер на потребител написал съобщението, текст на съобщението, дата.
--      Groups: уникален номер, име, описание (по подразбиране - празен низ).
--      GroupMembers: двойки от вида номер на група - номер на потребител.

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

-- 02.б. Добавете кортежи с примерни данни към новосъздадените релации
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