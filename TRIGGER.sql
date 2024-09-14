/*

In MySQL, a trigger is a stored program invoked automatically in response to an event such as insert, update, or delete that occurs in the associated table. 
For example, you can define a trigger that is invoked automatically before a new row is inserted into a table.
*/


SELECT * FROM company.pets;


CREATE TABLE employee_audit(
OwnerID INT ,
Name VARCHAR(20) NOT NULL,
kind VARCHAR(20),						-- TABLE TO RECORD THE DEFINED FEATURE WHEN PET TABLE TRIGGER ON UPDATE 
changedate DATETIME DEFAULT NULL,
action VARCHAR(50) DEFAULT NULL );

drop table employee_audit;

drop trigger pet_update;

CREATE TRIGGER pet_update
AFTER UPDATE ON pets FOR EACH ROW
INSERT INTO employee_audit
SET action = 'ola update',
OwnerID = OLD.OwnerID,			
Name = OLD.Name,
kind = OLD.kind,
changedate = NOW();

SELECT * FROM employee_audit;

SELECT * FROM PETS;

UPDATE pets
SET Kind = 'Cat', Name = 'oal'
WHERE OwnerID = 5168;

describe pets;