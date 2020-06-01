-----------------------------------------JOIN------------------------------
SET SCHEMA DB2MOVIES;

-- 1. Напишете заявка, която извежда името на продуцента и имената на филмите,
-- продуцирани от продуцента на ‘Star Wars’
SELECT MOV.NAME, AL.TITLE
FROM MOVIEEXEC MOV RIGHT JOIN MOVIE M
ON MOV.CERT# = M.PRODUCERC#
JOIN MOVIE AL
ON MOV.CERT# = AL.PRODUCERC#
AND M.TITLE = 'Star Wars'
AND AL.TITLE != 'Star Wars';

-- 2. Напишете заявка, която извежда имената на продуцентите на филмите на
-- ‘Harrison Ford’
SELECT MOV.NAME, M.TITLE
FROM MOVIEEXEC MOV JOIN MOVIE M
ON MOV.CERT# = M.PRODUCERC#
JOIN STARSIN S
ON M.TITLE = S.MOVIETITLE
AND M.YEAR = S.MOVIEYEAR
WHERE S.STARNAME = 'Harrison Ford';

-- 3. Напишете заявка, която извежда името на студиото и имената на актьорите
-- участвали във филми произведени от това студио, подредени по име на студио.
SELECT S.STUDIONAME, STR.STARNAME
FROM MOVIE S JOIN STARSIN STR
ON S.TITLE = STR.MOVIETITLE and S.YEAR = STR.MOVIEYEAR
ORDER BY STUDIONAME;

-- 4. Напишете заявка, която извежда имената на актьора (актьорите) участвали
-- във филми на най-голяма стойност
SELECT DISTINCT ME.NETWORTH, ST.STARNAME
FROM MOVIEEXEC ME JOIN MOVIE M ON ME.CERT# = M.PRODUCERC#
JOIN STARSIN ST ON M.TITLE = ST.MOVIETITLE and M.YEAR = ST.MOVIEYEAR
WHERE ME.NETWORTH IN (SELECT MAX(NETWORTH) FROM MOVIEEXEC);

-- 5. Напишете заявка, която извежда имената на актьорите не участвали
-- в нито един филм. (Използвайте съединение!)
SELECT DISTINCT S.STARNAME
FROM STARSIN S JOIN MOVIE M ON S.MOVIETITLE = M.TITLE
                                   AND S.MOVIEYEAR = M.YEAR;

SELECT NAME
FROM MOVIESTAR LEFT JOIN STARSIN S ON MOVIESTAR.NAME = S.STARNAME
WHERE MOVIETITLE IS NULL;

-- 6. Напишете заявка, която извежда производител, модел и тип на продукт за тези
-- производители, за които съответния продукт не се продава (няма го в таблиците
-- PC, лаптоп или принтер)
SET SCHEMA DB2PC;

-- 7. Напишете заявка, която извежда цялата налична информация за всеки кораб,
-- включително и данните за неговия клас. В резултата не трябва да се включват
-- тези класове, които нямат кораби.

SET SCHEMA DB2SHIPS;

SELECT *
FROM SHIPS JOIN CLASSES C ON SHIPS.CLASS = C.CLASS
WHERE C.CLASS IS NOT NULL;

-- 8. Повторете горната заявка като този път включите в резултата и класовете,
-- които нямат кораби, но съществуват кораби със същото име като тяхното.
SELECT C2.CLASS
FROM SHIPS RIGHT JOIN CLASSES C2 ON SHIPS.CLASS = C2.CLASS
WHERE EXISTS(SELECT * FROM SHIPS WHERE NAME = C2.CLASS)
AND NAME IS NULL;

SELECT C3.CLASS
FROM SHIPS RIGHT JOIN CLASSES C3 ON SHIPS.CLASS = C3.CLASS
WHERE C3.CLASS IN (SELECT NAME FROM SHIPS)
AND NAME IS NULL;

-- 9. За всяка страна изведете имената на корабите,
-- които никога не са участвали в битка.
SELECT COUNTRY, S.NAME
FROM CLASSES C LEFT JOIN SHIPS S ON C.CLASS = S.CLASS
LEFT JOIN OUTCOMES O ON S.NAME = O.SHIP
WHERE S.NAME IS NULL OR
      O.BATTLE IS NULL
ORDER BY C.COUNTRY, S.NAME;
