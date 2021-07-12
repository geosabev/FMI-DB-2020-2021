---- ������ � SQL ����� ��� � ������ �������: ������ - 02.03.2021 �. ----

-- 01. �� ������ �� ����� Movies
USE MOVIES

-- 01.1. �������� ������, ����� ������� ������� �� ��������� ����, ��������� ��� ����� The Usual Suspects.
SELECT NAME
FROM MOVIESTAR JOIN STARSIN ON NAME = STARNAME
WHERE MOVIETITLE = 'The Usual Suspects' AND GENDER = 'M';

-- 01.2. �������� ������, ����� ������� ������� �� ���������, ��������� ��� ����� �� 1995, ����������� �� ������ MGM.
SELECT STARNAME
FROM STARSIN JOIN MOVIE ON MOVIETITLE = TITLE AND MOVIEYEAR = YEAR
WHERE STUDIONAME = 'MGM' AND MOVIEYEAR = 1995;

-- 01.3. �������� ������, ����� ������� ������� �� ������������, ����� �� ����������� ����� �� ������ MGM.
SELECT DISTINCT MOVIEEXEC.NAME
FROM MOVIE JOIN MOVIEEXEC ON CERT# = PRODUCERC#
WHERE STUDIONAME = 'MGM';

-- 01.4. �������� ������, ����� ������� ������� �� ����� � �������, ��-������ �� ��������� �� ����� Star Wars.
SELECT M1.TITLE
FROM MOVIE AS M1 CROSS JOIN MOVIE AS M2
WHERE M2.TITLE = 'Star Wars' AND M1.LENGTH > M2.LENGTH;

-- 01.5. �������� ������, ����� ������� ������� �� ������������ � ����� ������ ��-������ �� ���� �� Stephen Spielberg.
SELECT EX1.NAME
FROM MOVIEEXEC AS EX1 CROSS JOIN MOVIEEXEC AS EX2
WHERE EX2.NAME = 'Stephen Spielberg' AND EX1.NETWORTH > EX2.NETWORTH;

-- 01.6. �������� ������, ����� ������� ������� �� ������ �����, ����� �� ����������� �� ���������� � ����� ������ ��-������ �� ���� �� Stephen Spielberg.
SELECT TITLE
FROM (MOVIEEXEC AS EX1 CROSS JOIN MOVIEEXEC AS EX2) JOIN MOVIE ON EX1.CERT# = MOVIE.PRODUCERC#
WHERE EX2.NAME = 'Stephen Spielberg' AND EX1.NETWORTH > EX2.NETWORTH 

-- 02. �� ������ �� ����� PC
USE PC

-- 02.1. �������� ������, ����� ������� ������������� � ��������� �� ��������� � ������ �� ����� ���� 9 GB.
SELECT MAKER, SPEED
FROM LAPTOP JOIN PRODUCT ON LAPTOP.MODEL = PRODUCT.MODEL
WHERE HD >= 9;

-- 02.2. �������� ������, ����� ������� ����� � ���� �� ����������, ����������� �� ������������ � ��� B.
SELECT PRODUCT.MODEL, PRICE
FROM PC JOIN PRODUCT ON PC.MODEL = PRODUCT.MODEL
WHERE MAKER = 'B'

UNION

SELECT PRODUCT.MODEL, PRICE
FROM LAPTOP JOIN PRODUCT ON LAPTOP.MODEL = PRODUCT.MODEL
WHERE MAKER = 'B'

UNION

SELECT PRODUCT.MODEL, PRICE
FROM PRINTER JOIN PRODUCT ON PRINTER.MODEL = PRODUCT.MODEL
WHERE MAKER = 'B';

-- 02.3. �������� ������, ����� ������� ���������������, ����� ����������� �������, �� �� ����������� ���������� ��������.
SELECT DISTINCT MAKER
FROM LAPTOP JOIN PRODUCT ON LAPTOP.MODEL = PRODUCT.MODEL

EXCEPT

SELECT DISTINCT MAKER
FROM PC JOIN PRODUCT ON PC.MODEL = PRODUCT.MODEL;

-- 02.4. �������� ������, ����� ������� ��������� �� ���� �������, ����� �� ��������� � ���� ��� �������� ���������� ��������� (��� ��������� � �������� ���).
SELECT DISTINCT PC1.HD
FROM PC AS PC1 JOIN PC AS PC2 ON PC1.HD = PC2.HD
WHERE PC1.CODE <> PC2.CODE;

-- 02.5. �������� ������, ����� ������� �������� ������ �� ���������� ��������, ����� ���� ������� ������� � �����. �������� ������ �� �� �������� ���� �� ������.
SELECT DISTINCT PC1.MODEL, PC2.MODEL
FROM PC AS PC1 JOIN PC AS PC2 ON PC1.SPEED = PC2.SPEED AND PC1.RAM = PC2.RAM
WHERE PC1.MODEL < PC2.MODEL;

-- 02.6. �������� ������, ����� ������� ��������������� �� ���� ��� �������� ���������� ��������� � ������� ���� 400.
SELECT DISTINCT P1.MAKER 
FROM ((PC AS PC1 JOIN PRODUCT AS P1 ON PC1.MODEL = P1.MODEL) CROSS JOIN (PRODUCT AS P2 JOIN PC AS PC2 ON PC2.MODEL = P2.MODEL))
WHERE PC1.CODE != PC2.CODE AND PC1.SPEED >= 400 AND PC2.SPEED >= 400 AND P1.MAKER = P2.MAKER;

-- 03. �� ������ �� ����� SHIPS
USE SHIPS

-- 03.1. �������� ������, ����� ������� ����� �� �������� � ��������������� ��� 50000.
SELECT SHIPS.NAME
FROM SHIPS JOIN CLASSES ON SHIPS.CLASS = CLASSES.CLASS
WHERE DISPLACEMENT >= 50000;

-- 03.2. �������� ������, ����� ������� �������, ����������������� � ���� ������ �� ������ ������, ��������� � ������� ��� Guadalcanal.
SELECT SHIPS.NAME, DISPLACEMENT, NUMGUNS
FROM OUTCOMES JOIN SHIPS ON SHIP = NAME JOIN CLASSES ON CLASSES.CLASS = SHIPS.CLASS
WHERE BATTLE = 'Guadalcanal';

-- 03.3. �������� ������, ����� ������� ������� �� ���� �������, ����� ���� ����� ����� ������, ���� � ����� ��������.
SELECT DISTINCT C1.COUNTRY
FROM CLASSES AS C1 JOIN CLASSES AS C2 ON C1.COUNTRY = C2.COUNTRY
WHERE C1.TYPE = 'bb' AND C2.TYPE = 'bc';

-- 03.4. �������� ������, ����� ������� ������� �� ���� ������, ����� �� ���� ��������� � ���� �����, �� ��-����� �� ��������� � ����� �����.
SELECT O1.SHIP
FROM OUTCOMES AS O1 JOIN BATTLES AS B1 ON O1.BATTLE = B1.NAME JOIN OUTCOMES AS O2 ON O1.SHIP = O2.SHIP JOIN BATTLES AS B2 ON O2.BATTLE = B2.NAME
WHERE B1.DATE < B2.DATE AND O1.RESULT = 'damaged';

SELECT O1.SHIP
FROM ((OUTCOMES AS O1 JOIN BATTLES AS B1 ON O1.BATTLE = B1.NAME) CROSS JOIN (OUTCOMES AS O2 JOIN BATTLES AS B2 ON O2.BATTLE = B2.NAME))
WHERE O1.SHIP = O2.SHIP AND B1.DATE < B2.DATE AND O1.RESULT = 'damaged';