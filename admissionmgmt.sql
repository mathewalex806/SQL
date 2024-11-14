create table admis(branch_no int, sid_no int , sname varchar2(20), maths_mrk int, phy_mark int, chem_mark int, total_mark int);
create table seatposition(dept_no int, total_seats int, admitted_no int, vacany_no int);


INSERT INTO seatposition (dept_no, total_seats, admitted_no, vacany_no) VALUES (101, 50, 10, 40);
INSERT INTO seatposition (dept_no, total_seats, admitted_no, vacany_no) VALUES (102, 60, 20, 40);


select * from admis;
select * from seatposition;


create or replace procedure crud_add(branch in int, sid in int, name in varchar2, maths in int, phy in int, chem in int, total in int) is
begin
    declare
    	total_ma int;
		cursor seat_cur is 
            select * from seatposition where dept_no = branch;
		dept seatposition.dept_no%type;
		tot seatposition.total_seats%type;
		admitted seatposition.admitted_no%type;
		vacancy seatposition.vacany_no%type;
		begin
            dbms_output.put_line('inside the add procedure');
        	total_ma := (maths+phy+chem)/3;
        	insert into admis values(branch, sid, name, maths, phy, chem, total_ma);
			open seat_cur;
			loop
                fetch seat_cur into dept, tot, admitted, vacancy; 
                exit when seat_cur%NOTFOUND;
				update seatposition set admitted_no = admitted+1, vacany_no = vacancy-1 where dept_no = branch;
			end loop;
			close seat_cur;
		end;
end;
/

create or replace procedure crud_delete(branch in int, sid in int) is
begin
    declare
		cursor seat_cur is 
            select * from seatposition where dept_no = branch;
		dept seatposition.dept_no%type;
		tot seatposition.total_seats%type;
		admitted seatposition.admitted_no%type;
		vacancy seatposition.vacany_no%type;
		begin
            dbms_output.put_line('inside the delete procedure');
        	delete from admis where sid_no = sid;
			open seat_cur;
			loop
                fetch seat_cur into dept, tot, admitted, vacancy; 
                exit when seat_cur%NOTFOUND;
				update seatposition set admitted_no = admitted-1, vacany_no = vacancy+1 where dept_no = branch;
			end loop;
			close seat_cur;
		end;
end;
/

begin
    crud_add(101,1,'alice',80,85,90,0);
	crud_add(101,2,'bob',80,78,56,0);
	crud_delete(101,1);
end;
/
select * from admis;
select * from seatposition;
    
