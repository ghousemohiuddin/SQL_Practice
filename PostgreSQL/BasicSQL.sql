SQL COMMANDS--> 
		DDL(Data Definition Language) ---> CREATE, DROP, ALTER, TRUNCATE 
		DML(Dalat Manipulation Language) ---> INSERT UPDATE DELETE, MERGE
		DCL(Data Control Language) ---> GRANT, REVOKE
		TCL(Transaction Control Language) ---> COMMIT, ROLLBACK, SAVEPOINT
		DQL(Data Query Language) ---> SELECT




To Create backup of a particular database right click on that articular database and select Backup.
If you get the error as "utility file not found. please correct the binary path in the preferences dialog pgadmin " then come to pgadmin click on file, select preferences and under paths select binary path and under postgreSQL binary path paste the bin path "C:\Program Files\PostgreSQL\15\bin" for your version (15) and click save.
Now click on back from the database you wish to create backup and write the filename and click on backup. I create for Supermart_DB with the Filename SupermartDB_Backup.
_________________________________________________________________________________________________________________________________________________________________________

Order of execution of SQL Query: 

	  F      J      W       G          H        S        D          O
	FROM   JOIN   WHERE   GROUP BY   HAVING   SELECT   DISTINCT   ORDER BY
	--------------------------------------------------------------------------->
_________________________________________________________________________________________________________________________________________________________________________

Different SQL operators:	=, <, >, >=, <=, <>, !=, BETWEEN, ORDER BY, IN, NOT IN, LIKE, ALIAS, DISTINCT, LIMIT, CASE.
Comparision Operators:      =, <>, !=, <, >, >=, <=.
Arithmetic Operators:       +, -, *, /, %
Logical Operators:          AND, OR, NOT, IN, BETWEEN, LIKE etc. 
________________________________________________________________________________________________________________________________________________________________________


When in PgAdmin a path of the file provided to read, write etc from a csv or a text files etc if the permission is denied then just go to that particular folder where the file is kept and right click on that folder and select properties and then click on security and click on edit below the 'groups and usernames' box , click on add and write "Everyone" click on add. In the permissions for everyone box check the read, write and list folder contents check boxex. Click on ok and then again ok. Now you will not get the permissions denied error.

select * from customer_table;
copy customer_table from 'D:\DA\SQL_DA\original.csv' delimiter ',' csv header;
copy customer_table from 'D:\DA\SQL_DA\original.txt' delimiter ',';
select * from customer_table;
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT retrieve and view data from one or many tables.

SELECT column_name FROM table_name WHERE join/filter conditions;

SELECT T1.column1 as C1, T2.column2 as C2, T1.column3 C3 
FROM table1 as T1 
Join table2 as T2 ON T1.column1 = T2.column1 AND T1.column2 = T2.column2;

SELECT T1.column1 as C1, T2.column2 as C2, T1.column3 C3
FROM table1 as T1, table2 as T2
WHERE T1.column1 = T2.column2
AND T1.column2=T2.column2;
------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 
CREATE TABLE table_name (column1 DATA_TYPE, column2 DATA_TYPE CONSTRAINT, column3 DATA_TYPE, CONSTRAINT constraint_name...);

CREATE TABLE STUDENTS
(
	id          VARCHAR(20) PRIMARY KEY,
	first_name  VARCHAR(100) NOT NULL,
	last_name   VARCHAR(100) NOT NULL,
	gender      VARCHAR(10) CHECK (gender IN ('M','F','Male','Female')),
	age         INT,
	dob         DATE,
	grade       FLOAT,
	is_active   BOOLEAN,
	CONSTRAINT ch_students_age CHECK (AGE>0)
);

CREATE TABLE ADDRESS(
	ADDRESS_ID VARCHAR(20) PRIMARY KEY,
	STREET VARCHAR(250),
	CITY VARCHAR(100),
	STATE VARCHAR(100),
	COUNTRY VARCHAR(100)
);

CREATE TABLE SCHOOL(
	SCHOOL_ID VARCHAR(20) PRIMARY KEY,
	SCHOOL_NAME VARCHAR(250),
	EDUCATION_BOARD VARCHAR(100),
	ADDRESS_ID VARCHAR(20)
);

CREATE TABLE STAFF
(
	STAFF_ID     VARCHAR(20),
	STAFF_TYPE   VARCHAR(30),
	SCHOOL_ID    VARCHAR(20),
	FIRST_NAME   VARCHAR(100) NOT NULL,
	LAST_NAME    VARCHAR(100) NOT NULL,
	AGE          INT,
	DOB          DATE,
	GENDER       VARCHAR(10) CHECK (GENDER IN ('M','F')),
	JOIN_DATE    DATE,
	ADDRESS_ID   VARCHAR(20),
	CONSTRAINT PK_STAFF PRIMARY KEY(STAFF_ID),
	CONSTRAINT FK_STAF_SCHL FOREIGN KEY(SCHOOL_ID) REFERENCES SCHOOL(SCHOOL_ID),
	CONSTRAINT FK_STAFF_ADDR FOREIGN KEY(ADDRESS_ID) REFERENCES ADDRESS(ADDRESS_ID)
);

