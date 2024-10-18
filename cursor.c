-- Create a temporary employee table for demonstration
CREATE or replace TABLE employee (
    empid INTEGER,
    name VARCHAR2(20),
    designation VARCHAR2(20),
    salary INTEGER
);

create or replace table emp_temp(
    empid INTEGER,
    name VARCHAR2(20)
    );
-- Insert records into the employee table
INSERT INTO employee (empid, name, designation, salary)
VALUES (1, 'Alex', 'Manager', 50000);

INSERT INTO employee (empid, name, designation, salary)
VALUES (2, 'Alan', 'Student', 30000);

INSERT INTO employee (empid, name, designation, salary)
VALUES (3, 'Sarah', 'Developer', 45000);

INSERT INTO employee (empid, name, designation, salary)
VALUES (4, 'John', 'Designer', 40000);

INSERT INTO employee (empid, name, designation, salary)
VALUES (5, 'Emily', 'Tester', 35000);


declare
	cursor add_employee is
	select empid, name from employee;

	t_empid employee.empid%TYPE;
	t_name employee.name%TYPE;

begin
	open add_employee;
		loop
			fetch add_employee into t_empid, t_name;
			exit when add_employee%NOTFOUND;
			 INSERT INTO emp_temp (empid, name) VALUES (t_empid, t_name);
		end loop;
	close add_employee;

end;
/
select* from emp_temp;