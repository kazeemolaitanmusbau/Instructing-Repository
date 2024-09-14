-- comment/ statement

-- introduction to sql
/*
this
is
multple 
line 
comment
*/

/*
DDL: Dadta Defination Language------ CREATE, ALTER, DROP

DML: Data Manipulation language----- SELECT, DELETE, UPDATE, INSERT


DCL: Data Control language--- grant, revoke

*/

-- creating db
CREATE  DATABASE    
 `tolu`; 


-- to make db active
USE `classicmodels`;


DROP DATABASE `tolu`;


CREATE DATABASE lasop;

USE lasop;

CREATE TABLE student_info (

student_id integer,
firstname varchar(10),  -- ola
lastname char(10), -- ola         
address text,
department varchar(20) 
);

/*
character::; varchar, char, text
number ;;;;; integer  float, decimal
datetime :::::: time, date, datetime
*/




-- making query from the table 
SELECT * FROM student_info;

-- select specific columns from the table
SELECT student_id, address, lastname
FROM student_info;


-- inserting records to the table
INSERT INTO student_info()
VALUES(1, "yemi", "kemi", '10 lekki', "Chemistry"),
		(2, 'kola', 'Ada', '12 berger', "Electrical"),
        (3, 'smith', 'james', '34 olowoira', "civil"),
		(4, 'Rashford', 'sancho', 'agege', "physics"),
		(5, 'holar', 'Richael', '44 magodo', "chemical"),
		(6, 'kola', 'Ada', '12 berger', "Electrical");
        
        
SELECT * FROM student_info;

INSERT INTO student_info(firstname, department)
VALUES ("Ada", "Agric");


SELECT * FROM student_info;

/*
constrainst are set of rules impose on the columns to ensure data integrity

not null
default
check
unique
enum
priamry key
auto increment
foreign key
*/

CREATE TABLE T1 (
id int NOT NULL,
firstname varchar(10)
);

INSERT INTO T1()
VALUES(1, "KOLA");

SELECT * FROM T1;

INSERT INTO T1(firstname)
VALUES("yemi");




INSERT INTO T1(id)
VALUES(2);


CREATE TABLE t2(
firstname varchar(20),
state char(10) DEFAULT "lagos"
);

INSERT INTO t2(firstname, state)
VALUES ('KOLA', "KANO"),
		("YEMI", "KADUNA");
        
SELECT * FROM t2;

INSERT INTO t2(firstname)
VALUES ("olaitan"),
		("sancho");
        
   SELECT * FROM t2;     
   
   
   CREATE TABLE t3(
   firstname varchar(10),
   age int check(age>=18) );
   
   
   insert into t3()
   values ('olaitan', 24),
		('jame', 39);
        
        
        insert into t3()
   values ('olaitan', 12);
   
   
   select * from book;
   
   
    select`ship Mode`, count(city) from book
    group by 1
    order by 2 desc;
    
 select * from pets;
 
 drop table course_details;
 
 
 
 /*
 To add Coumms:::
 ALTER TABLE t2 ADD col1 datatype, col2 datatype
 
 To drop columns:::
 ALTER TABLE t2 DROP col1, col2
 
 
 To add datatype to columns in the table:::
 ALTER TABLE t2 ALTER col1 TYPE datatype
 
 To add NOT NULL constrainst to the columns
 ALTER TABLE t2 ADD CONSTRAINT uniquename UNIQUE(col1, col2)
 
 To add CHECK constrainst to the columns
 ALTER TABLE t2 ADD CONSTRAINT checkname CHECK(condition)
 
 To add primary key constrainst to the columns
 ALTER TABLE t2 ADD CONSTRAINT keyname PRIMARY KEY(col1, col2)
 
 To Drop primary key
 ALTER TABLE t2 DROP CONSTRAINT keyname
 

 */
 
 
 CREATE TABLE company(
id serial,
name VARCHAR(20),
age integer,
address TEXT, 
salary INTEGER
 );
 
 
INSERT INTO company(name,  age, address,  salary)
 VALUES ('Paul', 32, 'California', 20000),
 		('Allen', 25, 'Texas', 15000),
		('Teddy', 23, 'Norway', 20000),
		('Mark', 25, 'Rich-Mond', 65000),
		('David', 27, 'Texas', 85000),
		('Kim', 22, 'South-Hall',450000),
		('James', 24, 'Houston', 10000),
		('Smith', 28, 'New York', 92000);
		
		