CONSTRAINTS:
CHECK        - Helps to control the values being inserted in to a table column
NOT NULL     - Helps to ensure that the column value in every row is never blank or empty or null
PRIMARY KEY  - Ensure that the column value in every row is unique and has no NULL values.
FOREIGN KEY  - Helps to form parent child relatioship between tables. Child table references column values from parent table.
UNIQUE       - Helps to ensure that the column value in every row is unique. It can help to remove any duplicate data in a column. Null values are allowed in a UNIQUE 	constraint column as two NULLS are never same. Hence multiple rows with NULL values are allowed.
		
 
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------						
insert into customer_table values(1,'Ismail','Mohammad',80,'babasaheb@gmail.com'); 

INSERT INTO customer_table (first_name,last_name,email_id,age,cust_id) VALUES('salman','khan', 'skf@gmail.com',58,2);

INSERT INTO customer_table VALUES
(3,'shahrukh','khan',57,'srk@gmail.com'),
(4,'atif','aslam',30,'atifaslam@gmail.com'),
(5,'abida','parveen',60,'abidaparveen@gmail.com');

SELECT * FROM public.customer_table
SELECT * FROM customer_table;
SELECT first_name FROM customer_table; 
SELECT first_name, last_name, cust_id FROM customer_table;   #output table columns will be in the order provided in the query not in the order provided during creation.
_________________________________________________________________________________________________________________________________________________________________________
The DISTINCT keyword is is used in conjunction with SELECT statement to eliminate all the duplicate records and fetching only unique records.

SELECT DISTINCT * FROM customer_table; 
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
The WHERE cluase is used to specify a condition while fetching the data from a single table or by joining with multople tables. If the given condition is satisfied then only it returns a specific value from the table.

SELECT column_name FROM table_name WHERE condition;

SELECT DISTINCT * FROM customer_table WHERE first_name='salman';
SELECT * FROM customer_table WHERE first_name='salman';
SELECT DISTINCT * FROM customer_table WHERE age>=50
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
The AND, OR operators are used to combine multiple conditions to narrow data in SQL statement. These two operators are called as the conjuctive operators.

SELECT column_name FROM table_name WHERE condition AND/OR condition ...;

SELECT first_name,last_name FROM customer_table WHERE age>60 AND age<90;
SELECT first_name,last_name,age FROM customer_table WHERE age<30 OR first_name='shahrukh';
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
The UPDATE Query is used to modify the existing records in a table.

UPDATE table_name SET column_1=value1, column_2=value2, .... WHERE condition;

UPDATE customer_table SET age=20, last_name='khan' WHERE cust_id=2;                           #single row
UPDATE customer_table SET age=20, last_name='khan' WHERE cust_id=1 OR first_name='shahrukh';  #multiple rows
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
The DELETE Query is used to delete the exixting records from a table.

DELETE FROM table_name WHERE condition;

DELETE FROM customer_table WHERE cust_id=2; #single row
DELETE FROM customer_table WHERE age>50;    #multiple rows
DELETE FROM customer_table;                 #all rows but the table structure will be there with empty rows.
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
The ALTER TABLE statement is used to change the definition or structure of an existing table.

ALTER TABLE customer_table specified actions;

Following actions can be performed
Columns - Add, Delete(Drop), Modify or Rename.
Constraints - Add, Drop
Index - Add, Drop

Column: ADD/DROP

ALTER TABLE table_name ADD column_name data_type;
ALTER TABLE table_name DROP column_name;

ALTER TABLE customer_table ADD test_column varchar;
ALTER TABLE customer_table DROP test_column;

Column: MODIFY/RENAME

ALTER TABLE table_name ALTER COLUMN column_name TYPE new_data_type;
ALTER TABLE table_name RENAME COLUMN old_column_name TO new_column_name;

ALTER TABLE customer_table RENAME email_id TO customer_email;

Constraint: ADD/DROP

ALTER TABLE table_name ALTER COLUMN column_name SET NOT NULL;
ALTER TABLE table_name ALTER COLUMN column_name DROP NOT NULL;
ALTER TABLE table_name ADD CONSTRAINT column_name CHECK (column_name>=1);
ALTER TABLE table_name ADD PRIMARY KEY (column_name);
ALTER TABLE child_table ADD CONSTRAINT child_column FOREIGN KEY (parent_column) REFERENCES parent_table;

