---- ПРОСТИ ЗАЯВКИ В SQL: ЗАДАЧИ - 23.02.2021 г. ----

-- 01. За базата от данни Movies
USE MOVIES

-- 01.1. Напишете заявка, която извежда адреса на студио ‘Disney’.
SELECT ADDRESS
FROM STUDIO
WHERE NAME = 'Disney';

-- 01.2. Напишете заявка, която извежда рождената дата на актьора Jack Nicholson.
SELECT birthdate
FROM MOVIESTAR
WHERE NAME = 'Jack Nicholson';

-- 01.3. Напишете заявка, която извежда имената на актьорите, които са участвали във филм от 1980 или във филм, в чието заглавие има думата ‘Knight’.
SELECT STARNAME
FROM STARSIN
WHERE MOVIEYEAR=1980 OR MOVIETITLE LIKE 'Knight';

-- 01.4. Напишете заявка, която извежда имената на продуцентите с нетни активи над 10 000 000 долара.
SELECT NAME
FROM MOVIEEXEC
WHERE NETWORTH > 10000000;

-- 01.5. Напишете заявка, която извежда имената на актьорите, които са мъже или живеят на Prefect Rd.
SELECT NAME
FROM MOVIESTAR
WHERE GENDER = 'm' OR ADDRESS LIKE 'Perfect Rd.';

-- 02. За базата от данни PC
USE PC

-- 02.1. Напишете заявка, която извежда модел, честота и размер на диска за всички персонални компютри с цена под 1200 долара. 
--		 Задайте псевдоними за атрибутите честота и размер на диска, съответно MHz и GB.
SELECT MODEL, SPEED AS MHz, HD AS GB
FROM PC
WHERE PRICE < 1200;

-- 02.2. Напишете заявка, която извежда производителите на принтери без повторения.
SELECT DISTINCT MAKER
FROM PRODUCT
WHERE TYPE = 'Printer';

-- 02.3. Напишете заявка, която извежда модел, размер на паметта, размер на екран за лаптопите, чиято цена е над 1000 долара.
SELECT MODEL, RAM, SCREEN
FROM LAPTOP
WHERE PRICE > 1000;

-- 02.4. Напишете заявка, която извежда всички цветни принтери.
SELECT *
FROM PRINTER
WHERE COLOR = 'y';

-- 02.5. Напишете заявка, която извежда модел, честота и размер на диска за тези персонални компютри със CD 12x или 16x и цена под 2000 долара.
SELECT MODEL, SPEED, HD
FROM PC
WHERE CD IN ('12x', '16x') AND PRICE < 2000;

-- 03. За базата от данни SHIPS
USE SHIPS

-- 03.1. Напишете заявка, която извежда класа и страната за всички класове с по-малко от 10 оръдия.
SELECT CLASS, COUNTRY
FROM CLASSES
WHERE NUMGUNS < 10;

-- 03.2. Напишете заявка, която извежда имената на корабите, пуснати на вода преди 1918. Задайте псевдоним shipName на колоната.
SELECT NAME AS SHIPNAME
FROM SHIPS
WHERE LAUNCHED < 1918;

-- 03.3. Напишете заявка, която извежда имената на корабите, потънали в битка и имената на съответните битки.
SELECT SHIP, BATTLE
FROM OUTCOMES
WHERE RESULT = 'sunk';

-- 03.4. Напишете заявка, която извежда имената на корабите с име, съвпадащо с името на техния клас.
SELECT NAME
FROM SHIPS
WHERE NAME = CLASS;

-- 03.5. Напишете заявка, която извежда имената на корабите, които започват с буквата R.
SELECT NAME
FROM SHIPS
WHERE NAME like 'R%';

-- 03.6. Напишете заявка, която извежда имената на корабите, които съдържат 2 или повече думи.
SELECT NAME
FROM SHIPS
WHERE NAME LIKE '% %'