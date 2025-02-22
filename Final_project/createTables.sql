------Relational Schemas
--Manager (ID, name, salary, bonus, emplDate, phoneNumber, e-mail)
--Receptionists (ID, name, salary, bonuses, emplDate, phoneNumber, e-mail,  education)
--Attendants (ID, name, salary, bonuses, emplDate, phoneNumber, e-mail,  workedHours, moneyPerHour)
--Rooms (roomNumber, pricePerNight, roomType, attendantID)
--Guests (EGN, name, age, phoneNumber)
--Registrations (ID, payment, accomodationDate, days, leavingDate, roomsNumber, guestEGN, receptionistID)

-- Manager (ID, name, salary, bonus, emplDate, phoneNumber, e-mail)
CREATE TABLE MANAGER (
    ID CHAR(6) NOT NULL CONSTRAINT PK_MANAGER PRIMARY KEY,
    NAME VARCHAR(50) NOT NULL,
    SALARY DOUBLE NOT NULL CHECK (SALARY > 0),
    BONUS DOUBLE CHECK(BONUS > 0),
    EMP_DATE DATE NOT NULL,
    PHONE_NUM CHAR(10),
    E_MAIL VARCHAR(30)
);

-- Receptionists (ID, name, salary, bonus, emplDate, phoneNumber, e-mail,  education)
CREATE TABLE RECEPTIONISTS (
    ID CHAR(6) NOT NULL CONSTRAINT PK_RECEPTIONISTS PRIMARY KEY,
    NAME VARCHAR(50) NOT NULL,
    SALARY DOUBLE NOT NULL CHECK(SALARY > 0),
    BONUS DOUBLE CHECK(BONUS > 0),
    EMP_DATE DATE NOT NULL,
    PHONE_NUM CHAR(10),
    E_MAIL VARCHAR(30),
    EDUCATION CHAR(1) CHECK (EDUCATION IN ('A', 'B', 'C'))     -- 'A' - СРЕДНО, 'B'- СРЕДНО СПЕЦИАЛНО, 'C' - ВИСШЕ
);

ALTER TABLE RECEPTIONISTS
ADD MANAGER_ID CHAR(6);

ALTER TABLE RECEPTIONISTS
ADD CONSTRAINT FK_RECEPT_MANAGER FOREIGN KEY (MANAGER_ID) REFERENCES MANAGER(ID);

-- Attendants (ID, name, salary, bonus, emplDate, phoneNumber, e-mail,  workedHours, moneyPerHour)
CREATE TABLE ATTENDANTS (
    ID CHAR(6) NOT NULL CONSTRAINT PK_RECEPTIONISTS PRIMARY KEY,
    NAME VARCHAR(50) NOT NULL,
    SALARY DOUBLE NOT NULL CHECK(SALARY > 0),
    BONUS DOUBLE CHECK(BONUS > 0),
    EMP_DATE DATE NOT NULL,
    PHONE_NUM CHAR(10),
    E_MAIL VARCHAR(30),
    WORKED_HOURS INT NOT NULL CHECK (WORKED_HOURS > 0),
    MONEY_PER_HOUR DOUBLE NOT NULL CHECK (MONEY_PER_HOUR > 0)
);

ALTER TABLE ATTENDANTS
ADD MANAGER_ID CHAR(6) CONSTRAINT FK_ATTENDANTS_MANAGER REFERENCES MANAGER(ID);

-- Rooms (roomNumber, pricePerNight, roomType, attendantID)
CREATE TABLE ROOMS (
    R_NUMBER INT NOT NULL CONSTRAINT PK_ROOMS PRIMARY KEY,
    PRICE DOUBLE NOT NULL CHECK (PRICE > 0),
    R_TYPE INT NOT NULL CHECK (R_TYPE IN (1, 2, 3)),   -- 1 - ЕДИНИЧНА, 2 - ДВОЙНА, 3 - АПАРТАМЕНТ
    ATTENDANT_ID CHAR(6) CONSTRAINT FK_ROOMS_ATTENDANTS REFERENCES ATTENDANTS(ID)
);

-- Guests (EGN, name, age, phoneNumber)
CREATE TABLE GUESTS (
    EGN CHAR(10) NOT NULL CONSTRAINT PK_GUESTS PRIMARY KEY,
    NAME VARCHAR(50) NOT NULL,
    AGE INT NOT NULL CHECK (AGE > 0),
    PHONE_NUMBER CHAR(10)
);

-- Registrations (ID, payment, accomodationDate, days, leavingDate, roomsNumber, guestEGN, receptionistID)
CREATE TABLE REGISTRATIONS (
    ID INT NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) CONSTRAINT PK_REGISTRATIONS PRIMARY KEY,
    PAYMENT INT CHECK (PAYMENT IN (0, 1, 2)),       -- 0 - В БРОЙ, 1 - С КАРТА, 2 - ПО БАНКОВ ПЪТ
    A_DATE DATE NOT NULL,
    DAYS INT NOT NULL CHECK (DAYS > 0),
    L_DATE DATE,
    R_NUMBER INT CONSTRAINT FK_REGISTRATIONS_ROOMS REFERENCES ROOMS(R_NUMBER),
    GUEST_EGN CHAR(10) CONSTRAINT FK_REGISTRATIONS_GUESTS REFERENCES GUESTS(EGN),
    GUEST2_EGN CHAR(10) CONSTRAINT FK_REGISTRATIONS_GUESTS2 REFERENCES GUESTS(EGN),
    GUEST3_EGN CHAR(10) CONSTRAINT FK_REGISTRATIONS_GUESTS2 REFERENCES GUESTS(EGN),
    RECEPTIONIST_ID CHAR(6) CONSTRAINT FK_REGISTRATIONS_RECEPTIONISTS REFERENCES RECEPTIONISTS(ID)
);
