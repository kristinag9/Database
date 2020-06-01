-------------------------------EXERCISES FOR PC----------------------------
SET SCHEMA DB2PC;

-- 1. Напишете заявка, която извежда средната честота на компютрите
SELECT AVG(HD) AS AVG_HD
FROM PC;

-- 2. Напишете заявка, която извежда средния размер на екраните на лаптопите за
-- всеки производител
SELECT MAKER, AVG(L.SCREEN) AS AVG_SCREEN
FROM LAPTOP L JOIN PRODUCT P ON P.MODEL = L.MODEL
GROUP BY MAKER;

SELECT MAKER, SCREEN
FROM PRODUCT, LAPTOP
WHERE MAKER = 'C';

-- 3. Напишете заявка, която извежда средната честота на лаптопите с цена над 1000
SELECT AVG(L.SPEED) AS AVG_SPEED
FROM LAPTOP L, PRODUCT P
WHERE PRICE > 1000;

-- 4. Напишете заявка, която извежда средната цена на компютрите произведени от
-- производител ‘A’
SELECT AVG(C.PRICE) AS AVG_PRICE
FROM PC C JOIN PRODUCT P ON C.MODEL = P.MODEL
WHERE P.MAKER = 'A';

-- 5. Напишете заявка, която извежда средната цена на компютрите и лаптопите за
-- производител ‘B’
SELECT AVG(C.PRICE) AS AVG_PC, AVG(L.PRICE) AS AVG_L
FROM PRODUCT PR JOIN PC C ON C.MODEL = PR.MODEL
JOIN LAPTOP L ON L.MODEL = PR.MODEL
WHERE PR.MAKER = 'B';

-- 6. Напишете заявка, която извежда средната цена на компютрите според
-- различните им честоти
SELECT AVG(PRICE) AS AVG_PRICE_PC, SPEED
FROM PC
GROUP BY SPEED;

-- 7. Напишете заявка, която извежда производителя, който е произвел поне 3
-- различни модела компютъра
SELECT MAKER
FROM PRODUCT
WHERE TYPE = 'PC'
GROUP BY MAKER
HAVING COUNT(TYPE) >= 3;

-- 8. Напишете заявка, която извежда производителя с най-висока цена на компютър
SELECT P.MAKER
FROM PRODUCT P JOIN PC P2 ON P.MODEL = P2.MODEL
WHERE P2.PRICE >= ALL(SELECT PRICE FROM PC);

-- second answer
SELECT PRODUCT.MAKER
  FROM PRODUCT JOIN PC ON PC.MODEL = PRODUCT.MODEL
  GROUP BY PRODUCT.MAKER
  HAVING MAX(PC.PRICE) IN ((SELECT MAX(PRICE)
                     FROM PC));
-- 9. Напишете заявка, която извежда средната цена на компютрите за всяка честота
-- по-голяма от 800
SELECT AVG(PRICE) AS AVG_PRICE
FROM PC
WHERE SPEED IN (SELECT SPEED FROM PC WHERE SPEED > 800);

-- 10. Напишете заявка, която извежда средния размер на диска на тези компютри
-- произведени от производители, които произвеждат и принтери
SELECT AVG(PC1.HD) AS AVG_PC_HD
    FROM PC PC1 JOIN PRODUCT P ON PC1.MODEL = P.MODEL
    GROUP BY P.MAKER
    HAVING P.MAKER IN (SELECT MAKER FROM PRODUCT
                    WHERE TYPE = 'Printer');


-----------------------------------SHIPS------------------------------------------
SET SCHEMA DB2SHIPS;

-- 1. Напишете заявка, която извежда броя на класовете кораби
SELECT COUNT(CLASS) AS CNT_CLASSES
FROM SHIPS;

-- 2. Напишете заявка, която извежда средния брой на оръжия, според класа на
-- кораба
SELECT AVG(NUMGUNS) AS AVG_NUMG, CLASS
FROM CLASSES
GROUP BY CLASS;

-- 3. Напишете заявка, която извежда средния брой на оръжия за всички кораби
SELECT AVG(NUMGUNS) AS AVG_NUMG
FROM CLASSES;

-- 4. Напишете заявка, която извежда за всеки клас първата и последната година, в
-- която кораб от съответния клас е пуснат на вода
SELECT MAX(LAUNCHED), MIN(LAUNCHED)
FROM SHIPS
GROUP BY CLASS;

-- 5. Напишете заявка, която извежда броя на корабите потънали в битка според
-- класа
SELECT COUNT(SHIP) AS CNT_SUNKED, CLASS
FROM OUTCOMES JOIN SHIPS S ON OUTCOMES.SHIP = S.NAME
WHERE RESULT = 'sunk'
GROUP BY CLASS;

-- 6. Напишете заявка, която извежда броя на корабите, потънали в битка според
-- класа, за тези класове с повече от 2 кораба
SELECT COUNT(S.NAME) AS CNT_SUNKED, S.CLASS
FROM OUTCOMES JOIN SHIPS S ON OUTCOMES.SHIP = S.NAME
WHERE RESULT = 'sunk'
GROUP BY S.CLASS
HAVING COUNT(S.NAME) >= 2;

-- 7. Напишете заявка, която извежда средното тегло на корабите, за всяка страна.
SELECT COUNTRY, AVG(DISPLACEMENT) AS AVG_DISPL
FROM CLASSES
GROUP BY COUNTRY;
