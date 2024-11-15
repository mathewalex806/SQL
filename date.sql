declare 
	cur_date date;
	diff number;
	day_date  number;
	month_date  number;
	year_date  number;
begin

	day_date := TO_NUMBER(TO_CHAR(SYSDATE,'YYYY'));
	dbms_output.put_line(day_date);

	
end;
/
