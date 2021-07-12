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
FROM ((PC AS PC1 JOIN PRODUCT AS P1 ON PC1.MODEL = P1.MODEL) CROSS JOIN (PRODUCT AS P2 JOIN PC AS PC2 ON PC2.MODEL = P2.MODEL))
WHERE PC1.CODE != PC2.CODE AND PC1.SPEED >= 400 AND PC2.SPEED >= 400 AND P1.MAKER = P2.MAKER;