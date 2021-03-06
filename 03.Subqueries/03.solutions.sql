---- 03. Subqueries ----

-- 01. Movies
USE MOVIES

-- 01.1.
SELECT NAME
FROM MOVIESTAR
WHERE GENDER = 'F' AND NAME IN (SELECT NAME FROM MOVIEEXEC WHERE NETWORTH > 10000000);

-- 01.2.
SELECT NAME
FROM MOVIESTAR
WHERE NAME NOT IN (SELECT NAME FROM MOVIEEXEC)
ORDER BY NAME;

-- 01.3.
SELECT TITLE
FROM MOVIE
WHERE LENGTH > (SELECT LENGTH FROM MOVIE WHERE TITLE = 'Star Wars')
ORDER BY TITLE;

-- 01.4.
SELECT TITLE, MOVIEEXEC.NAME
FROM MOVIE JOIN MOVIEEXEC ON MOVIEEXEC.CERT# = MOVIE.PRODUCERC#
WHERE PRODUCERC# IN (SELECT CERT# FROM MOVIEEXEC WHERE NETWORTH > (SELECT NETWORTH FROM MOVIEEXEC WHERE NAME = 'Merv Griffin'))
ORDER BY TITLE;

-- 02. PC
USE PC

-- 02.1.
SELECT MAKER
FROM PRODUCT
WHERE MODEL IN (SELECT MODEL FROM PC WHERE SPEED > 500);

-- 02.2.
SELECT CODE, MODEL, PRICE
FROM PRINTER
WHERE PRICE >= ALL(SELECT PRICE FROM PRINTER);

-- 02.3.
SELECT *
FROM LAPTOP
WHERE SPEED < ALL(SELECT SPEED FROM PC);

-- 02.4.
SELECT MODEL, PRICE
FROM LAPTOP
WHERE PRICE >= ALL(SELECT PRICE FROM LAPTOP UNION SELECT PRICE FROM PC UNION SELECT PRICE FROM PRINTER)

UNION

SELECT MODEL, PRICE
FROM PC
WHERE PRICE >= ALL(SELECT PRICE FROM LAPTOP UNION SELECT PRICE FROM PC UNION SELECT PRICE FROM PRINTER)

UNION

SELECT MODEL, PRICE
FROM PRINTER
WHERE PRICE >= ALL(SELECT PRICE FROM LAPTOP UNION SELECT PRICE FROM PC UNION SELECT PRICE FROM PRINTER);

-- 02.5.
SELECT MAKER
FROM PRODUCT
WHERE MODEL IN (SELECT MODEL FROM PRINTER WHERE COLOR = 'y' AND PRICE <= ALL(SELECT PRICE FROM PRINTER WHERE COLOR = 'y'));

-- 02.6.
SELECT MAKER
FROM PRODUCT AS P, (SELECT RAM, SPEED, MODEL FROM PC) as T
WHERE T.MODEL = P.MODEL AND T.RAM <= ALL(SELECT RAM FROM PC) AND T.SPEED >= ALL(SELECT SPEED FROM PC WHERE T.RAM = RAM); 

-- 03. Ships
USE SHIPS

-- 03.1.
SELECT DISTINCT COUNTRY
FROM CLASSES
WHERE NUMGUNS >= ALL(SELECT NUMGUNS FROM CLASSES);

-- 03.2.
SELECT DISTINCT CLASS
FROM SHIPS
WHERE NAME IN (SELECT SHIP FROM OUTCOMES WHERE RESULT = 'sunk');

-- 03.3.
SELECT NAME, CLASS
FROM SHIPS
WHERE CLASS IN (SELECT CLASS FROM CLASSES WHERE BORE = '16')
ORDER BY NAME;

-- 03.4.
SELECT BATTLE
FROM OUTCOMES
WHERE SHIP IN (SELECT NAME FROM SHIPS WHERE CLASS = 'Kongo');

-- 03.5.
SELECT CLASS, NAME
FROM SHIPS
WHERE CLASS IN (SELECT CLASS FROM CLASSES AS C WHERE NUMGUNS >= ALL(SELECT NUMGUNS FROM CLASSES WHERE BORE = C.BORE))
ORDER BY CLASS;