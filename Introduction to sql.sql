/* DDL: Data Defination Language

DML : Data Manipulation Language

DCL : Data control language


 RDBMS.. oracle,  mysql,, postgresql, accessdb.. */


-- creating db

CREATE DATABASE first_database;

-- delete db
DROP DATABASE "first database";



-- creating table

CREATE TABLE tableone (
firstname VARCHAR(20),
lastname CHAR(20), 
address TEXT,
age integer,
salary decimal(7, 2)
);


-- select all columns available in the tableone
SELECT * FROM tableone;

SELECT firstname, salary, age
FROM tableone;


-- character datatype --- varchar, char, text

-- Number---- integer, float, decimal    

-- datetime ---- time , date, datetime






INSERT INTO tableone 
VALUES ('olaitan', 'kazeem','10 lekki', 12, 627.23),
		('yemi', 'kola','12 berger', 23, 737.35),
		('olaitan', 'kazeem','10 lekki', 34, 233.36);
		


SELECT * FROM tableone;


INSERT INTO tableone(age, salary)
VALUES (27, 383.37),
		(21, 373.11);
		
		
-- delete..... truncate.... drop

DELETE FROM tableone
WHERE age=12;


delete from tableone;
TRUNCATE tableone;

SELECT * FROM tableone;




-- to delete the entire table
DROP TABLE tableone



/*
constrainst are set of rules applied to the columns to ensure data
 integrity
 
 
 1. Not null
 2. Unique
 3. Default
 4. check
 5. enum
 6. primary key
 7. foreign key
 8. Serial
 
*/


CREATE TABLE t1(
id integer,
firstname varchar(12)  NOT NULL
);

SELECT * FROM t1;

INSERT INTO t1 
VALUES(1, 'olaitan');


INSERT INTO t1 (firstname) 
VALUES( 'kazeem');

INSERT INTO t1 (id) 
VALUES(2);

--------------


CREATE TABLE t2(
id integer,
firstname varchar(12) unique
);

SELECT * FROM t2;

INSERT INTO t2 
VALUES(1, 'olaitan');


INSERT INTO t2 (firstname) 
VALUES('olaitan');

INSERT INTO t1 (id) 
VALUES(2);


-------
CREATE TABLE t3(
age integer,
states varchar(20) DEFAULT 'lagos'
);


INSERT INTO t3
VALUES (12, 'Kano'),
		(13, 'oyo');
		
SELECT * FROM t3;

INSERT INTO t3 (age)
VALUES (32 ),
		(56 );
		
		
---check
CREATE TABLE t4(
id integer,
age integer CHECK(age>=18)
);


INSERT INTO t4
values(1, 18);


CREATE TYPE brandname AS ENUM('Adidas', 'Gucci', 'Nike');


CREATE TABLE t5(
id integer,
"type of brand"  brandname
);


INSERT INTO t5
VALUES( 1, 'Nike');


----
CREATE TABLE t6(
id integer PRIMARY KEY,
age integer 
);

INSERT INTO t6
VALUES(1, 22),
	  (2, 34);
	  
	  
CREATE TABLE t7(
id integer PRIMARY KEY,
age integer,
grade integer PRIMARY KEY   --- INVALID WAY OF CREATING MULTIPLE PRIMARY KEY
);


CREATE TABLE t7(
id integer,
age integer,
grade integer ,
PRIMARY KEY (id, grade)   --- VALID WAY OF CREATINGMULTIPLE PRIMARY KEY 
);


----
CREATE TABLE t8(
id serial ,
firstname varchar(12),
PRIMARY KEY(id)
);


CREATE TABLE t9(
stdt_id integer,
grade integer,
FOREIGN KEY (stdt_id) REFERENCES t8(id)
)


INSERT INTO t8(firstname)
VALUES('olaitan'), ('yemi'),
		('kola'),
		('Ada'),
		('Ade'),
		('kemi'),
		('alao'),
		('james')

SELECT * FROM  t8
offset 2 row
limit 7 only;



INSERT INTO t9(stdt_id, grade)
VALUES(8, 90), (1, 70), (2, 70), (6, 82)


SELECT * FROM  t9;

delete from t8
where id = 1;



delete from t9
where stdt_id = 1;




/*
selete distinct
column alias
limit 
order by
*/

drop table sale_info;

CREATE TABLE sale_info(
order_id  serial,
"Order Date" DATE default now(),
Item VARCHAR(20),
Quantity integer,
Price integer
)


select * from sale_info;

insert into sale_info(Item,Quantity,Price)
values('Rice', 23, 812);

insert into sale_info(Item,Quantity,Price)
values('Prediator', 2, 600),
		('Beans', 23, 812),('Rice', 23, 812),('Rice', 23, 812),('Beans', 2, 42),
		('Rice', 23, 812),('Rice', 23, 812),('Rice', 23, 812),('Rice', 23, 812),
		('Rice', 23, 812),('Rice', 23, 812),('Rice', 23, 812),('Rice', 23, 812),
		('Rice', 23, 812),('Rice', 23, 812),('Rice', 23, 812),('Rice', 23, 812),
		('Rice', 23, 812),('Rice', 23, 812),('Rice', 23, 812),('Rice', 23, 812),
		('Rice', 23, 812),('Rice', 23, 812),('Rice', 23, 812),('Rice', 23, 812),
		('Rice', 23, 812),('Rice', 23, 812),('Rice', 23, 812),('Rice', 23, 812),
		('Rice', 23, 812),('Rice', 23, 812),('Rice', 23, 812),('Rice', 23, 812);




select * from sale_info
offset 8 rows
fetch next 10 rows only;






create table ola(
namess varchar(29)
);

create table ola2(name_id int);