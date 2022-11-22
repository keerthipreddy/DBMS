use INSURANCE_DATABASE_1BM21CS090;
select *from PARTICIPATED;
update PARTICIPATED
set damage_amount=25000
where report_num=12;
select *from CAR;
select reg_num,model,m_year
from CAR
order by m_year asc;
select *from ACCIDENT;
insert into ACCIDENT
values (16,'2005-07-13','SOUTH END CIRCLE');
select count(CAR.reg_num)
from PARTICIPATED, CAR
where CAR.model='LANCER' and CAR.reg_num=PARTICIPATED.reg_num;
select count(P.driver_id)
from PARTICIPATED P, ACCIDENT A
where P.report_num=A.report_num and accident_date like '2008%';
select avg(damage_amount)
from PARTICIPATED;
delete from PARTICIPATED
where damage_amount<13600;





