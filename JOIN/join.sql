-----------------------------JOIN--------------------------------
SET SCHEMA DB2MOVIES;

-- 1.Напишете заявка, която извежда имената на актьорите мъже участвали в ‘Terms
-- of Endearment’
SELECT STARNAME
FROM STARSIN, MOVIESTAR
WHERE STARNAME = NAME AND GENDER = 'M' AND MOVIETITLE = 'Terms of Endearment';

-- 2. Напишете заявка, която извежда имената на актьорите участвали във филми
-- продуцирани от ‘MGM’през 1995 г.
SELECT STARNAME
FROM STARSIN, MOVIE
WHERE STUDIONAME = 'MGM' AND YEAR = '1995' AND MOVIETITLE = TITLE AND MOVIEYEAR = YEAR;

-- 3. Напишете заявка, която извежда името на президента на ‘MGM’
SELECT DISTINCT NAME
FROM MOVIEEXEC, MOVIE
WHERE STUDIONAME = 'MGM' AND CERT# = PRODUCERC#;

-- 4. Напишете заявка, която извежда имената на всички филми с дължина по-голяма
-- от дължината на филма ‘Gone With the Wind’
SELECT *
FROM MOVIE M1, MOVIE M2
WHERE M2.TITLE = 'Gone With the Wind' AND M1.LENGTH > M2.LENGTH
  AND M1.YEAR <> M2.YEAR AND M1.TITLE <> M2.TITLE;

-- 5. Напишете заявка, която извежда имената на тези продукции на стойност поголяма
-- от продукциите на продуценти ‘Merv Griffin’
SELECT *
FROM MOVIEEXEC E1, MOVIEEXEC E2
WHERE E2.NAME = 'Merv Griffin' AND E1.NETWORTH > E2.NETWORTH AND E1.CERT# <> E2.CERT#;

-- 6. Напишете заявка, която извежда имената на всички филми с дължина по-голяма
-- от дължината на филма ‘Star Trek’
SELECT M1.TITLE, M1.YEAR, M1.LENGTH, M2.TITLE, M2.YEAR, M2.LENGTH
FROM MOVIE M1, MOVIE M2
WHERE M2.TITLE = 'Star Trek'
AND M1.LENGTH >= M2.LENGTH;

SET SCHEMA DB2PC;

-- 1. Напишете заявка, която извежда производителя и честотата на тези лаптопи с
-- размер на диска поне 9 GB
SELECT MAKER, SPEED
FROM PRODUCT, LAPTOP
WHERE PRODUCT.MODEL = LAPTOP.MODEL AND HD >= 9;

-- 2. Напишете заявка, която извежда номер на модел и цена на всички продукти,
-- произведени от производител с име ‘B’
SELECT DISTINCT P.MODEL, L.PRICE AS PPRICE, P.TYPE
FROM PRODUCT P, LAPTOP L
WHERE MAKER LIKE 'B' AND L.MODEL = P.MODEL;

SELECT DISTINCT PR.MODEL, P.PRICE, PR.TYPE
FROM PRODUCT PR, PC P
WHERE MAKER LIKE 'B' AND P.MODEL = PR.MODEL;

-- 3. Напишете заявка, която извежда размерите на тези дискове, които се предлагат в
-- повече от два компютъра
SELECT DISTINCT PC1.HD
FROM PC AS PC1, PC AS PC2
WHERE PC1.MODEL <> PC2.MODEL AND PC1.HD = PC2.HD
ORDER BY PC1.HD;

-- 4. Напишете заявка, която извежда производителите на поне два различни
-- компютъра с честота поне 400.
SELECT DISTINCT P1.MAKER, P1.MODEL
FROM PRODUCT P1, PRODUCT P2, PC AS PC1, PC AS PC2
WHERE P1.MAKER = P2.MAKER AND P1.MODEL <> P2.MODEL AND PC1.SPEED >= 400
  AND PC1.MODEL = P1.MODEL AND PC2.SPEED >= 400 AND PC2.MODEL = P2.MODEL;

SET SCHEMA DB2SHIPS;

-- 1. Напишете заявка, която извежда името на корабите по-тежки от 35000
SELECT S.NAME
FROM SHIPS S, CLASSES C
WHERE S.NAME = C.CLASS AND C.DISPLACEMENT > 35000;

-- 2. Напишете заявка, която извежда имената, водоизместимостта и броя оръжия на
-- всички кораби участвали в битката при ‘Guadalcanal’
SELECT S.NAME, C.DISPLACEMENT, C.NUMGUNS
FROM SHIPS S, CLASSES C, OUTCOMES O
WHERE O.BATTLE = 'Guadalcanal' AND S.NAME <> O.SHIP AND S.CLASS <> C.CLASS;

-- 3. Напишете заявка, която извежда имената на тези държави, които имат кораби от
-- тип ‘bb’ и ‘bc’ едновременно
SELECT C1.COUNTRY, C1.TYPE, C2.TYPE
FROM CLASSES C1, CLASSES C2
WHERE C1.TYPE = 'bb' AND C2.TYPE = 'bc' AND C1.COUNTRY = C2.COUNTRY;

-- 4. Напишете заявка, която извежда имената на тези битки с три кораби на една и
-- съща държава
SELECT DISTINCT O1.BATTLE
FROM CLASSES C1, CLASSES C2, CLASSES C3,
     SHIPS S1, SHIPS S2, SHIPS S3,
     OUTCOMES O1, OUTCOMES O2, OUTCOMES O3
WHERE C1.CLASS = S1.CLASS AND S1.NAME = O1.SHIP
AND C2.CLASS = S2.CLASS AND S2.NAME = O2.SHIP
AND C3.CLASS = S3.CLASS AND S3.NAME = O3.SHIP
AND O1.BATTLE = O2.BATTLE AND O1.BATTLE = O3.BATTLE
AND S1.NAME <> S2.NAME AND S1.NAME <> S3.NAME AND S2.NAME <> S3.NAME;

-- 5. Напишете заявка, която извежда имената на тези кораби, които са били
-- повредени в една битка, но по късно са участвали в друга битка
SELECT O1.SHIP
FROM OUTCOMES O1, BATTLES B1, OUTCOMES O2, BATTLES B2
WHERE O1.BATTLE = B1.NAME
AND O2.BATTLE = B2.NAME
AND O1.SHIP = O2.SHIP
AND B1.DATE < B2.DATE
AND O1.RESULT = 'damaged';

-- 6. Напишете заявка, която извежда името на корабите по-тежки от 35000
-- и пуснати на вода през 1940
SELECT S.NAME, C.DISPLACEMENT
FROM CLASSES C, SHIPS S
WHERE C.CLASS = S.CLASS
AND DISPLACEMENT > 35000
AND S.LAUNCHED = 1940
