use assignment;
create table employee
(
EMP_NO INT,
EMP_NAME VARCHAR(50),
JOB VARCHAR(25),
MGR INT,
HIRE_DATE DATE,
SALARY INT,
COMM INT NULL,
DEPT_NO INT
);
iNSERT INTO EMPLOYEE(EMP_NO,EMP_NAME,JOB,MGR,HIRE_DATE,SALARY,COMM,DEPT_NO)
VALUES
(8369,"SMITH","CLERK",8902,"1990-12-18",800.00,null,20),
(8499,"anya","salesman",8698,"1991-02-20",1600.00,300.00,30),
(8521,"seth","salesman",8698,"1991-02-22",1250.00,500.00,30),
(8566,"mahadevan","manager",8839,"1991-04-02",2985.00,null,20),
(8654,"momin","salesman",8698,"1991-09-28",1250.00,1400.00,30),
(8698,"bina","manager",8839,"1991-05-01",2850.00,null,30),
(8882,"shivansh","manager",8839,"1991-06-09",2450.00,null,10),
(8888,"scott","analyst",8566,"1992-12-09",3000.00,null,20),
(8839,"amir","president",null,"1991-11-18",5000.00,null,10),
(8844,"kuldeep","salesman",8698,"1991-09-08",1500.00,0.00,30);
select emp_name,salary from employee where salary>2200 or salary=2200;
select*from employee where comm is null;
select emp_name,salary from employee where salary not between 2500 and 4000;
select emp_name,job,salary from employee where job!="manager";
select emp_name from employee where emp_name like "__a%";
select emp_name from employee where emp_name like "%t";
select emp_name from employee where emp_name like "m_l%";
select*from employee where comm is null and mgr ="not given";

