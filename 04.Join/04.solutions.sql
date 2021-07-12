---- СЪЕДИНЕНИЯ: ЗАДАЧИ - 16.03.2021 г. ----

-- 01. За базата от данни Movies
USE MOVIES

-- 01.1. Напишете заявка, която извежда името на продуцента и имената на филмите, продуцирани от продуцента на филма Star Wars.
SELECT TITLE, NAME
FROM MOVIEEXEC JOIN MOVIE ON CERT# = PRODUCERC#
WHERE PRODUCERC# = (SELECT PRODUCERC# FROM MOVIE WHERE TITLE = 'Star Wars');

-- 01.2. Напишете заявка, която извежда имената на продуцентите на филмите, в които е участвал Harrison Ford.
SELECT DISTINCT NAME
FROM MOVIEEXEC JOIN MOVIE ON CERT# = PRODUCERC# JOIN STARSIN ON MOVIETITLE = TITLE
WHERE STARNAME = 'Harrison Ford';

-- 01.3. Напишете заявка, която извежда името на студиото и имената на актьорите, участвали във филми, произведени от това студио, подредени по име на студио.
SELECT DISTINCT STUDIONAME, STARNAME
FROM MOVIE JOIN STARSIN ON TITLE = MOVIETITLE
ORDER BY STUDIONAME;

-- 01.4. Напишете заявка, която извежда имената на актьорите, участвали във филми на продуценти с най-големи нетни активи.
SELECT STARNAME, NETWORTH, TITLE
FROM MOVIE JOIN STARSIN ON TITLE = MOVIETITLE JOIN MOVIEEXEC ON CERT# = PRODUCERC#
WHERE NETWORTH >= ALL(SELECT NETWORTH FROM MOVIEEXEC);

-- 01.5. Напишете заявка, която извежда имената на актьорите, които не са участвали в нито един филм.SELECT NAME, MOVIETITLEFROM MOVIESTAR LEFT JOIN STARSIN ON NAME = STARNAME WHERE MOVIETITLE IS NULL;
-- 02. За базата от данни PCUSE PC-- 02.1. Напишете заявка, която извежда производител, модел и тип на продукт за тези производители,--       за които съответният продукт не се продава (няма го в таблиците PC, Laptop или Printer).SELECT PRODUCT.MAKER, PRODUCT.MODEL, PRODUCT.TYPEFROM PRODUCT LEFT JOIN PC ON PRODUCT.MODEL = PC.MODEL 	LEFT JOIN LAPTOP ON PRODUCT.MODEL = LAPTOP.MODEL	LEFT JOIN PRINTER ON PRODUCT.MODEL = PRINTER.MODELWHERE PC.CODE IS NULL AND LAPTOP.CODE IS NULL AND PRINTER.CODE IS NULL;-- 02.2. Намерете всички производители, които правят както лаптопи, така и принтери.SELECT PRODUCT.MAKERFROM LAPTOP JOIN PRODUCT ON LAPTOP.MODEL = PRODUCT.MODELINTERSECTSELECT PRODUCT.MAKER FROM PRINTER JOIN PRODUCT ON PRINTER.MODEL = PRODUCT.MODEL;-- 02.3. Намерете размерите на тези твърди дискове, които се появяват в два или повече модела лаптопи.SELECT DISTINCT L1.HDFROM LAPTOP AS L1 JOIN LAPTOP AS L2 ON L1.HD = L2.HDWHERE L1.MODEL != L2.MODEL;SELECT DISTINCT L1.HDFROM LAPTOP AS L1 CROSS JOIN LAPTOP AS L2WHERE L1.MODEL != L2.MODEL AND L1.HD = L2.HD;-- 02.4. Намерете всички модели персонални компютри, които нямат регистриран производител.SELECT PC.MODELFROM PC LEFT JOIN PRODUCT ON PC.MODEL = PRODUCT.MODELWHERE PRODUCT.MAKER IS NULL;-- 03. За базата от данни SHIPSUSE SHIPS-- 03.1. Напишете заявка, която извежда цялата налична информация за всеки кораб, включително и данните за неговия клас.--       В резултата не трябва да се включват тези класове, които нямат кораби.SELECT *FROM SHIPS JOIN CLASSES ON SHIPS.CLASS = CLASSES.CLASS;-- 03.2. Повторете горната заявка, като този път включите в резултата и класовете, които нямат кораби, но съществуват кораби със същото име като тяхното.SELECT *FROM SHIPS RIGHT JOIN CLASSES ON SHIPS.CLASS = CLASSES.CLASS-- 03.3. За всяка страна изведете имената на корабите, които никога не са участвали в битка.SELECT CLASSES.COUNTRY, SHIPS.NAMEFROM SHIPS LEFT JOIN OUTCOMES ON SHIPS.NAME = OUTCOMES.SHIP JOIN CLASSES ON SHIPS.CLASS = CLASSES.CLASSWHERE OUTCOMES.SHIP IS NULLORDER BY CLASSES.COUNTRY;-- 03.4. Намерете имената на всички кораби с поне 7 оръдия, пуснати на вода през 1916, но наречете резултатната колона Ship Name.SELECT SHIPS.NAME AS 'Ship Name'FROM SHIPS JOIN CLASSES ON SHIPS.CLASS = CLASSES.CLASSWHERE NUMGUNS >= 7 AND LAUNCHED = 1916;-- 03.5. Изведете имената на всички потънали в битка кораби, името и дата на провеждане на битките, в които те са потънали. Подредете резултата по име на битката.
SELECT OUTCOMES.SHIP, OUTCOMES.BATTLE, BATTLES.DATE
FROM OUTCOMES JOIN BATTLES ON OUTCOMES.BATTLE = BATTLES.NAME
WHERE OUTCOMES.RESULT = 'sunk' 
ORDER BY OUTCOMES.BATTLE;

-- 03.6. Намерете името, водоизместимостта и годината на пускане на вода на всички кораби, които имат същото име като техния клас.
SELECT SHIPS.NAME, CLASSES.DISPLACEMENT, SHIPS.LAUNCHED
FROM SHIPS JOIN CLASSES ON SHIPS.CLASS = CLASSES.CLASS
WHERE SHIPS.NAME = SHIPS.CLASS;

-- 03.7. Намерете всички класове кораби, от които няма пуснат на вода нито един кораб.
SELECT CLASSES.*
FROM CLASSES LEFT JOIN SHIPS ON CLASSES.CLASS = SHIPS.CLASS
WHERE SHIPS.LAUNCHED IS NULL;

-- 03.8. Изведете името, водоизместимостта и броя оръдия на корабите, участвали в битката ‘North Atlantic’, а също и резултата от битката.
SELECT SHIPS.NAME, CLASSES.DISPLACEMENT, CLASSES.NUMGUNS, OUTCOMES.RESULT
FROM CLASSES JOIN SHIPS ON CLASSES.CLASS = SHIPS.CLASS JOIN OUTCOMES ON SHIPS.NAME = OUTCOMES.SHIP
WHERE OUTCOMES.BATTLE = 'North Atlantic';