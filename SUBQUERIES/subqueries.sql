---------------------------------SUBQUERIES------------------------------------
SET SCHEMA DB2MOVIES;
-- 1. Напишете заявка, която извежда имената на актрисите, които са също и
-- продуценти с нетна стойност по-голяма от 10 милиона.
SELECT NAME
FROM MOVIESTAR
WHERE NAME IN (SELECT NAME
               FROM MOVIEEXEC WHERE NETWORTH > 10000000 )
AND GENDER = 'F';

-- 2. Напишете заявка, която извежда имената на тези актьори (мъже и жени), които
-- не са продуценти.
SELECT NAME
FROM MOVIESTAR
WHERE NAME NOT IN (SELECT NAME FROM MOVIEEXEC);

-- 3. Напишете заявка, която извежда имената на всички филми с дължина по-голяма
-- от дължината на филма ‘Gone With the Wind’
SELECT TITLE
FROM MOVIE
WHERE LENGTH > (SELECT LENGTH
                FROM MOVIE
                WHERE TITLE = 'Gone With the Wind');

-- 4. Напишете заявка, която извежда имената на продуцентите и имената на
-- продукциите за които стойността им е по-голяма от продукциите на продуценти
-- ‘Merv Griffin’
SELECT TITLE, MOV.NAME, MOV.CERT#
FROM MOVIE M, MOVIEEXEC MOV
WHERE M.PRODUCERC# = MOV.CERT# AND
    NETWORTH > (SELECT NETWORTH
                     FROM MOVIEEXEC
                     WHERE NAME = 'Merv Griffin');

-- 5. Напишете заявка, която извежда името на филмите с най-голяма дължина по
-- студио.
SELECT TITLE
FROM MOVIE M
WHERE LENGTH >= ALL (SELECT LENGTH
                     FROM MOVIE
                     WHERE STUDIONAME = M.STUDIONAME);

SET SCHEMA DB2PC;

-- 6. Напишете заявка, която извежда производителите на персонални компютри с
-- честота поне 500

SELECT DISTINCT MAKER
FROM PRODUCT
WHERE MODEL IN (SELECT MODEL
                FROM PC
                WHERE SPEED >= 500);

-- 7. Напишете заявка, която извежда принтерите с най-висока цена.
SELECT MODEL, PRICE
FROM PRINTER
WHERE PRICE >= ALL(SELECT PRICE
                   FROM PRINTER);

-- 8. Напишете заявка, която извежда лаптопите, чиято честота е по-ниска от
-- честотата на който и да е персонален компютър.
SELECT *
FROM LAPTOP
WHERE SPEED < ALL(SELECT DISTINCT SPEED FROM PC);

-- 9. Напишете заявка, която извежда производителя на цветния принтер с най-ниска
-- цена
SELECT COLOR
FROM PRINTER;

SELECT MAKER
FROM PRODUCT
WHERE MODEL IN (SELECT MODEL
                FROM PRINTER
                WHERE COLOR = 'y'
                AND PRICE <= ALL(SELECT PRICE
                                FROM PRINTER
                                WHERE COLOR = 'y'));

-- 10. Напишете заявка, която извежда производителите на тези персонални компютри
-- с най-малко RAM памет, които имат най-бързи процесори
SELECT MAKER
FROM PRODUCT
WHERE MODEL IN (SELECT MODEL
                FROM PC P
                WHERE RAM <= ALL(SELECT RAM FROM PC)
                AND SPEED >= ALL(SELECT SPEED FROM PC WHERE RAM = P.RAM));

-- 11. Напишете заявка, която извежда страните, чиито кораби са с най-голям брой
-- оръжия.
SET SCHEMA DB2SHIPS;

SELECT DISTINCT COUNTRY
FROM CLASSES
WHERE NUMGUNS >= ALL(SELECT NUMGUNS FROM CLASSES);

-- 12. Напишете заявка, която извежда класовете, за които поне един от корабите им е
-- потънал в битка.
SELECT DISTINCT CLASS
FROM SHIPS
WHERE NAME = ANY(SELECT SHIP FROM OUTCOMES
                 WHERE RESULT = 'sunk');

-- 13. Напишете заявка, която извежда имената на корабите с 16 инчови оръдия (bore).
SELECT BORE
FROM CLASSES;

SELECT DISTINCT NAME
FROM SHIPS
WHERE CLASS IN (SELECT CLASS FROM CLASSES
                WHERE BORE = 16);

-- 14. Напишете заявка, която извежда имената на битките, в които са участвали
-- кораби от клас ‘Kongo’.
SELECT BATTLE
FROM OUTCOMES
WHERE SHIP IN (SELECT NAME FROM SHIPS
               WHERE CLASS = 'Kongo');

-- 15. Напишете заявка, която извежда иманата на корабите, чиито брой оръдия е
-- най-голям в сравнение с корабите със същия калибър оръдия (bore).
SELECT C1.CLASS, NAME
FROM CLASSES C1, SHIPS S
WHERE NUMGUNS >= ALL(SELECT NUMGUNS FROM CLASSES WHERE BORE = C1.BORE)
AND S.CLASS = C1.CLASS
ORDER BY C1.CLASS;