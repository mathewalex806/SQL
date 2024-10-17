create table customers(c_id integer, c_name varchar2(20), city varchar2(20));

insert into customers values(1,'John','Trivandrum');
insert into customers values(1,'Alan','Kochi');

create or replace trigger update_name after update of c_name on customers for each row
begin
	dbms_output.put_line(:OLD.c_name ||' has been changed to : '||:NEW.c_name);
end;
/
update customers set c_name = 'Albert' where c_name = 'Alan';
select * from customers;
drop table customers;