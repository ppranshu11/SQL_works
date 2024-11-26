CREATE DATABASE ASSIGNMENT3;
USE ASSIGNMENT3;
CREATE TABLE CUSTOMER
(CUSTOMER_ID INT,CUSTOMER_NAME VARCHAR(100),CITY VARCHAR(50),GRADE INT,SALESMAN_ID INT);
INSERT INTO CUSTOMER VALUES
(3002,"NICK RIMANDO","NEW YORK",100,5001),
(3007,"BRAD DAVIS","NEW YORK",200,5001),
(3005,"GRAHAM ZUSI","CLIFORNIA",200,5002),
(3008,"JULIAN GREEN","LONDON",300,5002),
(3004,"FANIAN JOHNSON","PARIS",300,5006),
(3009,"GEOFF CAMERON","BERLIN",100,5003),
(3003,"JOZY ALTIDOR","MOSCOW",200,5007),
(3001,"BRAD GUZAN","LONDON",NULL,5005);
CREATE TABLE SALESMAN
(SALESMAN_ID INT,SALESMAN_NAME VARCHAR(100),SALESMAN_CITY VARCHAR(50),COMMISSION FLOAT);
INSERT INTO SALESMAN VALUES
(5001,"HAMES HOOG","NEW TORK",0.15),
(5002,"NAIL KNITE","PARIS",0.13),
(5005,"PIT ALEX","LONDON",0.11),
(5006,"MC LYON","ROME",0.14),
(5007,"PAUL ADAM","ROME",0.13),
(5003,"LAUSON HEN","SAN JOSE",0.12);
CREATE TABLE ORDERS
(ORD_NO INT,PURCHES_AMOUNT FLOAT,ORD_DATE DATE,CUSTOMER_ID INT,SALESMAN_ID INT);
INSERT INTO ORDERS VALUES
(70001,150.5,"2012-10-05",3005,5002),
(70009,270.65,"2012-09-10",3001,5005),
(70002,65.26,"2012-10-05",3002,5001),
(70004,110.5,"2012-08-17",3009,5003),
(70007,948.5,"2012-09-10",3005,5002),
(70005,2400.6,"2012-07-27",3007,5001),
(70008,5760,"2012-09-10",3002,5001);
SELECT*FROM CUSTOMER;
SELECT*FROM SALESMAN;
SELECT*FROM ORDERS;
/* QUESTION NO.1 :- FROM THE FOLLOWING TABLES WRITE A SQL QUERY TO FIND THE SALEMAN AND COSTUMER WHO RESIDE IN THE SAME CITY.RETURN SALESMAN,
COSTUMER_NAME AND CITY*/
 SELECT S.SALESMAN_NAME,C.CUSTOMER_NAME,C.CITY FROM CUSTOMER AS C,SALESMAN AS S WHERE C.CITY=S.SALESMAN_CITY;

/* QUESTION NO.2 :-FROM THE FOLLOWING TABLES WRITE A SQL QUERY TO FIND THOES ORDER WHRE THE ORDER AMOUNT EXIST BETWEEN 500 and 2000.RETURN ORD_NO,PURCH_AMOUNT,
CUST_NAME,CITY*/
SELECT O.ORD_NO,O.PURCHES_AMOUNT,C.CUSTOMER_NAME,C.CITY FROM CUSTOMER AS C ,ORDERS AS O WHERE C.CUSTOMER_ID=O.CUSTOMER_ID AND PURCHES_AMOUNT BETWEEN 500 AND 2000;

/* QUESTION NO.3 :- FROM THE FOLLOWING TABLES WRITE A SQL QUERY TO FIND THE SALESMANPERSON AND THE COSTUMER HE REPRESENTE.RETURN COSTUMER_NAME,CITY,SALESMAN,COMMISSION*/
SELECT C.CUSTOMER_NAME,C.CITY,S.SALESMAN_NAME,S.COMMISSION FROM CUSTOMER C INNER JOIN SALESMAN S ON C.SALESMAN_ID=S.SALESMAN_ID;

