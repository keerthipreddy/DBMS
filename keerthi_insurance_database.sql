create database INSURANCE_DATABASE_1BM21CS090;
use INSURANCE_DATABASE_1BM21CS090;
create table PERSON
(
d_name varchar(30),
address varchar(50),
driver_id varchar(10),
primary key (driver_id)
);
create table CAR
(
reg_num varchar(10),
model varchar(20),
m_year int,
primary key (reg_num)
);
create table ACCIDENT
(
report_num int,
accident_date date,
location varchar(50),
primary key (report_num)
);

create table OWNS
(
driver_id varchar(10),
reg_num varchar(10),
primary key (driver_id,reg_num),
foreign key  (driver_id) references PERSON (driver_id),
foreign key  (reg_num) references CAR (reg_num)
);

create table PARTICIPATED
(
driver_id varchar(10),
reg_num varchar(10),
report_num int,
damage_amount int,
primary key (driver_id,reg_num,report_num),
foreign key  (driver_id) references PERSON (driver_id),
foreign key  (reg_num) references CAR (reg_num),
foreign key  (report_num) references ACCIDENT (report_num)
);

insert into PERSON
values ('RICHARD','SRINIVAS NAGAR','A01'),('PRADEEP','RAJAJI NAGAR','A02'),('SMITH','ASHOK NAGAR','A03'),('VENU','N R COLONEY','A04'),('JHON','HANUMANTH NAGAR','A05');
insert into CAR
values ('KA052250','INDIKA','1990'),('KA031181','LANCER','1957'),('KA095477','TOYOTA','1998'),('KA095477','HONDA','2008'),('KA041702','AUDI','2005');
insert into ACCIDENT
values('11','2003-01-01','MYSORE ROAD'),('12','2004-02-02','SOUTH END CIRCLE'),('13','2003-01-21','BULL TEMPLE ROAD'),('14','2008-02-17','MYSORE ROAD'),('15','2004-03-05','KANAKPURA ROAD ROAD');
insert into PARTICIPATED
values ('A01','KA052250','11',10000), ('A02','KA053408','12',50000),('A03','KA095477','13',25000),('A04','KA031181','14',3000),('A05','KA041702','15',5000);
insert into OWNS
values ('A01','KA052250'),('A02','KA031181'),('A03','KA095477'),('A04','KA095477'),('A05','KA041702');

select * from PERSON;
select * from CAR;
select * from ACCIDENT;
select * from OWNS;
select * from PARTICIPATED;

SELECT accident_date,location
from ACCIDENT;

SELECT driver_id
from PARTICIPATEd
where damage_amount>=25000;