create table dept(
    dname varchar2(20),
    dnumber number(3) primary key,
    mgrssn varchar2(20),
    mgrstartdate date

);
ALTER TABLE dept
MODIFY dname VARCHAR2(20);
create table employee(
    fname varchar2(10),
    minit char(1),
    lname varchar2(10),
    ssn varchar2(5) primary key,
    bdate date,
    address VARCHAR2(10),
    sex char(1),
    salary number(10,2),
    superssn varchar2(5),
    dno number(3),
    FOREIGN key(dno) references dept(dnumber)
);
CREATE TABLE dept_locations (
dnumber NUMBER(3) REFERENCES dept(dnumber),
dlocation VARCHAR2(20),
PRIMARY KEY (dnumber, dlocation)
);

create table project(
    pname varchar2(20),
    pnumber number(10),
    plocation varchar2(20),
    dnum number(3),
    primary key(pnumber),
    FOREIGN key(dnum) references dept(dnumber)
);

CREATE TABLE WORKS_ON (
    ESSN    varchar2(5),
    PNO     NUMBER(5),
    HOURS   NUMBER(4,1),
    PRIMARY KEY (ESSN, PNO),
    FOREIGN KEY (ESSN)
        REFERENCES EMPLOYEE(SSN),
    FOREIGN KEY (PNO)
        REFERENCES PROJECT(PNUMBER)
);
CREATE TABLE DEPENDENT (
    ESSN            VARCHAR2(9),
    DEPENDENT_NAME  VARCHAR(15),
    SEX             CHAR(1),
    BDATE           DATE,
    RELATIONSHIP    VARCHAR(10),
    PRIMARY KEY (ESSN, DEPENDENT_NAME),
    FOREIGN KEY (ESSN) REFERENCES EMPLOYEE(SSN)
);

desc employee;
desc dept;

select * from tab;

DESC employee;

DESC dept;

DESC project;

DESC works_on;

DESC dependent;

DESC dept_locations;

INSERT INTO dept VALUES ('Headquarters',1,'88888',DATE '2020-01-01');
INSERT INTO dept VALUES ('Administration',4,'98765',DATE '2020-01-01');
INSERT INTO dept VALUES ('Research',5,'33333',DATE '2020-01-01');
select * from dept;

INSERT INTO employee VALUES('James','E','Borg','88888',DATE '1965-11-10','Houston','M',55000,NULL,1);

INSERT INTO employee VALUES('Jennifer','S','Wallace','98765',DATE '1970-03-20','Bellaire','F',43000,'88888',4);

INSERT INTO employee VALUES('Franklin','T','Wong','33333',DATE '1975-12-08','Houston','M',40000,'88888',5);

INSERT INTO employee VALUES('John','B','Smith','12345',DATE '1985-01-09','Houston','M',30000,'33333',5);

INSERT INTO employee VALUES('Alicia','J','Zelaya','99988',DATE '1988-07-19','Spring','F',25000,'33333',5);

INSERT INTO employee VALUES('Ramesh','K','Narayan','66666',DATE '1982-09-15','Sugarland','M',38000,'33333',5);

INSERT INTO employee VALUES('Joyce','A','English','45345',DATE '1990-07-31','Houston','F',25000,'33333',5);

INSERT INTO employee VALUES('Ahmad','V','Jabbar','98798',DATE '1986-03-29','Houston','M',25000,'98765',4);

INSERT INTO employee VALUES('Parthib','P','Biswas','77777',DATE '2004-05-15','Kolkata','M',60000,'33333',5);

select * from employee;

INSERT INTO project VALUES('ProductX',1,'Bellaire',5);

INSERT INTO project VALUES('ProductY',2,'Sugarland',5);

INSERT INTO project VALUES('Computerization',3,'Stafford',4);

INSERT INTO project VALUES('Reorganization',10,'Houston',1);

INSERT INTO project VALUES('NewBenefits',20,'Stafford',4);

SELECT * FROM project;

INSERT INTO works_on VALUES('12345',1,32.5);
INSERT INTO works_on VALUES('12345',2,7.5);

INSERT INTO works_on VALUES('99988',1,20);
INSERT INTO works_on VALUES('99988',2,20);

INSERT INTO works_on VALUES('66666',2,40);

INSERT INTO works_on VALUES('45345',1,20);
INSERT INTO works_on VALUES('45345',3,20);

INSERT INTO works_on VALUES('33333',1,10);
INSERT INTO works_on VALUES('33333',2,10);

INSERT INTO works_on VALUES('98765',3,30);

INSERT INTO works_on VALUES('77777',1,40);

INSERT INTO works_on VALUES('98798',20,30);

INSERT INTO dependent VALUES('12345','Alice','F',DATE '2012-05-05','Daughter');

INSERT INTO dependent VALUES('12345','John','M',DATE '2015-04-04','Son');

INSERT INTO dependent VALUES('33333','Wong','F',DATE '1980-06-06','Spouse');

INSERT INTO dependent VALUES('88888','James','M',DATE '1995-03-03','Son');

INSERT INTO dependent VALUES('98765','Mary','F',DATE '1998-08-08','Daughter');

