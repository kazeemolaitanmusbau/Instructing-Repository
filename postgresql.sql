/* Statement: is a set of instruction that we put together to achieve a 
		certain task on a database it can be read and understand by RDBMS*/
		
/* comment : is a text written by a programmer to illustrate what the statement
is doing, it can not be read and understand RDBMD 
*/


-- you can anything to illustrate your statement


-- How to create a database
CREATE DATABASE "WeekEnd Class";

-- create with if not exists commnad
CREATE DATABASE "ola";


/*
DDL: Data Defination Language
DML : Data Manipulation Language
DCL : Data Control Language
*/

-- how to create table
CREATE TABLE "table one" (

id INTEGER ,
first_name VARCHAR(5),
last_name CHAR(5),
address TEXT
);

-- TO SELECT ALL THE COLUMNS FROM A TABLE 
SELECT * FROM "table one";

-- how to select specific columns from a table
SELECT id, last_name FROM "table one";


-- inserting data/records to the table
INSERT INTO "table one"(id, first_name, last_name, address)
VALUES(1, 'ola', 'Ade', 'leki'),
		(2, 'yemi', 'Ada', 'berger'),
		(3, 'kemi', 'Dada', 'olowoira');
		
		
SELECT * FROM "table one";


-- delete.... truncate and drop

-- delete customer with id of 2

DELETE FROM "table one"
WHERE id=2;

-- to delete all the records in the table

DELETE FROM "table one";

TRUNCATE "table one";


-- to delete table completely from the database
DROP TABLE "table one";


/*
constraint in Sql

not null
default
unique
check
enum
serial
primary key
foreign key

*/


CREATE TABLE "first table"(
id integer,
firstname VARCHAR(12) NOT NULL
);

-- MAKE TO QUERY TO SEE THE VALUES IN FIRST TABLE
SELECT * FROM "first table";

INSERT INTO "first table"
VALUES (1, 'Olaitan');


INSERT INTO "first table"(firstname)
VALUES ( 'kazeem');


INSERT INTO "first table"(id)
VALUES (3);




CREATE TABLE "table two"(
id integer,
state varchar(12) DEFAULT 'Lagos'
);


SELECT * FROM "table two";

INSERT INTO "table two"
VALUES(1, 'Abuja'),
		(2, 'Kaduna');


INSERT INTO "table two"(id)
VALUES(3),
		(4 );
		
		
-- Unique

CREATE TABLE "table threell"(
id integer,
brand varchar(12) UNIQUE,
primary key (id)
);

INSERT INTO "table three"
VALUES (1, 'Gucci'),
		(2, 'Nike'),
		(3, 'Adidas');
		
SELECT * FROM "table three";

INSERT INTO "table three"
VALUES (3, lower('ABA'));

-- check

CREATE TABLE "table four"(
firstname CHAR NOT NULL,
age integer CHECK(age>=18) -- VALUE FROM 18 ABOVE SHOULD BE ACCEPTED ELSE REJECT
);


SELECT * FROM "table four";

INSERT INTO "table four"
VALUES ('O', 21);


INSERT INTO "table four"
VALUES ('A', 1);

CREATE TYPE brdname AS ENUM('Gucci', 'Nike');

CREATE TABLE "table five"(
id integer,
brand_name  brdname
);

INSERT INTO "table five"
VALUES (1, 'Gucci')

SELECT * FROM "table five"

INSERT INTO "table five"
VALUES (1, 'Adiddas');

CREATE TABLE "table six"(
id SERIAL,
firstname Char(12));


INSERT INTO "table six"(firstname)
VALUES ('OLAITAN'),
		('JAMES'),
		('ADA');
		
SELECT * FROM "table six"




CREATE TABLE "table seven"(
cus_id integer primary key,
cus_name varchar(12));


SELECT * FROM "table seven";


INSERT INTO "table seven"
VALUES(1, 'sancho'),
		(2, 'james');
		
		
INSERT INTO "table seven"
VALUES(1, 'YEMI');

CREATE TABLE basket_a (
    a INT PRIMARY KEY,
    fruit_a VARCHAR (100) NOT NULL
);

