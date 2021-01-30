set serveroutput on;

declare
	fid int;
	income int;  
	totalIncome int := 0;

	cursor income_cur is
	select fid as Flight_ID,sum(cost) as Income from Booking 
	group by fid;

begin
	open income_cur;
	loop
		fetch income_cur into fid,income;
		exit when income_cur%notfound;
		DBMS_OUTPUT.PUT_LINE('Income from flight '||fid||' is : '||income);
		totalIncome := totalIncome + income;		
		end loop;
	close income_cur;
	DBMS_OUTPUT.PUT_LINE(chr(10)||'Total Income: '||totalIncome);
	
end;
/