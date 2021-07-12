---- ���� ������ - 30.03.2021 �. ----

-- 01. �� ������ �� ����� MOVIES
USE MOVIES

-- 01.1. �������� ������, ����� ������� �������� � ������ �� ������ �����, ����� �� ��-����� �� 120 ������ � �� ������� ����� 2000 �.
--       ��� ��������� �� ����� � ����������, ���������� � �������� �� ���� ���� ���� �� �� �������.
SELECT TITLE, YEAR, LENGTH
FROM MOVIE
WHERE YEAR < 2000 AND (LENGTH > 120 OR LENGTH IS NULL);

-- 01.2. �������� ������, ����� ������� ��� � ��� �� ������ ������� (���� � ����), ����� ��� ������� � 'J' � �� ������ ���� 1948 ������.
--       ���������� �� ���� �������� �� ��� � ��������� ���.
SELECT NAME, GENDER
FROM MOVIESTAR
WHERE NAME LIKE 'J%' AND YEAR(BIRTHDATE) > 1948
ORDER BY NAME DESC;

-- 01.3. �������� ������, ����� ������� ��� �� ������ � ���� �� ���������, ��������� ��� �����, ����� �� ��������� �� ���� ������.
SELECT STUDIONAME, COUNT(DISTINCT STARNAME) AS NUM_ACTORS
FROM STARSIN JOIN MOVIE ON MOVIETITLE = TITLE
GROUP BY STUDIONAME
HAVING COUNT(STARNAME) > 0;

-- 01.4. �������� ������, ����� �� ����� ������ ������� ��� �� ������� � ���� �� �������, � ����� �������� � ��������.
SELECT STARNAME, COUNT(MOVIETITLE) AS NUM_MOVIES
FROM STARSIN
GROUP BY STARNAME;

-- 01.5. �������� ������, ����� �� ����� ������ ������� ��� �� �������� � �������� �� �����, ������� �������� �� ����� �� ���� ������.
SELECT ST.STUDIONAME, M.TITLE, ST.Y
FROM (SELECT STUDIONAME, MAX(YEAR) AS Y FROM MOVIE GROUP BY STUDIONAME) AS ST JOIN MOVIE AS M ON ST.STUDIONAME = M.STUDIONAME AND ST.Y = M.YEAR  

-- 01.6. �������� ������, ����� ������� ����� �� ���-������ ������ (���).
SELECT TOP 1 NAME
FROM MOVIESTAR
WHERE GENDER = 'M'
ORDER BY BIRTHDATE DESC

-- 01.7. �������� ������, ����� ������� ��� �� ������ � ��� �� ������ �� ���� �������, ��������� � ���-����� ����� �� ���� ������.


-- 01.8. �������� ������, ����� ������� �������� � ������ �� ����� � ���� �� ���������, ��������� � ���� ����, �� ���� ����� � ������ �� ����� �������.
SELECT M1.TITLE, M2.YEAR, ACTORS_COUNT AS NUM_ACTORS 
FROM (SELECT TITLE, COUNT(STARNAME) AS ACTORS_COUNT FROM MOVIE JOIN STARSIN ON TITLE = MOVIETITLE GROUP BY TITLE HAVING COUNT(STARNAME) > 2) AS M1 JOIN MOVIE AS M2 ON M1.TITLE = M2.TITLE;

-- 02. �� ������ �� ����� SHIPS
USE SHIPS

-- 02.1. �������� ������, ����� ������� ������� �� ������ ������ ��� ����������, ����� �� ��������� � ���� ���� ����� � ����� ����� �������� � C ��� K.


-- 02.2. �������� ������, ����� ������� ��� � ������� �� ������ ������, ����� ������ �� �� �������� � ����� (���� � �� �� �� ���������).


-- 02.3. �������� ������, ����� ������� ��������� � ���� �� ���������� ������ �� ���� �������. 
--       �������, ����� ����� ������ ��� ���� �����, �� ��� �� � �������� � �����, ���� �� ����� ��������.


-- 02.4. �������� ������, ����� ������� ��� �� �������, ����� �� ��-������� (� ������ ��������� ������) �� ������� ��� Guadalcanal.


-- 02.5. �������� ������, ����� ������� ��� �� �������, ����� �� ��-������� (� ������ ��������� ������) �� ������� ��� Surigao Strait.


-- 02.6. �������� ������, ����� ������� ������� �� ���-������ ������ � ���-����� ������.
SELECT S.NAME, CL.DISPLACEMENT, CL.NUMGUNS
FROM (SELECT CLASS, DISPLACEMENT, NUMGUNS FROM CLASSES WHERE DISPLACEMENT <= ALL(SELECT DISPLACEMENT FROM CLASSES)) AS CL JOIN SHIPS AS S ON CL.CLASS = S.CLASS
WHERE CL.NUMGUNS >= ALL(SELECT NUMGUNS FROM CLASSES WHERE DISPLACEMENT <= ALL(SELECT DISPLACEMENT FROM CLASSES));

-- 02.7. �������� ���� �� ��������, ����� �� ���� �������� � �����, �� �� ���� ��������� � ��-����� �� �������� � ����� �����.


-- 02.8. �������� ��� �� ��������, ����� �� ���� �������� � �����, �� �� ���� ��������� � ��-����� �� �������� � ��-������� ����� (� ������ ������).


-- 03. �� ������ �� ����� PC
USE PC

-- 03.1. �������� ������, ����� ������� ������ ������ �������, �� ����� �� ��������� ����� ������������� � 15" �����, ���� � � 11" �����.


-- 03.2. �� �� ������� ���������� ������ ��������, ����� ���� � ��-����� �� ���������� ������, ����������� �� ����� ������������.


-- 03.3. ���� ����� �������� ���� �� �� �������� � ������� ������������� � �������� ����.
--		 �� �� ������� ���� ������ ��������, ����� ������ ���� (�� ���������� �� �������������) � ��-����� �� ���-������� ������, ����������� �� ����� ������������.


-- 03.4. �������� ������, ����� ������� �� ����� �������� ��� �� ��������, ������������ � ���� ��������, ����� ���� ����, ��-������ ��� ����� �� ��������.