CREATE TABLE basket_b (
    b INT PRIMARY KEY,
    fruit_b VARCHAR (100) NOT NULL
);

INSERT INTO basket_a (a, fruit_a)
VALUES
    (1, 'Apple'),
    (2, 'Orange'),
    (3, 'Banana'),
    (4, 'Cucumber');

INSERT INTO basket_b (b, fruit_b)
VALUES
    (1, 'Orange'),
    (2, 'Apple'),
    (3, 'Watermelon'),
    (4, 'Pear');


select * from  basket_a;

select * from  basket_b;


select a.a, a.fruit_a, b.b, b.fruit_b
from basket_a a
left join basket_b b
on a.fruit_a = b.fruit_b
where b.fruit_b is null;



select a.a, a.fruit_a, b.b, b.fruit_b
from basket_a a
full join basket_b b
on a.fruit_a = b.fruit_b;

drop table if exists employee_info;

create table employee_info(

employee_id integer,
employee_name varchar(20),	
manager_id integer	
);

select * from employee_info;


copy employee_info from  'C:/Users/pc/Documents/Lasop/Mysql/self.csv' DELIMITER ','
CSV HEADER;


select e.employee_id emp_id, e.employee_name as emp_name,
		e.manager_id mag_id, m.employee_name as mag_name
		
		from employee_info e
		inner join employee_info m
		on m.employee_id > e.manager_id;
		
drop table sale;	
select * from sale;
		
		
		
		
	
		
CREATE TABLE sales(

"Date" DATE,
Item VARCHAR(20),
Quantity integer,
Price integer
); 
		
select * from sales;	
		
select * from too;	
	
create temporary table too as
select * from sales
where quantity >2;
		
	
create view too as
select * from sales
where quantity >2;
			
select date_format	
		
		
create table dup_salesa as select item from sales where quantity=2;		

LOCK TABLE info_table READ;
create table v like sales

SELECT CONNECTION_ID(); 

LOCK TABLE info_table READ;

insert into dup_salesa
values('ola')
on conflict (item)
do nothing;

select * from dup_salesa;


create table i(
id integer unique,
N varchar(12))



insert into i
values (1, 'K'),
		(2, 'i'),
		(1, 'M')
on conflict (id)
do nothing

select * from i


SELECT IF(200>350,'YES','NO'); 

/*
select distinct
columns alias
limit/ fetch
order by
*/		

CREATE TABLE sales_info(
"Order Date" Text,
Item VARCHAR(20),
Quantity integer,
price integer	
);

SELECT * FROM sales_info;


-- distinct:::: to remove duplicate entries from the query 
SELECT DISTINCT * FROM sales_info;


-- alias:: remaning the columns name in the query
SELECT DISTINCT "Order Date"  Purchased_date, Item as Product, Price  as price_each
FROM sales_info;

-- using limit to return first five rows on the sale_info table
SELECT * FROM sales_info
LIMIT 5;

-- using fetch to return first five rows on the sale_info table
SELECT * FROM sales_info
FETCH 	NEXT 5 ROWS ONLY;


SELECT * FROM sales_info
OFFSET 1 ROWS
FETCH 	NEXT 10 ROWS ONLY;

-- ORDER BY::: IS USED FOR SORTING IN SQL
SELECT * FROM sales_info
ORDER BY quantity ASC;

-- SORTING WITH ONE COLUMNS
SELECT * FROM sales_info
ORDER BY Item DESC;


-- SORTING WITH TWO COLUMNS
SELECT "Order Date", Item, Price
FROM sales_info
ORDER BY "Order Date" DESC,  Price ASC;


-- SORTING WITH TWO COLUMNS
SELECT "Order Date", Item, Price
FROM sales_info
ORDER BY Item DESC,  Price ASC;

-- Dress Jeans Skirt Swimwear "T Shirt"
SELECT * FROM sales_info
ORDER BY item desc;

-- Swimwear, Jeans "T Shirt",  Dress Skirt

