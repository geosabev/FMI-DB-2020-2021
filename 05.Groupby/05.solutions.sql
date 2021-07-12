---- ГРУПИРАНЕ: ЗАДАЧИ - 23.03.2021 г. ----

-- 01. За базата от данни PC
USE PC

-- 01.1. Напишете заявка, която извежда средната честота на персоналните компютри.SELECT CAST(AVG(SPEED) AS DECIMAL(10,2)) AS AvgSpeedFROM PC;-- 01.2. Напишете заявка, която извежда средния размер на екраните на лаптопите за всеки производител.SELECT MAKER, AVG(SCREEN) AS AvgScreenFROM LAPTOP JOIN PRODUCT ON LAPTOP.MODEL = PRODUCT.MODELGROUP BY PRODUCT.MAKERORDER BY PRODUCT.MAKER;-- 01.3. Напишете заявка, която извежда средната честота на лаптопите с цена над 1000.SELECT CAST(AVG(SPEED) AS DECIMAL(10,2)) AS AvgSpeedFROM LAPTOPWHERE PRICE > 1000;-- 01.4. Напишете заявка, която извежда средната цена на персоналните компютри, произведени от производител ‘A’.SELECT CAST(AVG(PRICE) AS DECIMAL(10,2)) AS AvgPriceFROM PC JOIN PRODUCT ON PC.MODEL = PRODUCT.MODELWHERE PRODUCT.MAKER = 'A';-- 01.5. Напишете заявка, която извежда средната цена на персоналните компютри и лаптопите за производител ‘B’.SELECT P.MAKER, AVG(PRICE) AS AvgPriceFROM (SELECT MODEL, PRICE FROM PC UNION ALL SELECT MODEL, PRICE FROM LAPTOP) AS PR1 JOIN PRODUCT AS P ON PR1.MODEL = P.MODELWHERE P.MAKER = 'B'GROUP BY P.MAKER;-- 01.6. Напишете заявка, която извежда средната цена на персоналните компютри според различните им честоти.
SELECT SPEED, AVG(PRICE) AS AvgPrice
FROM PC
GROUP BY SPEED
ORDER BY SPEED;

-- 01.7. Напишете заявка, която извежда производителите, които са произвели поне 3 различни персонални компютъра (с различен код).
SELECT PRODUCT.MAKER, COUNT(PRODUCT.MODEL) AS number_of_pc
FROM PC JOIN PRODUCT ON PC.MODEL = PRODUCT.MODEL
GROUP BY PRODUCT.MAKER
HAVING COUNT(PRODUCT.MODEL)>=3;

-- 01.8. Напишете заявка, която извежда производителите с най-висока цена на персонален компютър.
SELECT PRODUCT.MAKER, PC.PRICE
FROM PC JOIN PRODUCT ON PC.MODEL = PRODUCT.MODEL
WHERE PRICE >= ALL(SELECT PRICE FROM PC);

-- 01.9. Напишете заявка, която извежда средната цена на персоналните компютри за всяка честота по-голяма от 800.
SELECT SPEED, AVG(PRICE) AS AvgPrice
FROM PC
WHERE SPEED > 800
GROUP BY SPEED
ORDER BY SPEED;

-- 01.10. Напишете заявка, която извежда средния размер на диска на тези персонални компютри, произведени от производители, които произвеждат и принтери.
--		  Резултатът да се изведе за всеки отделен производител.
SELECT PRODUCT.MAKER, AVG(PC.HD) AS AvgHDD
FROM PC JOIN PRODUCT ON PC.MODEL = PRODUCT.MODEL
WHERE PRODUCT.MAKER IN (SELECT DISTINCT PRODUCT.MAKER FROM PRINTER JOIN PRODUCT ON PRINTER.MODEL = PRODUCT.MODEL)
GROUP BY PRODUCT.MAKER;

-- 02. За базата от данни SHIPSUSE SHIPS-- 02.1. Напишете заявка, която извежда броя на класовете бойни кораби.
SELECT COUNT(DISTINCT CLASS) AS NO_Classes
FROM CLASSES
WHERE TYPE = 'bb';

-- 02.2. Напишете заявка, която извежда средния брой оръдия за всеки клас боен кораб.
SELECT CLASS, AVG(NUMGUNS) AS avgGuns
FROM CLASSES
WHERE TYPE = 'bb'
GROUP BY CLASS

-- 02.3. Напишете заявка, която извежда средния брой оръдия за всички бойни кораби.
SELECT AVG(NUMGUNS) AS avgGuns
FROM CLASSES

-- 02.4. Напишете заявка, която извежда за всеки клас първата и последната година, в която кораб от съответния клас е пуснат на вода.
SELECT CLASS, MIN(LAUNCHED) AS FirstYear, MAX(LAUNCHED) AS LastYear
FROM SHIPS
GROUP BY CLASS;

-- 02.5. Напишете заявка, която извежда броя на корабите, потънали в битка според класа.
SELECT SHIPS.CLASS, COUNT(OUTCOMES.SHIP) AS No_Sunk
FROM SHIPS JOIN OUTCOMES ON SHIPS.NAME = OUTCOMES.SHIP
WHERE OUTCOMES.RESULT = 'sunk'
GROUP BY SHIPS.CLASS;

-- 02.6. Напишете заявка, която извежда броя на корабите, потънали в битка според класа, за тези класове с повече от 2 кораба.
SELECT CLASS, COUNT(*) AS No_Sunk
FROM SHIPS JOIN OUTCOMES ON SHIPS.NAME = OUTCOMES.SHIP
WHERE OUTCOMES.RESULT = 'sunk' AND SHIPS.CLASS IN (SELECT CLASSES.CLASS FROM SHIPS JOIN CLASSES ON SHIPS.CLASS = CLASSES.CLASS GROUP BY CLASSES.CLASS HAVING COUNT(CLASSES.CLASS) >= 2)
GROUP BY SHIPS.CLASS

-- 02.7. Напишете заявка, която извежда средния калибър на оръдията на корабите за всяка страна.
SELECT COUNTRY, AVG(BORE) AS avg_bore
FROM CLASSES JOIN SHIPS ON CLASSES.CLASS = SHIPS.CLASS
GROUP BY COUNTRY;