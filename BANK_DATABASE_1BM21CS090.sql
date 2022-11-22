create database BANK_DATABASE_1BM21CS090;
use BANK_DATABASE_1BM21CS090;

create table BRANCH
(
branch_name varchar(30),
branchcity varchar(10),
assets int,
primary key(branch_name)
);

create table BANK_ACCOUNT
(
accno int,
branch_name varchar(30),
balance int,
primary key(accno),
foreign key(branch_name) references BRANCH(branch_name)
);

create table BANK_CUSTOMER
(
customer_name varchar(30),
customer_street varchar(20),
city varchar(10),
primary key(customer_name)
);

create table DEPOSITER
(
customer_name varchar(30),
accno int,
primary key(customer_name,accno),
foreign key(customer_name) references BANK_CUSTOMER(customer_name),
foreign key(accno) references BANK_account(accno)
);

create table LOAN
(
 loan_number int,
 branch_name varchar(30),
 ammount int,
 primary key(loan_number),
 foreign key(branch_name) references BRANCH(branch_name)
);

insert into BRANCH
values('SBI_Chamrajpet','Bangalore',50000),
('SBI_ResidencyRoad','Bangalore',10000),
('SBI_ShivarajiRoad','Bombay',20000),
('SBI_ParlimentRoad','Delhi',10000),
('SBI_Jantarmanthar','Delhi',20000);

select *from BRANCH;

insert into BANK_ACCOUNT 
values(1,'SBI_Chamrajpet',2000),
(2,'SBI_ResidencyRoad',5000),
(3,'SBI_ShivarajiRoad',6000),
(4,'SBI_ParlimentRoad',9000)
,(5,'SBI_Jantarmanthar',8000)
,(6,'SBI_ShivarajiRoad',4000)
,(8,'SBI_ResidencyRoad',4000)
,(9,'SBI_ParlimentRoad',3000)
,(10,'SBI_ResidencyRoad',5000)
,(11,'SBI_Jantarmanthar',2000);

select *from BANK_ACCOUNT;

alter table BANK_CUSTOMER
modify column customer_street varchar(40);


insert into BANK_CUSTOMER
values('Avinash','Bull_Temple_Road','Bangalore'),
('Dinesh','Bannergatta_Road','Bangalore'),
('Mohan','National_College_Road','Bangalore'),
('Nikil','Akbar_Road','Delhi'),
('Ravi','Prithviraj_Road','Delhi');

select *from BANK_CUSTOMER;

insert into DEPOSITER
VALUES('Avinash',1),
('Dinesh',2),
('Nikil',4),
('Ravi',5),
('Avinash',8),
('Nikil',9),
('Dinesh',10),
('Nikil',11);

select *from DEPOSITER;

insert into LOAN
values(1,'SBI_Chamrajpet',1000),
(2,'SBI_ResidencyRoad',2000),
(3,'SBI_ShivarajiRoad',3000),
(4,'SBI_ParlimentRoad',4000),
(5,'SBI_Jantarmanthar',5000);

select *from LOAN;

select branch_name,(assets/100000) as Assets_in_lakhs
from BRANCH;

create view Loan_view as
select branch_name, sum(ammount) as Total_loan
from LOAN
GROUP BY branch_name;

select *from Loan_view;

select customer_name
from BANK_ACCOUNT B, DEPOSITER D
where D.accno=B.accno and branch_name='SBI_ResidencyRoad'
group by customer_name
having count(*)>=2;