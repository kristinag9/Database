------------------SELECT----------------------
SET SCHEMA DB2MOVIES;

-- 1.Напишете заявка, която извежда адресът на студио ‘MGM’
SELECT ADDRESS
FROM STUDIO
WHERE NAME = 'MGM';

-- 2. Напишете заявка, която извежда рождената дата на актрисата Sandra Bullock
SELECT BIRTHDATE
FROM MOVIESTAR
WHERE NAME = 'Sandra Bullock';

-- 3.Напишете заявка, която извежда имената на всички актьори, които са
-- участвали във филм през 1980 в заглавието на които има думата ‘Love’
SELECT STARNAME
FROM STARSIN
WHERE MOVIEYEAR = 1980 AND MOVIETITLE LIKE '%Love%';

-- 4. Напишете заявка, която извежда имената на всички продуценти на
-- филми на стойност над 10 000 000 долара
SELECT NAME
FROM MOVIEEXEC
WHERE NETWORTH >= 10000000;

-- 5. Напишете заявка, която извежда имената на всички актьори, които са
-- мъже или живеят в Malibu
SELECT NAME
FROM MOVIESTAR
WHERE GENDER = 'M' OR ADDRESS LIKE 'Malibu';

-- SCEMA DB2SHIPS

SET SCHEMA DB2SHIPS;

-- 6.Напишете заявка, която извежда името на класа и страната за всички
-- класове с брой на оръдията по-малък от 10
SELECT CLASS, COUNTRY
FROM CLASSES
WHERE NUMGUNS < 10;

-- 7. Напишете заявка, която извежда имената на всички кораби, пуснати на
-- вода преди 1918. Задайте псевдоним на колоната shipName
SELECT NAME AS shipName
FROM SHIPS
WHERE LAUNCHED < '1918';

-- 8. Напишете заявка, която извежда имената на корабите потънали в битка
-- и имената на битките в които са потънали
SELECT SHIP, BATTLE
FROM OUTCOMES
WHERE RESULT = 'sunk';

-- 9. . Напишете заявка, която извежда имената на корабите с име съвпадащо
-- с името на техния клас
SELECT NAME
FROM SHIPS
WHERE NAME = CLASS;

-- 10. Напишете заявка, която извежда имената на всички кораби започващи с
-- буквата R
SELECT NAME
FROM SHIPS
WHERE NAME LIKE 'R%';

--11. . Напишете заявка, която извежда имената на всички кораби, чието име е
-- съставено от точно две думи.
SELECT NAME
FROM SHIPS
WHERE NAME LIKE '% %' AND NAME NOT LIKE '% % %';


