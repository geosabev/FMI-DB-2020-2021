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

-- 01.5. �������� ������, ����� ������� ������� �� ���������, ����� �� �� ��������� � ���� ���� ����.
-- 02. �� ������ �� ����� PC
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