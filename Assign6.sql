/*
        Name: Dev Patel
        ZID:  Z1912837
        ASSIG: 6
        Date: 02/26/2021
*/

DROP TABLE IF EXISTS VISIT;
DROP TABLE IF EXISTS DOG;                       -- Drops the table if exists
--DROP TABLE IF EXISTS VISIT;                     -- Drops the table if exists

CREATE TABLE DOG                                -- Creats DOG table
(
        dog_id int NOT NULL AUTO_INCREMENT,     -- Sets attribute Dog_id
        breed  varchar(255) NOT NULL,           -- Sets attribute breed 
        name   varchar(255) NOT NULL,           -- Sets attribute name
        weight DECIMAL(5,2)    NOT NULL,        -- Sets attriibute weight
        PRIMARY KEY(dog_id)                     -- Sets dog_id to primary key of the table
);

-- Insets Dog name, breed and weight into the table 
INSERT INTO DOG (breed,name,weight)             
        VALUES ('beagle', 'tommy', 45);

INSERT INTO DOG (breed,name,weight)
	VALUES('bulldog', 'jack', 53);

INSERT INTO DOG (breed,name,weight)
	VALUES('german shepherd', "chat", 60);

INSERT INTO DOG (breed,name,weight)
	VALUES('pug', 'tommy', 35);

INSERT INTO DOG (breed,name,weight)
	VALUES('german shepherd', 'leach', 65);

INSERT INTO DOG (breed,name,weight)
	VALUES('bulldog', 'root', 50);

DESCRIBE DOG;

SELECT * FROM DOG;

CREATE TABLE VISIT                                              -- Create the table Visit
(
        VisitID    INT NOT NULL AUTO_INCREMENT,                 -- Sets attirbute VisitID  
        dog_id     INT NOT NULL,                                -- Sets attribute dog_ID 
        VisitDate  DATETIME NOT NULL,                           -- Sets attribute VisitDate to get dates
        Lasted     TIME NOT NULL,                               -- Sets attribute Lasted for how long did it take

        PRIMARY KEY (VisitID),                                  -- Sets VistID to primary key
        FOREIGN KEY(dog_id) REFERENCES DOG(dog_id)              -- Sets dog_id to foregin key
);

-- inserts dog_id, visitDate and time lasted to the table VISIT
INSERT INTO VISIT (dog_id,VisitDate,Lasted)
	VALUES(3, '2020-12-15', '1:09:00');

INSERT INTO VISIT (dog_id,VisitDate,Lasted)
	VALUES(2, '2020-12-20', '1:30:00');

INSERT INTO VISIT (dog_id,VisitDate,Lasted)
	VALUES(1, '2020-12-22', '1:00:00');

INSERT INTO VISIT (dog_id,VisitDate,Lasted)
	VALUES(6, '2021-01-10', '2:00:00');

INSERT INTO VISIT (dog_id,VisitDate,Lasted)
	VALUES(5, '2021-01-13', '1:30:00');

INSERT INTO VISIT (dog_id,VisitDate,Lasted)
	VALUES(4, '2021-01-22', '1:40:00');

INSERT INTO VISIT (dog_id,VisitDate,Lasted)
	VALUES(2, '2021-02-23', '2:22:00');

INSERT INTO VISIT (dog_id,VisitDate,Lasted)
	VALUES(3, '2021-02-25', '2:00:00');

INSERT INTO VISIT (dog_id,VisitDate,Lasted)
	VALUES(5, '2021-03-03', '1:00:00');

DESCRIBE VISIT;

SELECT * FROM VISIT;

ALTER TABLE VISIT ADD Billing DECIMAL(5,2) NOT NULL;  -- Adds billing to table

-- Adds billing to every visits
UPDATE VISIT SET Billing = 35 WHERE VisitID = 1;  

UPDATE VISIT SET Billing = 40 WHERE VisitID = 2;

UPDATE VISIT SET Billing = 50 WHERE VisitID = 3;

UPDATE VISIT SET Billing = 45 WHERE VisitID = 4;

UPDATE VISIT SET Billing = 60 WHERE VisitID = 5;

UPDATE VISIT SET Billing = 55 WHERE VisitID = 6;

UPDATE VISIT SET Billing = 44 WHERE VisitID = 7;

UPDATE VISIT SET Billing = 66 WHERE VisitID = 8;

UPDATE VISIT SET Billing = 99 WHERE VisitID = 9;

SELECT * FROM VISIT;
