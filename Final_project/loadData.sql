SET SCHEMA FN71840;

INSERT INTO MANAGER(ID, NAME, SALARY, BONUS, EMP_DATE, PHONE_NUM, E_MAIL)
VALUES ('MNG092', 'Ivan Ivanov', 2500, 300, '2015-05-01', '0987645383', 'i.ivanov@gmail.com'),
       ('MNG221', 'Petur Dimitrov', 2200, 400, '2016-01-15', '0987883283', 'p_dimm@gmail.com'),
       ('MNG733', 'Ivaila Mineva', 2900, 450, '2015-05-01', '0888821573', 'ivailla@gmail.com'),
       ('MNG205', 'Maria Todorova', 2100, 200, '2018-10-08', '0887435383', 'mm_ttva@gmail.com');

INSERT INTO RECEPTIONISTS(ID, NAME, SALARY, BONUS, EMP_DATE, PHONE_NUM, E_MAIL, EDUCATION, MANAGER_ID)
VALUES ('REC924', 'Sonya Stoyanova', 800, 150, '2019-03-02', '0833145383', 'sonya.st@gmail.com','A', 'MNG092'),
       ('REC014', 'Veselina Chotreva', 1000, 400, '2012-01-15', '0835883283', 'vess.chotreva@gmail.com', 'B', 'MNG221'),
       ('REC621', 'Mirela Peneva', 1200, 450, '2010-11-14', '0943882157', 'mirela.geor@gmail.com', 'C', 'MNG733'),
       ('REC872', 'Denitsa Petrova', 600, 100, '2020-01-18', '0817435383', 'd.petrova@gmail.com', 'B', 'MNG205');

INSERT INTO ATTENDANTS(ID, NAME, SALARY,BONUS, EMP_DATE, PHONE_NUM,E_MAIL,WORKED_HOURS,MONEY_PER_HOUR,MANAGER_ID)
VALUES ('ATT333','Iva Petrova', 800, 300, '2015-04-04', '0889675645', 'i.ivanova@gmail.com','8',700,'MNG733'),
       ('ATT133','Ivana Georgieva', 800, 300, '2015-04-04', '0834675645', 'ivana,ib@gmail.com','8',700,'MNG733'),
       ('ATT233','Stefan Stefanov', 800, 100, '2015-03-08', '085675645', 'st.stefanov@gmail.com','8',700,'MNG205'),
       ('ATT433','Kiril Metodiev', 800, 200, '2015-04-07', '0889675305', 'k.metodiev@gmail.com','8',700,'MNG205');

INSERT INTO ROOMS(R_NUMBER, PRICE, R_TYPE, ATTENDANT_ID)
VALUES (101, 150, 3, 'ATT333'),
       (102, 150, 3, 'ATT333'),
       (103, 70, 2, 'ATT333'),
       (104, 70, 2, 'ATT333'),
       (105, 30, 1, 'ATT333'),
       (106, 30, 1, 'ATT333'),
       (201, 150, 3, 'ATT133'),
       (202, 150, 3, 'ATT133'),
       (203, 70, 2, 'ATT133'),
       (204, 70, 2, 'ATT133'),
       (205, 30, 1, 'ATT133'),
       (206, 30, 1, 'ATT133'),
       (301, 150, 3, 'ATT233'),
       (302, 150, 3, 'ATT233'),
       (303, 70, 2, 'ATT233'),
       (304, 70, 2, 'ATT233'),
       (305, 30, 1, 'ATT233'),
       (306, 30, 1, 'ATT233'),
       (401, 150, 3, 'ATT433'),
       (402, 150, 3, 'ATT433'),
       (403, 70, 2, 'ATT433'),
       (404, 70, 2, 'ATT433'),
       (405, 30, 1, 'ATT433'),
       (406, 30, 1, 'ATT433');

INSERT INTO GUESTS(EGN, NAME, AGE, PHONE_NUMBER)
VALUES ('7008104334', 'Krasimira Atanasova', 50, '0877342536'),
       ('7802026745', 'Lidiya Mihaleva', 42, '0886124225'),
       ('6807246341', 'Teodor Todorov', 52, '0865344256'),
       ('8912236473', 'Asen velikov', 31, '0823656564'),
       ('8803078443', 'Silviya Velikova', 32, '0897856447'),
       ('8201074532', 'Stoyan Penev', 38, '0895243009'),
       ('7905185667', 'Bojidara Ilieva', 41, '0867566320'),
       ('8304265448', 'Kristian Stefanov', 37, '0893487616'),
       ('9007024343', 'Stefani Vasileva', 30, '0887338526'),
       ('7801235465', 'Ivanka Georgieva', 42, '0887926388'),
       ('8010125463', 'Valq Cekova', 40, '0897452458'),
       ('9304156224', 'Kostadin Ivanov', 27, '0882456312'),
       ('9902184678', 'Kristina Cekova', 21, '0897456345'),
       ('9907265463', 'Aleksandra Petrova', 21, '0878923456'),
       ('9705163427', 'Ilian Dimitrov', 23, '0882367190'),
       ('9801244635', 'Nikoleta Stefanova', 22, '0897625341'),
       ('9009284562', 'Martina Rizova', 29, '0897456666'),
       ('9006175463', 'Petq Drobreva', 29, '0897456558'),
       ('9803134573', 'Atanas Stoqnov', 21, '0897456398'),
       ('9906175463', 'Georgi Petrov', 22, '0897491243'),
       ('9603134573', 'Petur Georgiev', 24, '0897456388');

INSERT INTO REGISTRATIONS( PAYMENT, A_DATE, DAYS, L_DATE, R_NUMBER, GUEST_EGN, RECEPTIONIST_ID, GUEST2_EGN, GUEST3_EGN)
VALUES (0, '2018-12-10', 5, '2019-12-15', 201, '9902184678', '9907265463', '9705163427', 'REC621'),
       (1, '2019-01-01', 2, '2019-01-03', 205, '9906175463', 'REC014', NULL, NULL),
       (1, '2019-01-01', 2, '2019-01-03', 105, '9603134573', 'REC621', NULL, NULL),
       (1, '2019-01-01', 2, '2019-01-03', 306, '7008104334', 'REC621', NULL, NULL),
       (0, '2019-02-18', 5, '2019-02-23', 303, '6807246341', 'REC014', '7802026745', NULL),
       (1, '2019-03-12', 4, '2019-03-16', 101, '7801235465', '8010125463', '9304156224', 'REC014'),
       (1, '2019-05-05', 3, '2019-05-08', 404, '8912236473', 'REC872', '8803078443', NULL),
       (0, '2019-08-15', 10, '2019-08-25', 203, '8201074532', 'REC924', '7905185667', NULL),
       (2, '2019-09-01', 6, '2019-09-07', 104, '9007024343', 'REC621', '8304265448', NULL),
       (1, '2019-09-09', 3, '2019-09-12', 305, '9803134573', 'REC014', NULL, NULL),
       (2, '2020-01-23', 6, '2020-01-29', 302, '9801244635', '9009284562', '9006175463', 'REC872');
