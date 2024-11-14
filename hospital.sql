create table patients(pid int , name varchar2(20),address varchar2(20));
create table details (pid int,disease varchar2(20), doctor_name varchar2(20), admitdate date, discharge number, amtpaid int);
create table history (pid int , name varchar(20), address varchar2(20), disease varchar2(20),doctor_name varchar2(20),dischar_date date);


insert into patients values (001,'Dave','310 Lane');
insert into details values (001, 'fever','dr.Jane','14-NOV-2024', 0, 0);





select * from details group by disease;
select * from details;



drop table patients;
drop table details;
drop table history;