/*
NOT NULL
CHECK
DEFAULT 
UNIQUE
ENUM
PRIMARY KEY
AUTO INCREMENT
FOREIGN KEY
*/


-- UNIQUE:::: It ensure that column does not accept duplicate entries

CREATE TABLE t1(
id INT UNIQUE,
state VARCHAR(20) );

SELECT * FROM t1;

INSERT INTO t1(id, state)
VALUES(1, 'Lagos'),
		(2, "Kaduna"),
        (3, "Lagos");

INSERT INTO t1(id, state)
VALUES(1, 'Kano');

-- enum
CREATE TABLE t3(
id int,
brandName ENUM("Adidas", "Gucci", "Nike"));


INSERT INTO t3
VALUES(1, "Adidas"), (2, "Nike");

SELECT * FROM t3;



INSERT INTO t3
VALUES (2, 'Aba made');



CREATE TABLE t4(
id INT PRIMARY KEY,
state VARCHAR(20) ) ;

INSERT INTO t4()
VALUES(1, "Lagos"), (2, "Kaduna"), (3, "Kano");

SELECT * FROM t4;

INSERT INTO t4(state)
VALUES("Lagos");


DROP TABLE t5;

 CREATE TABLE t5(
id INT PRIMARY KEY AUTO_INCREMENT ,
state VARCHAR(20) ) AUTO_INCREMENT= 10;

INSERT INTO t5(state)
VALUES("Lagos"), ("Kaduna"), ( "Kano");

SELECT * FROM t5;

CREATE TABLE customer_info(
cust_id INT  AUTO_INCREMENT,
firstname VARCHAR(20),
employeee_id int , 
constraint olaitan PRIMARY KEY(cust_id, employeee_id) );


CREATE TABLE order_info(
customer_id_number int,
quantity int DEFAULT 3,
price FLOAT,  
CONSTRAINT kazeem  FOREIGN KEY(customer_id_number) references customer_info(cust_id)
);

SELECT * FROM order_info;



SELECT * FROM customer_info;

INSERT INTO customer_info(firstname,employeee_id)
VALUES ("OLAITAN", 33),
		("Yemi", 33),
        ("James", 22),
        ("kemi", 33),
        ("Ada", 33),
        ("Smith", 22),
        ("Richael", 33),
        ("Bunmi", 22);


INSERT INTO order_info()
VALUES (1, 6, 739.88),
		(1, 7, 77),
        (3, 92, 9272.4),
        (7, 23, 7382.3),
        (4, 483, 7939.7),
        (7, 33, 38373),
        (6, 99, 2827);


-- delete, truncate

TRUNCATE  order_info;
DELETE FROM order_info;

DELETE FROM customer_info
WHERE cust_id = 2;

SELECT * FROM customer_info;

SELECT * FROM order_info;

DELETE FROM order_info
WHERE customer_id_number = 6;

DELETE FROM order_info
WHERE customer_id_number IN ( SELECT  customer_id_number from order_info GROUP BY
								customer_id_number having COUNT(*)>1);
                                
                                
DELETE t1 from order_info t1
join order_info t2
on t1.customer_id_number = t2.customer_id_number
where t1.customer_id_number = t2.customer_id_number;

select kind, gender, avg(age) age_VG , count(kind) count
from pets
where age>3
GROUP BY kind, gender
HAVING count > 20 ORDER BY age_VG ASC
LIMIT 2;




/*
update 
alter clause
join 
subquery
*/

CREATE DATABASE `new topic`;

USE `new topic`;

CREATE TABLE customer(
id INT AUTO_INCREMENT,
`name` VARCHAR(20),
`email` TEXT CHECK (`email` LIKE "%.com"),
PRIMARY KEY(id)
 );
 
 
 
 SELECT * FROM customer;
 
 INSERT INTO customer(`name`, email)
 VALUES("kola", "kola@gmail.com"),
		("ade", "ade@gmail.com"),
        ("kemi", "kemi@gmail.com"),
        ("yemi", "yemi@gmail.com"),
        ("jame", "jame@gmail.com"),
        ("smith", "smith@gmail.com"),
        ("richeal", "richeal@gmail.com"),
        ("olaitan", "olaitan@gmail.com"),
        ("tolu", "tolu@gmail.com"),
        ("alao", "alao@gmail.com"),
        ("yusuf", "yusuf@gmail.com"),
        ("lukman", "lukman@gmail.com");
        