SELECT * FROM sales_info
ORDER BY  CASE
				WHEN Item = 'Swimwear' THEN 1
				WHEN Item = 'Jeans' THEN 2
				WHEN Item = 'T Shirt' THEN 3
				WHEN Item = 'Dress' THEN 4
				-- WHEN Item = 'Skirt' THEN 5
		 ELSE 5
		END ;
	
	
-- WHERE CLAUSE

/*
OPERATOR TO COMBINE WEHERE CLAUSE WITH

EQUAL::::: =
NOT EQUAL::::  <>
GREATER THAN::: >
GRAEATER THAN OR EQUAL:::  >=
LESS THAN:::: <
LESS THAN OR EQUAL TO::::: <=
LIKE
IN 
NOT LIKE
NOT IN
IS NULL
AND 
OR 
BETWEEN
NOT BETWEEN

*/

-- select all from salesinfo when item is Skirt only

SELECT * FROM sales_info
WHERE Item = 'Skirt';

-- select all from salesinfo when item is Skirt, T shirt  only
SELECT * FROM sales_info
WHERE Item = 'Skirt'
or Item = 'T Shirt';

-- select all from salesinfo when item is Skirt and the price for
-- each is greater than 99, T shirt and the price for
-- each is less than 99

 SELECT * FROM sales_info
WHERE Item = 'Skirt' AND price>= 99
or Item = 'T Shirt'   AND price<= 99 ; 

-- all item that name start with s
SELECT * FROM sales_info
WHERE item LIKE 'Sw%';


-- return all item that name ends with t
SELECT * FROM sales_info
WHERE item LIKE '%t';


-- return all item that i can be find anywhere in the name 
SELECT * FROM sales_info
WHERE item LIKE '%i%';

SELECT * FROM sales_info
WHERE item LIKE 'Dr___';



/*
group by
having
join ---- inner join, left join, right join, self join
alter clause

*/

SELECT * FROM sales_info;


CREATE TABLE people_info(
id SERIAL,
states varchar(20),
gender char(12),
age integer,
salary decimal(10, 2)
);

SELECT * FROM people_info;

INSERT INTO people_info(states, gender, age, salary)
VALUES('lagos', 'male', 32, 2376.34),
		('kaduna', 'male', 42, 27376.34),
		('kaduna', 'female', 27, 6353.83),
		('lagos', 'female', 38, 3637.11),
		('kaduna', 'male', 37, 2376.34),
		('lagos', 'male', 32, 2376.34),
		('kaduna', 'male', 18, 72837.34),
		('lagos', 'female', 33, 6251.34),
		('lagos', 'male', 32, 2376.34),
		('lagos', 'female', 26, 4857.34),
		('kaduna', 'female', 29, 3747.34);
		
SELECT * FROM people_info;

-- retrun the average age of people in lagos and kaduna state
SELECT states , count(gender), avg(age)
from people_info   --- group by one column and apply agg on two columns
GROUP BY states;


-- groupping with more than one column

SELECT gender, states, count(gender) AS gender_count, round( avg(age), 2) AS average_age
from people_info
GROUP BY 1, 2
having gender='male';




CREATE TABLE student_info(
id serial,
firstname varchar(20))

INSERT INTO student_info(firstname)
VALUES('ola'), ('kola'), ('yemi'), ('ade'), ('ojo'), ('smith'), ('james'), 
('sancho'), ('onana'),('alao');

SELECT * FROM student_info;


CREATE TABLE grade_info(
stdnt_id int,
grade varchar(20)
);

INSERT INTO grade_info
VALUES(2, 'Pass'),(4, 'Fail'),(7, 'Pass'),(1, 'Pass'),(9, 'Pass'),(5, 'Fail');

SELECT * FROM student_info;
SELECT * FROM grade_info;

-- inner join
SELECT id, firstname, grade, stdnt_id
FROM student_info
INNER JOIN grade_info
ON  id = stdnt_id


-- right join
SELECT id, firstname, grade, stdnt_id
FROM student_info
RIGHT JOIN grade_info
ON  id = stdnt_id



-- LEFT join
SELECT id, firstname, grade, stdnt_id
FROM student_info
LEFT JOIN grade_info
ON  id = stdnt_id