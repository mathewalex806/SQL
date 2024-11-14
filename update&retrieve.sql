/*Program that uses procedure to find the total mark of 5 subjects and search for a particular reccord.*/

create table student_marks(roll int , phy int, chem int, math int, cmpsci int, eng int);
insert into student_marks values(1,10,8,6,9,7);
insert into student_marks values(2,1,7,9,8,6);

create or replace procedure avg_marks(roll in int, phy in int, chem in int , math in int , cmp in int , eng in int , avg out float) is 
begin
	avg :=(phy+chem+math+cmp+eng)/5;
end;
/


create or replace procedure find_student(roll_no in int) is
    begin
    	declare
    		cursor stu_cursor is select * from student_marks where roll = roll_no;
			id student_marks.roll%type;
			phy student_marks.phy%type;
			chem student_marks.chem%type;
			math student_marks.math%type;
			cmpsci student_marks.cmpsci%type;
			eng student_marks.eng%type;
		begin
            open stu_cursor;
			loop
                fetch stu_cursor into id, phy, chem, math, cmpsci , eng;
                exit when stu_cursor%NOTFOUND;
				dbms_output.put_line(id||' '||phy||' '||chem||' '||math||' '||cmpsci||eng);
			end loop ;
			close stu_cursor;
		end;
	end;
/

declare
    avg_stu float;
begin
	avg_marks(10,10,8,7,9,6,avg_stu);
	dbms_output.put_line(avg_stu);
	find_student(2);
end;
/

drop table student_marks;