SELECT * FROM customer;
         
-- update

UPDATE customer
SET `name` = "sancho", email = "sancho@gmail.com"
WHERE id= 2;


SELECT * FROM customer;

UPDATE customer
SET  email = REPLACE(email, "gmail", "yahoo")
WHERE id= 4;


select replace("olAitan", "A", "a");


/*
add new column
drop old column
modify or change existing column
rename table

*/


SELECT * FROM customer;

ALTER TABLE customer
ADD gender ENUM("female", "male") AFTER `name`;


UPDATE customer
SET gender =   CASE
					WHEN id= 1 THEN "male"
                    WHEN id= 2 THEN "male"
                    WHEN id= 3 THEN "male"
                    WHEN id= 4 THEN "female"
                    WHEN id= 5 THEN "male"
                    WHEN id= 6 THEN "male"
                    WHEN id= 7 THEN "female"
                    WHEN id= 8 THEN "male"
                    WHEN id= 9 THEN "female"
                    WHEN id= 10 THEN "male"
                    WHEN id= 11 THEN "male"
                    WHEN id= 12 THEN "male"
                    END ;
                    
SELECT * FROM customer;


ALTER TABLE customer
ADD  W INT,
ADD I INT ;

DESCRIBE customer;


ALTER TABLE customer
MODIFY W  VARCHAR(12) DEFAULT "olaitan";


ALTER TABLE customer
CHANGE I lasop  VARCHAR(12) unique;

ALTER TABLE  customer
DROP W,
DROP lasop;


SELECT * FROM customer;


ALTER TABLE customer
RENAME TO `customer info`;

SELECT * FROM `customer info`;


ALTER TABLE `customer info`
change `order data`   `Order Date` TEXT;




UPDATE `customer info`
SET `Order Date` =   CASE
					WHEN id= 1 THEN "01-11-2023"
                    WHEN id= 2 THEN "03-11-2023"
                    WHEN id= 3 THEN "15-07-2023"
                    WHEN id= 4 THEN "14-09-2023"
                    WHEN id= 5 THEN "12-10-2023"
                    WHEN id= 6 THEN "11-10-2023"
                    WHEN id= 7 THEN "22-10-2023"
                    WHEN id= 8 THEN "21-07-2023"
                    WHEN id= 9 THEN "04-11-2023"
                    WHEN id= 10 THEN "19-05-2023"
                    WHEN id= 11 THEN "20-01-2023"
                    WHEN id= 12 THEN "21-02-2023"
                    END ;
                    
                    
CREATE TABLE `Order info`(
cust_id int,
quantity int,
priceEach int,
CONSTRAINT olaitan FOREIGN KEY(cust_id) REFERENCES `customer info`(id)
);

INSERT INTO `Order info`()
VALUES (1, 10, 500),  (10, 5, 300), (11, 2, 1500), (7, 2, 1000), (12, 12, 800), (2, 7, 600), (1, 10, 500), (10, 17, 632),
		(7, 28, 200), (1, 12, 500), (1, 10, 500), (7, 10, 500), (12, 5, 1200), (1, 10, 500), (2, 10, 500), (2, 7, 512),
        (7, 22, 700), (7, 8, 500), (1, 10, 500), (1, 10, 500), (5, 10, 500), (1, 10, 500), (1, 10, 500), (2, 10, 500);
        
        
SELECT * FROM `Order info`;

SELECT * FROM `customer info`;


-- INNER JOIN 

SELECT cust_id, `name`, (quantity * priceEach) as `Total price`
FROM `Order info` 
INNER JOIN   `customer info`
ON id = cust_id;

-- right join

SELECT cust_id, `name`, (quantity * priceEach) as `Total price`
FROM `Order info` 
LEFT JOIN   `customer info`
ON id = cust_id ;


-- SELECT THE NAME AND EMAIL ADDRESS OF CUSTOMERS YET TO PLACED ORDER;
SELECT `name`, email
FROM  `customer info`
LEFT JOIN `Order info` 
ON id = cust_id
WHERE priceEach IS NULL;


SELECT `name`, email
FROM `Order info` 
Right JOIN  `customer info`
ON id = cust_id