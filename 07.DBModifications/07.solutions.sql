---- МОДИФИКАЦИЯ НА ДАННИТЕ В БАЗАТА ОТ ДАННИ: ЗАДАЧИ - 13.04.2021 г. ----

-- 01. Извършете следните модификации в базата от данни Movies:
USE MOVIES

-- 01.1. Да се вмъкне информация за актрисата Nicole Kidman. За нея знаем само, че е родена на 20.06.1967.
INSERT INTO MOVIESTAR (NAME, BIRTHDATE) VALUES ('Nicole Kidman', 1967-06-20);

-- 01.2. Да се изтрият всички продуценти с нетни активи под 30 милиона.
DELETE FROM MOVIEEXEC WHERE NETWORTH < 30000000;

-- 01.3. Да се изтрие информацията за всички филмови звезди, за които не се знае адреса.
DELETE FROM MOVIESTAR WHERE ADDRESS IS NULL;

-- 02. Извършете следните модификации в базата от данни PC:
USE PC

-- 02.1. Използвайте две INSERT заявки. Съхранете в базата данни факта, че персонален компютър модел 1100 е направен от производителя C,
--       има процесор 2400 MHz, RAM 2048 MB, твърд диск 500 GB, 52x оптично дисково устройство и струва $299. Нека новият компютър има код 12.
--       Забележка: модел и CD са от тип низ.
INSERT INTO PC VALUES (12, 1100, 2400, 2048, 500, '52x', 299);
INSERT INTO PRODUCT VALUES ('C', 1100, 'pc');

-- 02.2. Да се изтрие наличната информация в таблицата PC за компютри модел 1100.
DELETE FROM PC WHERE MODEL = 1100;

-- 02.3. Да се изтрият от таблицата Laptop всички лаптопи, направени от производител, който не произвежда принтери.
DELETE FROM LAPTOP WHERE MODEL NOT IN (SELECT MODEL FROM PRODUCT WHERE TYPE = 'laptop' AND MAKER NOT IN (SELECT MAKER FROM PRODUCT WHERE TYPE = 'printer'));

-- 02.4. Производител А купува производител B. На всички продукти на В променете производителя да бъде А.
UPDATE PRODUCT SET MAKER = 'A' WHERE MAKER = 'B';

-- 02.5. Да се намали наполовина цената на всеки компютър и да се добавят по 20 GB към всеки твърд диск.
UPDATE PC SET PRICE = PRICE / 2, HD = HD + 20;

-- 02.6. За всеки лаптоп от производител B добавете по един инч към диагонала на екрана.
UPDATE LAPTOP SET SCREEN = SCREEN + 1 WHERE MODEL IN (SELECT MODEL FROM PRODUCT WHERE MAKER = 'B' AND TYPE = 'laptop');

-- 03. Извършете следните модификации в базата от данни Ships:
USE SHIPS

-- 03.1. Два британски бойни кораба от класа Nelson - Nelson и Rodney - са били пуснати на вода едновременно през 1927 г.
--       Имали са девет 16-инчови оръдия (bore) и водоизместимост от 34000 тона (displacement). Добавете тези факти към базата от данни.
INSERT INTO CLASSES VALUES('Nelson', 'bb', 'Gt.Britain', 9, 16, 34000);
INSERT INTO SHIPS VALUES('Nelson', 'Nelson', 1927);
INSERT INTO SHIPS VALUES('Rodney', 'Nelson', 1927);

-- 03.2. Изтрийте от таблицата Ships всички кораби, които са потънали в битка.
DELETE FROM SHIPS WHERE NAME IN (SELECT SHIP FROM OUTCOMES WHERE RESULT = 'sunk');

-- 03.3. Променете данните в релацията Classes така, че калибърът (bore) да се измерва в сантиметри (в момента е в инчове, 1 инч ~ 2.5 см)
--       и водоизместимостта да се измерва в метрични тонове (1 м.т. = 1.1 т.)
UPDATE CLASSES SET BORE = BORE * 2.5, DISPLACEMENT = DISPLACEMENT / 1.1;