ALTER TABLE customer_table ALTER COLUMN cust_id SET NOT NULL;
ALTER TABLE customer_table ALTER COLUMN cust_id DROP NOT NULL;
ALTER TABLE customer_table ADD CONSTRAINT cust_id CHECK (cust_id>=1);  #With this query we will not be able to add a customer id less than 1.
ALTER TABLE customer_table ADD PRIMARY KEY (cust_id);
ALTER TABLE customer_table ADD CONSTRAINT any_const_name UNIQUE (column_name); #this will add a constraint UNIQUE to a column. Here any_const_name is any name given to the constraint.

DROP TABLE table_name;
DROP FUNCTION function_name;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_________________________________________________________________________________________________________________________________________________________________________


CREATE TABLE public.customer
(
    "customer_id" character varying PRIMARY KEY NOT NULL,
    "customer_name" character varying COLLATE pg_catalog."default",
    "segment" character varying COLLATE pg_catalog."default",
    "age" integer,
    "country" character varying COLLATE pg_catalog."default",
    "city" character varying COLLATE pg_catalog."default",
    "state" character varying COLLATE pg_catalog."default",
    "postal_code" integer,
    "region" character varying COLLATE pg_catalog."default"
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.customer
    OWNER to postgres;

copy customer from 'D:\DA\SQL_DA\Customer.csv' delimiter ',' csv header;

CREATE TABLE public.product
(
    "product_id" character varying PRIMARY KEY,
    "category" character varying COLLATE pg_catalog."default",
    "sub_category" character varying COLLATE pg_catalog."default",
    "product Name" character varying COLLATE pg_catalog."default"
	)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.product
    OWNER to postgres;
	
copy product from 'D:\DA\SQL_DA\Product.csv' delimiter ',' csv header;

CREATE TABLE public.sales
(
    "order_line" integer PRIMARY KEY ,
    "order_id" character varying COLLATE pg_catalog."default",
    "order_date" date,
    "ship_date" character varying COLLATE pg_catalog."default",
    "ship_mode" character varying COLLATE pg_catalog."default",
    "customer_id" character varying COLLATE pg_catalog."default" references customer("customer_id"),
    "product_id" character varying COLLATE pg_catalog."default" references product("product_id"),
    "sales" double precision,
    "quantity" integer,
    "discount" double precision,
    "profit" double precision
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.sales
    OWNER to postgres;

 	
copy sales from 'D:\DA\SQL_DA\Sales.csv' delimiter ',' csv header;



-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
The IN and NOT IN condition is used to help reduce the need to use multiple OR conditions in a SELECT, INSERT, UPDATE, DELETE statements.

SELECT column_name FROM table_name WHERE column_name IN (value1,value2,value3....);

SELECT * FROM customer WHERE age IN (66,22,33,50);
SELECT * FROM customer WHERE state NOT IN ('California','Nevada','Indiana','Delaware'); 
SELECT * FROM customer WHERE state='California' OR state='Nevada' OR state='Indiana' OR state='Delaware'; 

The above two queries gives the same result, so IN condition is helpful when we are querying for a large list (Eg: 1000 states).
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
The BETWEEN condition is used to retrieve values within a range in a SELECT, INSERT, UPDATE, DELETE statements.

SELECT column_name FROM table_name WHERE column_name BETWEEN value1 and value2;

SELECT * FROM customer WHERE age BETWEEN 20 and 30; 
SELECT * FROM customer WHERE age>=20 AND AGE<=30;  

The above two gives the same result.

SELECT * FROM customer WHERE age NOT BETWEEN 20 AND 30;
SELECT * FROM sales WHERE ship_date BETWEEN '04-01-2015'AND '04-01-2017'; here ship_date is of type varchar.
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
The LIKE condition allows you to perform matching using Wildcards.

SELECT column_name FROM table_name WHERE column_name LIKE {PATTERN};   #{PATTERN} offen consits of Wildcards % and _.

Wildcard "%" Allows you to match any string of any length(including zero length).
Wildcard "_" Allows you to match on a single character.

A% means starts with A like ABC or ABCDE.
%A means anything that ends with A.
A%B means starts with A but ends with B.

AB_C means string starts with AB, then there is one character, then there is C.

SELECT * FROM customer_table WHERE first_name LIKE 'Jo%';
SELECT * FROM customer_table WHERE first_name LIKE '%od%';
SELECT first_name, last_name FROM customer_table WHERE first_name LIKE 'Jas_n';
SELECT first_name, last_name FROM customer_table WHERE last_name NOT LIKE 'J%';

Here if we want  any value which includes % in its name or value then use \%
SELECT * FROM customer_table WHERE first_name LIKE 'R\%'; # Here we are looking for a first_name which contains % 
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
The ORDER BY clause is used to sort the records in the result set. It can only be used in SELECT statements.

SELECT column_name FROM table_name WHERE condition ORDER BY column_name/column_number ASC/DESC;

It is possible to order by more than one column. ORDER BY column_name1 ASC/DESC, column_name2 ASC/DESC. By default it is Ascending order and for Descending order we need to mention.

SELECT * FROM customer WHERE state='California' ORDER BY customer_name ASC;
SELECT * FROM customer ORDER BY 2 DESC;       # 2 is the column number 
SELECT * FROM customer WHERE age>25 ORDER BY city ASC, customer_name DESC;
SELECT * FROM customer ORDER BY age;
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
The LIMIT statement is used to limit the number of records returned based on a limit value.

SELECT column_names FROM table_name WHERE condition ORDER BY expression ASC/DESC LIMIT row_count;

SELECT * FROM customer WHERE age>=25 ORDER BY age DESC LIMIT 8;
SELECT * FROM customer WHERE age>=25 ORDER BY age ASC LIMIT 10;
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
The keyword AS is used to assign an alias to the column or a table. It is inserted between the column name and the column alias or between the table name and the table alias.

SELECT column_name AS column_alias FROM table_name;

SELECT customer_id AS "serial number", customer_name AS name, age as customer_age FROM customer; 

keep the serial number in double quotes as there is a space in between the column name.
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
The COUNT function returns the count of an expression.

SELECT 'column_name1', COUNT (column_name2) FROM table_name;

SELECT COUNT(*) FROM sales;
SELECT COUNT(order_line) AS "Number of Products Ordered", COUNT(DISTINCT order_id) AS "Number of Orders" FROM sales WHERE customer_id='CG-12520';
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
The SUM function returns the summed value of an expression.

SELECT SUM(aggregate_expression) FROM tables WHERE condition;

SELECT SUM(profit) AS "TotalProfit" FROM sales;
SELECT SUM(quantity) AS "Total Quantity" FROM sales where product_id='FUR-TA-10000577';
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
The AVG Function returns the average value of an expression.

SELECT AVG(aggregate_expression) FROM table_name WHERE condition;

SELECT AVG(age) AS "Average customer age" FROM customer;
SELECT AVG(sales*0.10) AS "Average Commission Value" FROM sales;
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
MIN/MAX function returns the minimum/maximum value of an expression.

SELECT MIN(aggregate_expression) FROM table_name WHERE condition;
SELECT MAX(aggregate_expression) FROM table_name WHERE condition;

SELECT MIN(sales) AS Min_sales_June15 FROM sales WHERE order_date BETWEEN '2015-06-01' AND '2015-06-30'; # Here order_date is a date data type
SELECT MAX(sales) AS MIN_sales_June15 FROM sales WHERE order_date BETWEEN '2015-06-01' AND '2015-06-30';
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
The GROUP BY clause is used in a SELECT statement to group the results by one or more columns.

SELECT column_name1, function_type(column_name2) FROM table_name GROUP BY column_name1;

SELECT region, COUNT(customer_id) AS customer_count FROM customer GROUP BY region;
SELECT product_id,SUM(quantity) AS quantity_sold FROM sales GROUP BY product_id ORDER BY quantity_sold DESC;
SELECT customer_id, MIN(sales) AS min_sales, MAX(sales) AS max_sales AVG(sales) AS Avg_Sales, SUM(sales) AS total_sales FROM sales GROUP BY customer_id ORDER BY total_sales DESC LIMIT 5; 
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
HAVING clause is used in combination with the GROUP BY clause to restrict the groups of returned rows to only those whose the condition is TRUE.

SELECT column_name, aggregate_function(expresion) FROM table WHERE condition GROUP BY column1 HAVING condition;

SELECT region, COUNT(customer_id) AS customer_count FROM customer GROUP BY region HAVING COUNT(customer_id)>200;
SELECT region, COUNT(customer_id) AS customer_count FROM customer WHERE customer_name LIKE 'A%' GROUP BY region HAVING COUNT(customer_id)>15;
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CASE Statement

SELECT STAFF_ID, SALARY,
	(CASE WHEN SALARY >= 10000 THEN 'High Salary'
	      WHEN SALARY BETWEEN 5000 AND 10000 THEN 'Average Salary'
		  WHEN SALARY <5000 THEN 'Too Low'
	END) AS RANGE           #RANGE will be the name of the column when the output High, Average and Low Salary is displayed.             
FROM STAFF_SALARY
ORDER BY 2 DESC;          # ORDER BY 2 DESC indicates order the second column in descending order.

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

ROUND to 2 decimal places in MySQL “ROUND(276.9877,2)” = 276.98
ROUND to 2 decimal places in MS SQL “CAST(276.9877,2 AS DECIMAL(10,2))” = 276.98

