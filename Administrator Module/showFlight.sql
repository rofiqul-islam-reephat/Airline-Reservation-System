set serveroutput on;

declare
	
	x varchar2(30);
	y varchar2(30);
	fid int;
	al_id int;
	departure varchar2(30);
	arrival varchar2(30);
	fare int; 
	NumSeats int;
	deptDate Date;
	deptTime varchar2(30);
	arrivalDate Date;
	arrivalTime varchar2(30);  

	cursor flight_cur(x varchar2, y varchar2 ) is
	select * from Flight where deptDate >= TO_DATE(x, 'yyyy/mm/dd') and deptDate <= TO_DATE(y, 'yyyy/mm/dd');

begin
	x := '&enter_start_date';
	y := '&enter_end_date';
	
	DBMS_OUTPUT.PUT_LINE('Available Flights: ');
	DBMS_OUTPUT.PUT_LINE('fid'||chr(9)||'al_id'||' '||'departure'||' '||'arrival'||' '||'fare NumSeats '||' '||'deptDate'||' '||'deptTime'||' '||'arrivalDate'||' '||'arrivalTime');
	open flight_cur(x,y);
	loop
		fetch flight_cur into fid,al_id,departure,arrival,fare,NumSeats,deptDate,deptTime,arrivalDate,arrivalTime;
		exit when flight_cur%notfound;
		DBMS_OUTPUT.PUT_LINE(fid||' '||al_id||' '||departure||' '||arrival||' '||fare||' '||NumSeats||' '||deptDate||' '||deptTime||' '||arrivalDate||' '||arrivalTime);		
		end loop;
	close flight_cur;
	
end;
/