/* QUESTION NO.4 :- FROM THE FOLLOWING TABLES WRITE A SQL QUERY TO FIND SALESPEOPLE WHO RECIEVED COMMISSION OF MORE THAN 12 PERCENT FROM THE COMPANY.RETURN COSTUMER_NAME,
COSTUMER_CITY,SALESMAN,COMMISSION.*/
SELECT CUSTOMER_NAME,CITY,SALESMAN_NAME,COMMISSION FROM CUSTOMER C INNER JOIN SALESMAN S ON C.SALESMAN_ID=S.SALESMAN_ID WHERE COMMISSION>0.12;

/* QUESTION NO.5 :- From the following tables write a SQL query to locate those salespeople who do not live in the same city where their customers live and have received a 
commission of more than 12% from the company. Return Customer Name, customer city, Salesman, salesman city, commission.*/
SELECT C.CUSTOMER_NAME,C.CITY,S.SALESMAN_NAME,S.COMMISSION FROM CUSTOMER AS C INNER JOIN SALESMAN AS S ON 
C.SALESMAN_ID=S.SALESMAN_ID WHERE C.CITY<>S.SALESMAN_CITY AND COMMISSION>0.12;

/* QUESTION NO.6 :- From the following tables write a SQL query to find the details of an order. Return 
ord_no, ord_date, purch_amt, Customer Name, grade, Salesman, commission.*/
SELECT O.ORD_NO,O.ORD_DATE,O.PURCHES_AMOUNT,C.CUSTOMER_NAME,C.GRADE,S.SALESMAN_NAME,S.COMMISSION FROM ORDERS O INNER JOIN CUSTOMER C ON O.CUSTOMER_ID=C.CUSTOMER_ID
INNER JOIN SALESMAN S ON O.SALESMAN_ID=S.SALESMAN_ID;

/* QUESTION NO.7 :- From the following tables write a SQL query to display the customer name, customer city, grade, salesman, salesman city. The results should be sorted
by ascending customer_id.*/
SELECT C.CUSTOMER_NAME,C.CITY,C.GRADE,S.SALESMAN_NAME,S.SALESMAN_CITY,C.CUSTOMER_ID FROM CUSTOMER C INNER JOIN SALESMAN S ON C.SALESMAN_ID=S.SALESMAN_ID ORDER BY C.CUSTOMER_ID ASC;

/* QUESTION NO.8 :- From the following tables write a SQL query to find those customers with a grade less than 300. Return cust_name, customer city, grade, Salesman,
salesmancity.The result should be ordered by ascending customer_id.*/
SELECT C.CUSTOMER_NAME,C.CITY,C.GRADE,S.SALESMAN_NAME,S.SALESMAN_CITY FROM CUSTOMER C RIGHT JOIN SALESMAN S ON C.SALESMAN_ID=S.SALESMAN_ID
WHERE GRADE<300 ORDER BY CUSTOMER_ID ASC;

/* QUESTION NO.9 :- Write a SQL statement to make a report with customer name, city, order number, order date, and order amount in ascending order according to the
order date to determine whether any of the existing customers have placed an order or not.*/
SELECT C.CUSTOMER_NAME,C.CITY,O.ORD_NO,ORD_DATE,O.PURCHES_AMOUNT FROM CUSTOMER C RIGHT JOIN ORDERS O ON C.CUSTOMER_ID=O.CUSTOMER_ID ORDER BY ORD_DATE ASC;

/* QUESTION NO.10 :- Write a SQL statement to generate a report with customer name, city, order number, order date, order amount, salesperson name, and commission
to determine if any of the existing customers have not placed orders or if they have placed orders through their salesman or by themselves.*/
SELECT C.CUSTOMER_NAME,C.CITY,S.SALESMAN_NAME,S.COMMISSION,O.ORD_DATE,O.ORD_NO,O.PURCHES_AMOUNT FROM CUSTOMER C RIGHT JOIN SALESMAN S ON C.SALESMAN_ID=S.SALESMAN_ID RIGHT JOIN
ORDERS O ON S.SALESMAN_ID=O.SALESMAN_ID;

