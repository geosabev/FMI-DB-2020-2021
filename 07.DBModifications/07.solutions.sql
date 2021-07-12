---- ����������� �� ������� � ������ �� �����: ������ - 13.04.2021 �. ----

-- 01. ��������� �������� ����������� � ������ �� ����� Movies:
USE MOVIES

-- 01.1. �� �� ������ ���������� �� ��������� Nicole Kidman. �� ��� ����� ����, �� � ������ �� 20.06.1967.
INSERT INTO MOVIESTAR (NAME, BIRTHDATE) VALUES ('Nicole Kidman', 1967-06-20);

-- 01.2. �� �� ������� ������ ���������� � ����� ������ ��� 30 �������.
DELETE FROM MOVIEEXEC WHERE NETWORTH < 30000000;

-- 01.3. �� �� ������ ������������ �� ������ ������� ������, �� ����� �� �� ���� ������.
DELETE FROM MOVIESTAR WHERE ADDRESS IS NULL;

-- 02. ��������� �������� ����������� � ������ �� ����� PC:
USE PC

-- 02.1. ����������� ��� INSERT ������. ��������� � ������ ����� �����, �� ���������� �������� ����� 1100 � �������� �� ������������� C,
--       ��� �������� 2400 MHz, RAM 2048 MB, ����� ���� 500 GB, 52x ������� ������� ���������� � ������ $299. ���� ������ �������� ��� ��� 12.
--       ���������: ����� � CD �� �� ��� ���.
INSERT INTO PC VALUES (12, 1100, 2400, 2048, 500, '52x', 299);
INSERT INTO PRODUCT VALUES ('C', 1100, 'pc');

-- 02.2. �� �� ������ ��������� ���������� � ��������� PC �� �������� ����� 1100.
DELETE FROM PC WHERE MODEL = 1100;

-- 02.3. �� �� ������� �� ��������� Laptop ������ �������, ��������� �� ������������, ����� �� ���������� ��������.
DELETE FROM LAPTOP WHERE MODEL NOT IN (SELECT MODEL FROM PRODUCT WHERE TYPE = 'laptop' AND MAKER NOT IN (SELECT MAKER FROM PRODUCT WHERE TYPE = 'printer'));

-- 02.4. ������������ � ������ ������������ B. �� ������ �������� �� � ��������� ������������� �� ���� �.
UPDATE PRODUCT SET MAKER = 'A' WHERE MAKER = 'B';

-- 02.5. �� �� ������ ���������� ������ �� ����� �������� � �� �� ������� �� 20 GB ��� ����� ����� ����.
UPDATE PC SET PRICE = PRICE / 2, HD = HD + 20;

-- 02.6. �� ����� ������ �� ������������ B �������� �� ���� ��� ��� ��������� �� ������.
UPDATE LAPTOP SET SCREEN = SCREEN + 1 WHERE MODEL IN (SELECT MODEL FROM PRODUCT WHERE MAKER = 'B' AND TYPE = 'laptop');

-- 03. ��������� �������� ����������� � ������ �� ����� Ships:
USE SHIPS

-- 03.1. ��� ��������� ����� ������ �� ����� Nelson - Nelson � Rodney - �� ���� ������� �� ���� ������������ ���� 1927 �.
--       ����� �� ����� 16-������ ������ (bore) � ��������������� �� 34000 ���� (displacement). �������� ���� ����� ��� ������ �� �����.
INSERT INTO CLASSES VALUES('Nelson', 'bb', 'Gt.Britain', 9, 16, 34000);
INSERT INTO SHIPS VALUES('Nelson', 'Nelson', 1927);
INSERT INTO SHIPS VALUES('Rodney', 'Nelson', 1927);

-- 03.2. �������� �� ��������� Ships ������ ������, ����� �� �������� � �����.
DELETE FROM SHIPS WHERE NAME IN (SELECT SHIP FROM OUTCOMES WHERE RESULT = 'sunk');

-- 03.3. ��������� ������� � ��������� Classes ����, �� ��������� (bore) �� �� ������� � ���������� (� ������� � � ������, 1 ��� ~ 2.5 ��)
--       � ����������������� �� �� ������� � �������� ������ (1 �.�. = 1.1 �.)
UPDATE CLASSES SET BORE = BORE * 2.5, DISPLACEMENT = DISPLACEMENT / 1.1;