---- ���������: ������ - 23.03.2021 �. ----

-- 01. �� ������ �� ����� PC
USE PC

-- 01.1. �������� ������, ����� ������� �������� ������� �� ������������ ��������.SELECT CAST(AVG(SPEED) AS DECIMAL(10,2)) AS AvgSpeedFROM PC;-- 01.2. �������� ������, ����� ������� ������� ������ �� �������� �� ��������� �� ����� ������������.SELECT MAKER, AVG(SCREEN) AS AvgScreenFROM LAPTOP JOIN PRODUCT ON LAPTOP.MODEL = PRODUCT.MODELGROUP BY PRODUCT.MAKERORDER BY PRODUCT.MAKER;-- 01.3. �������� ������, ����� ������� �������� ������� �� ��������� � ���� ��� 1000.SELECT CAST(AVG(SPEED) AS DECIMAL(10,2)) AS AvgSpeedFROM LAPTOPWHERE PRICE > 1000;-- 01.4. �������� ������, ����� ������� �������� ���� �� ������������ ��������, ����������� �� ������������ �A�.SELECT CAST(AVG(PRICE) AS DECIMAL(10,2)) AS AvgPriceFROM PC JOIN PRODUCT ON PC.MODEL = PRODUCT.MODELWHERE PRODUCT.MAKER = 'A';-- 01.5. �������� ������, ����� ������� �������� ���� �� ������������ �������� � ��������� �� ������������ �B�.SELECT P.MAKER, AVG(PRICE) AS AvgPriceFROM (SELECT MODEL, PRICE FROM PC UNION ALL SELECT MODEL, PRICE FROM LAPTOP) AS PR1 JOIN PRODUCT AS P ON PR1.MODEL = P.MODELWHERE P.MAKER = 'B'GROUP BY P.MAKER;-- 01.6. �������� ������, ����� ������� �������� ���� �� ������������ �������� ������ ���������� �� �������.
SELECT SPEED, AVG(PRICE) AS AvgPrice
FROM PC
GROUP BY SPEED
ORDER BY SPEED;

-- 01.7. �������� ������, ����� ������� ���������������, ����� �� ��������� ���� 3 �������� ���������� ��������� (� �������� ���).
SELECT PRODUCT.MAKER, COUNT(PRODUCT.MODEL) AS number_of_pc
FROM PC JOIN PRODUCT ON PC.MODEL = PRODUCT.MODEL
GROUP BY PRODUCT.MAKER
HAVING COUNT(PRODUCT.MODEL)>=3;

-- 01.8. �������� ������, ����� ������� ��������������� � ���-������ ���� �� ���������� ��������.
SELECT PRODUCT.MAKER, PC.PRICE
FROM PC JOIN PRODUCT ON PC.MODEL = PRODUCT.MODEL
WHERE PRICE >= ALL(SELECT PRICE FROM PC);

-- 01.9. �������� ������, ����� ������� �������� ���� �� ������������ �������� �� ����� ������� ��-������ �� 800.
SELECT SPEED, AVG(PRICE) AS AvgPrice
FROM PC
WHERE SPEED > 800
GROUP BY SPEED
ORDER BY SPEED;

-- 01.10. �������� ������, ����� ������� ������� ������ �� ����� �� ���� ���������� ��������, ����������� �� �������������, ����� ����������� � ��������.
--		  ���������� �� �� ������ �� ����� ������� ������������.
SELECT PRODUCT.MAKER, AVG(PC.HD) AS AvgHDD
FROM PC JOIN PRODUCT ON PC.MODEL = PRODUCT.MODEL
WHERE PRODUCT.MAKER IN (SELECT DISTINCT PRODUCT.MAKER FROM PRINTER JOIN PRODUCT ON PRINTER.MODEL = PRODUCT.MODEL)
GROUP BY PRODUCT.MAKER;

-- 02. �� ������ �� ����� SHIPSUSE SHIPS-- 02.1. �������� ������, ����� ������� ���� �� ��������� ����� ������.
SELECT COUNT(DISTINCT CLASS) AS NO_Classes
FROM CLASSES
WHERE TYPE = 'bb';

-- 02.2. �������� ������, ����� ������� ������� ���� ������ �� ����� ���� ���� �����.
SELECT CLASS, AVG(NUMGUNS) AS avgGuns
FROM CLASSES
WHERE TYPE = 'bb'
GROUP BY CLASS

-- 02.3. �������� ������, ����� ������� ������� ���� ������ �� ������ ����� ������.
SELECT AVG(NUMGUNS) AS avgGuns
FROM CLASSES

-- 02.4. �������� ������, ����� ������� �� ����� ���� ������� � ���������� ������, � ����� ����� �� ���������� ���� � ������ �� ����.
SELECT CLASS, MIN(LAUNCHED) AS FirstYear, MAX(LAUNCHED) AS LastYear
FROM SHIPS
GROUP BY CLASS;

-- 02.5. �������� ������, ����� ������� ���� �� ��������, �������� � ����� ������ �����.
SELECT SHIPS.CLASS, COUNT(OUTCOMES.SHIP) AS No_Sunk
FROM SHIPS JOIN OUTCOMES ON SHIPS.NAME = OUTCOMES.SHIP
WHERE OUTCOMES.RESULT = 'sunk'
GROUP BY SHIPS.CLASS;

-- 02.6. �������� ������, ����� ������� ���� �� ��������, �������� � ����� ������ �����, �� ���� ������� � ������ �� 2 ������.
SELECT CLASS, COUNT(*) AS No_Sunk
FROM SHIPS JOIN OUTCOMES ON SHIPS.NAME = OUTCOMES.SHIP
WHERE OUTCOMES.RESULT = 'sunk' AND SHIPS.CLASS IN (SELECT CLASSES.CLASS FROM SHIPS JOIN CLASSES ON SHIPS.CLASS = CLASSES.CLASS GROUP BY CLASSES.CLASS HAVING COUNT(CLASSES.CLASS) >= 2)
GROUP BY SHIPS.CLASS

-- 02.7. �������� ������, ����� ������� ������� ������� �� �������� �� �������� �� ����� ������.
SELECT COUNTRY, AVG(BORE) AS avg_bore
FROM CLASSES JOIN SHIPS ON CLASSES.CLASS = SHIPS.CLASS
GROUP BY COUNTRY;