/* QUESTION NO.11 :- Write a SQL statement to generate a list in ascending order of salespersons who work either for one or more customers or have not yet joined any 
of the customers.*/
SELECT C.CUSTOMER_NAME,C.CITY,S.SALESMAN_NAME,S.SALESMAN_CITY FROM CUSTOMER C RIGHT JOIN SALESMAN S ON C.SALESMAN_ID=S.SALESMAN_ID ORDER BY C.CUSTOMER_NAME ASC;

/* QUESTION NO.12 :- From the following tables write a SQL query to list all salespersons along with customer name, city, grade, order number, date, and amount. 
Condition for selecting list of salesmen : 1. Salesmen who works for one or more customer or, 2. Salesmen who not yet join under any customer, Condition for 
selecting list of customer : 3. placed one or more orders, or 4. no order placed to their salesman.*/
SELECT C.CUSTOMER_NAME,C.CITY,C.GRADE,S.SALESMAN_NAME,O.ORD_NO,O.ORD_DATE,O.PURCHES_AMOUNT FROM CUSTOMER C RIGHT JOIN SALESMAN S ON C.SALESMAN_ID=S.SALESMAN_ID
RIGHT JOIN ORDERS O ON C.CUSTOMER_ID=O.CUSTOMER_ID; 

/* QUESTION NO.13 :- Write a SQL statement to make a list for the salesmen who either work for one or more customers or yet to join any of the customer. The customer, 
may have placed, either one or more orders on or above order amount 2000 and must have a grade, or he may not have placed any order to the associated supplier.*/
SELECT S.SALESMAN_NAME,C.CUSTOMER_NAME FROM CUSTOMER C RIGHT JOIN SALESMAN S ON C.SALESMAN_ID=S.SALESMAN_ID
LEFT JOIN ORDERS O ON C.CUSTOMER_ID=O.CUSTOMER_ID WHERE PURCHES_AMOUNT >2000 AND C.GRADE IS NOT NULL;

/* QUESTION NO.14 :- For those customers from the existing list who put one or more orders, or which orders have been placed by the customer who is not on the list, 
create a report containing the customer name, city, order number, order date, and purchase amount.*/
SELECT C.CUSTOMER_NAME,C.CITY,O.ORD_NO,O.ORD_DATE,O.PURCHES_AMOUNT FROM CUSTOMER C RIGHT JOIN ORDERS O ON C.SALESMAN_ID=O.SALESMAN_ID;

/* QUESTION NO.15 :-  Write a SQL statement to generate a report with the customer name, city, order no. order date, purchase amount for only those customers on the list
who must have a grade and placed one or more orders or which order(s) have been placed by the customer who neither is on the list nor has a grade.*/
SELECT C.CUSTOMER_NAME,C.CITY,O.ORD_NO,O.ORD_DATE,O.PURCHES_AMOUNT FROM CUSTOMER C RIGHT JOIN ORDERS O ON C.CUSTOMER_ID=O.CUSTOMER_ID WHERE GRADE IS NOT NULL;

/* QUESTION NO.16 :- Write a SQL query to combine each row of the salesman table with each row of the customer table.*/
SELECT*FROM CUSTOMER C CROSS JOIN SALESMAN S ORDER BY S.SALESMAN_ID ASC;

/* QUESTION NO.17 :- Write a SQL statement to create a Cartesian product between salesperson and customer, i.e. each salesperson will appear for all customers 
and vice versa for that salesperson who belongs to that city.*/
SELECT* FROM CUSTOMER C CROSS JOIN SALESMAN S WHERE S.SALESMAN_CITY IS NOT NULL;

/* QUESTION NO.18 :- Write a SQL statement to create a Cartesian product between salesperson and customer, i.e. each salesperson will appear for every customer
and vice versa for those salesmen who belong to a city and customers who require a grade.*/
SELECT*FROM CUSTOMER C CROSS JOIN SALESMAN S WHERE S.SALESMAN_CITY IS NOT NULL AND C.GRADE IS NOT NULL;
