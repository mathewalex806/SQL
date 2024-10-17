create or replace package calculator as
	function add(num1 in integer, num2 in integer) return integer;
	procedure sub(num1 in integer, num2 in integer, result out integer);
end calculator;
/

create or replace package body calculator as 
	function add (num1 in integer, num2 in integer) return integer as 
	begin
		return num1 + num2;
	end add;

	procedure sub(num1 in integer, num2 in integer, result out integer) as
	begin
		result := num1 - num2;
	end sub;
end calculator;
/

declare	
	a integer := 10;
	b integer := 5;
	c integer;
begin
	c := calculator.add(a,b);
	dbms_output.put_line(c);
	c :=0;
	calculator.sub(a,b,c);
	dbms_output.put_line(c);
end;
/