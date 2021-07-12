---- ����������: ������ - 16.03.2021 �. ----

-- 01. �� ������ �� ����� Movies
USE MOVIES

-- 01.1. �������� ������, ����� ������� ����� �� ���������� � ������� �� �������, ����������� �� ���������� �� ����� Star Wars.
SELECT TITLE, NAME
FROM MOVIEEXEC JOIN MOVIE ON CERT# = PRODUCERC#
WHERE PRODUCERC# = (SELECT PRODUCERC# FROM MOVIE WHERE TITLE = 'Star Wars');

-- 01.2. �������� ������, ����� ������� ������� �� ������������ �� �������, � ����� � �������� Harrison Ford.
SELECT DISTINCT NAME
FROM MOVIEEXEC JOIN MOVIE ON CERT# = PRODUCERC# JOIN STARSIN ON MOVIETITLE = TITLE
WHERE STARNAME = 'Harrison Ford';

-- 01.3. �������� ������, ����� ������� ����� �� �������� � ������� �� ���������, ��������� ��� �����, ����������� �� ���� ������, ��������� �� ��� �� ������.
SELECT DISTINCT STUDIONAME, STARNAME
FROM MOVIE JOIN STARSIN ON TITLE = MOVIETITLE
ORDER BY STUDIONAME;

-- 01.4. �������� ������, ����� ������� ������� �� ���������, ��������� ��� ����� �� ���������� � ���-������ ����� ������.
SELECT STARNAME, NETWORTH, TITLE
FROM MOVIE JOIN STARSIN ON TITLE = MOVIETITLE JOIN MOVIEEXEC ON CERT# = PRODUCERC#
WHERE NETWORTH >= ALL(SELECT NETWORTH FROM MOVIEEXEC);

-- 01.5. �������� ������, ����� ������� ������� �� ���������, ����� �� �� ��������� � ���� ���� ����.SELECT NAME, MOVIETITLEFROM MOVIESTAR LEFT JOIN STARSIN ON NAME = STARNAME WHERE MOVIETITLE IS NULL;
-- 02. �� ������ �� ����� PCUSE PC-- 02.1. �������� ������, ����� ������� ������������, ����� � ��� �� ������� �� ���� �������������,--       �� ����� ����������� ������� �� �� ������� (���� �� � ��������� PC, Laptop ��� Printer).SELECT PRODUCT.MAKER, PRODUCT.MODEL, PRODUCT.TYPEFROM PRODUCT LEFT JOIN PC ON PRODUCT.MODEL = PC.MODEL 	LEFT JOIN LAPTOP ON PRODUCT.MODEL = LAPTOP.MODEL	LEFT JOIN PRINTER ON PRODUCT.MODEL = PRINTER.MODELWHERE PC.CODE IS NULL AND LAPTOP.CODE IS NULL AND PRINTER.CODE IS NULL;-- 02.2. �������� ������ �������������, ����� ������ ����� �������, ���� � ��������.SELECT PRODUCT.MAKERFROM LAPTOP JOIN PRODUCT ON LAPTOP.MODEL = PRODUCT.MODELINTERSECTSELECT PRODUCT.MAKER FROM PRINTER JOIN PRODUCT ON PRINTER.MODEL = PRODUCT.MODEL;-- 02.3. �������� ��������� �� ���� ������ �������, ����� �� �������� � ��� ��� ������ ������ �������.SELECT DISTINCT L1.HDFROM LAPTOP AS L1 JOIN LAPTOP AS L2 ON L1.HD = L2.HDWHERE L1.MODEL != L2.MODEL;SELECT DISTINCT L1.HDFROM LAPTOP AS L1 CROSS JOIN LAPTOP AS L2WHERE L1.MODEL != L2.MODEL AND L1.HD = L2.HD;-- 02.4. �������� ������ ������ ���������� ��������, ����� ����� ����������� ������������.SELECT PC.MODELFROM PC LEFT JOIN PRODUCT ON PC.MODEL = PRODUCT.MODELWHERE PRODUCT.MAKER IS NULL;-- 03. �� ������ �� ����� SHIPSUSE SHIPS-- 03.1. �������� ������, ����� ������� ������ ������� ���������� �� ����� �����, ����������� � ������� �� ������� ����.--       � ��������� �� ������ �� �� �������� ���� �������, ����� ����� ������.SELECT *FROM SHIPS JOIN CLASSES ON SHIPS.CLASS = CLASSES.CLASS;-- 03.2. ��������� ������� ������, ���� ���� ��� �������� � ��������� � ���������, ����� ����� ������, �� ����������� ������ ��� ������ ��� ���� �������.SELECT *FROM SHIPS RIGHT JOIN CLASSES ON SHIPS.CLASS = CLASSES.CLASS-- 03.3. �� ����� ������ �������� ������� �� ��������, ����� ������ �� �� ��������� � �����.SELECT CLASSES.COUNTRY, SHIPS.NAMEFROM SHIPS LEFT JOIN OUTCOMES ON SHIPS.NAME = OUTCOMES.SHIP JOIN CLASSES ON SHIPS.CLASS = CLASSES.CLASSWHERE OUTCOMES.SHIP IS NULLORDER BY CLASSES.COUNTRY;-- 03.4. �������� ������� �� ������ ������ � ���� 7 ������, ������� �� ���� ���� 1916, �� �������� ������������ ������ Ship Name.SELECT SHIPS.NAME AS 'Ship Name'FROM SHIPS JOIN CLASSES ON SHIPS.CLASS = CLASSES.CLASSWHERE NUMGUNS >= 7 AND LAUNCHED = 1916;-- 03.5. �������� ������� �� ������ �������� � ����� ������, ����� � ���� �� ���������� �� �������, � ����� �� �� ��������. ��������� ��������� �� ��� �� �������.
SELECT OUTCOMES.SHIP, OUTCOMES.BATTLE, BATTLES.DATE
FROM OUTCOMES JOIN BATTLES ON OUTCOMES.BATTLE = BATTLES.NAME
WHERE OUTCOMES.RESULT = 'sunk' 
ORDER BY OUTCOMES.BATTLE;

-- 03.6. �������� �����, ����������������� � �������� �� ������� �� ���� �� ������ ������, ����� ���� ������ ��� ���� ������ ����.
SELECT SHIPS.NAME, CLASSES.DISPLACEMENT, SHIPS.LAUNCHED
FROM SHIPS JOIN CLASSES ON SHIPS.CLASS = CLASSES.CLASS
WHERE SHIPS.NAME = SHIPS.CLASS;

-- 03.7. �������� ������ ������� ������, �� ����� ���� ������ �� ���� ���� ���� �����.
SELECT CLASSES.*
FROM CLASSES LEFT JOIN SHIPS ON CLASSES.CLASS = SHIPS.CLASS
WHERE SHIPS.LAUNCHED IS NULL;

-- 03.8. �������� �����, ����������������� � ���� ������ �� ��������, ��������� � ������� �North Atlantic�, � ���� � ��������� �� �������.
SELECT SHIPS.NAME, CLASSES.DISPLACEMENT, CLASSES.NUMGUNS, OUTCOMES.RESULT
FROM CLASSES JOIN SHIPS ON CLASSES.CLASS = SHIPS.CLASS JOIN OUTCOMES ON SHIPS.NAME = OUTCOMES.SHIP
WHERE OUTCOMES.BATTLE = 'North Atlantic';