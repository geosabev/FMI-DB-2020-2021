---- ������ ������ � SQL: ������ - 23.02.2021 �. ----

-- 01. �� ������ �� ����� Movies
USE MOVIES

-- 01.1. �������� ������, ����� ������� ������ �� ������ �Disney�.
SELECT ADDRESS
FROM STUDIO
WHERE NAME = 'Disney';

-- 01.2. �������� ������, ����� ������� ��������� ���� �� ������� Jack Nicholson.
SELECT birthdate
FROM MOVIESTAR
WHERE NAME = 'Jack Nicholson';

-- 01.3. �������� ������, ����� ������� ������� �� ���������, ����� �� ��������� ��� ���� �� 1980 ��� ��� ����, � ����� �������� ��� ������ �Knight�.
SELECT STARNAME
FROM STARSIN
WHERE MOVIEYEAR=1980 OR MOVIETITLE LIKE 'Knight';

-- 01.4. �������� ������, ����� ������� ������� �� ������������ � ����� ������ ��� 10 000 000 ������.
SELECT NAME
FROM MOVIEEXEC
WHERE NETWORTH > 10000000;

-- 01.5. �������� ������, ����� ������� ������� �� ���������, ����� �� ���� ��� ������ �� Prefect Rd.
SELECT NAME
FROM MOVIESTAR
WHERE GENDER = 'm' OR ADDRESS LIKE 'Perfect Rd.';

-- 02. �� ������ �� ����� PC
USE PC

-- 02.1. �������� ������, ����� ������� �����, ������� � ������ �� ����� �� ������ ���������� �������� � ���� ��� 1200 ������. 
--		 ������� ���������� �� ���������� ������� � ������ �� �����, ��������� MHz � GB.
SELECT MODEL, SPEED AS MHz, HD AS GB
FROM PC
WHERE PRICE < 1200;

-- 02.2. �������� ������, ����� ������� ��������������� �� �������� ��� ����������.
SELECT DISTINCT MAKER
FROM PRODUCT
WHERE TYPE = 'Printer';

-- 02.3. �������� ������, ����� ������� �����, ������ �� �������, ������ �� ����� �� ���������, ����� ���� � ��� 1000 ������.
SELECT MODEL, RAM, SCREEN
FROM LAPTOP
WHERE PRICE > 1000;

-- 02.4. �������� ������, ����� ������� ������ ������ ��������.
SELECT *
FROM PRINTER
WHERE COLOR = 'y';

-- 02.5. �������� ������, ����� ������� �����, ������� � ������ �� ����� �� ���� ���������� �������� ��� CD 12x ��� 16x � ���� ��� 2000 ������.
SELECT MODEL, SPEED, HD
FROM PC
WHERE CD IN ('12x', '16x') AND PRICE < 2000;

-- 03. �� ������ �� ����� SHIPS
USE SHIPS

-- 03.1. �������� ������, ����� ������� ����� � �������� �� ������ ������� � ��-����� �� 10 ������.
SELECT CLASS, COUNTRY
FROM CLASSES
WHERE NUMGUNS < 10;

-- 03.2. �������� ������, ����� ������� ������� �� ��������, ������� �� ���� ����� 1918. ������� ��������� shipName �� ��������.
SELECT NAME AS SHIPNAME
FROM SHIPS
WHERE LAUNCHED < 1918;

-- 03.3. �������� ������, ����� ������� ������� �� ��������, �������� � ����� � ������� �� ����������� �����.
SELECT SHIP, BATTLE
FROM OUTCOMES
WHERE RESULT = 'sunk';

-- 03.4. �������� ������, ����� ������� ������� �� �������� � ���, ��������� � ����� �� ������ ����.
SELECT NAME
FROM SHIPS
WHERE NAME = CLASS;

-- 03.5. �������� ������, ����� ������� ������� �� ��������, ����� �������� � ������� R.
SELECT NAME
FROM SHIPS
WHERE NAME like 'R%';

-- 03.6. �������� ������, ����� ������� ������� �� ��������, ����� �������� 2 ��� ������ ����.
SELECT NAME
FROM SHIPS
WHERE NAME LIKE '% %'