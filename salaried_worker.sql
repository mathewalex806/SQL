create table salaried_worker (worker_id int, emp_name varchar2(20),emp_salary int, emp_tax int, emp_retires number);
create table address(workerid int, street varchar2(20),city varchar2(20),pin int);
create table pension(worker_id int, pension_amt int);

insert into salaried_worker values (001,'Bob',10000,0,0);
insert into salaried_worker values (002,'Jane',1000,0,0);
insert into salaried_worker values (003,'Smith',9000,0,0);


create or replace trigger pension_trigger after update of emp_retires on  salaried_worker for each row
    begin
    	if :NEW.emp_retires = 1 then
    		declare 
    			pension int;
			begin
                pension := 0.5* :NEW.emp_salary;
				insert into pension values (:NEW.worker_id, pension);
			end;
		end if;
	end;
/



declare
	cursor work_cur is 
		select * from salaried_worker;
	workerid salaried_worker.worker_id%type;
	name salaried_worker.emp_name%type;
	sal salaried_worker.emp_salary%type;
	tax salaried_worker.emp_tax%type;
	retires salaried_worker.emp_retires%type;

begin
	open work_cur;
	loop
    	fetch work_cur into workerid, name, sal , tax, retires ;
    	exit when work_cur%NOTFOUND;
		if sal < 5000 then 
			tax := 0;
		elsif sal>=5000 and sal <=8000 then 
			tax := 0.05*sal;
		elsif sal >8000 and sal <=10000 then 
			tax := 0.1*sal;
		else 
			tax := 0.15*sal;
		end if;
	update salaried_worker set emp_tax = tax where worker_id = workerid;

	end loop;
	close work_cur;
end;
/

update salaried_worker set emp_retires = 1 where worker_id = 001;
    
select * from salaried_worker;
select * from pension;
drop table pension;
drop table salaried_worker;
