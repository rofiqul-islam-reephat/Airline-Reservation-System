set serveroutput on;

declare
	source varchar2(30); 
	destination varchar2(30);
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

	cursor flight_cur(depart varchar2, arr varchar2) is
	select * from Flight where upper(departure) = upper(depart) and upper(arrival) = upper(arr);

begin
	source := '&enter_source';
	destination := '&enter_destination';
	DBMS_OUTPUT.PUT_LINE('Available Flights: ');
	DBMS_OUTPUT.PUT_LINE('fid'||' '||'departure'||' '||'arrival'||' '||'fare NumSeats '||' '||'deptDate'||' '||'deptTime'||' '||'arrivalDate'||' '||'arrivalTime');
	open flight_cur(source,destination);
	loop
		fetch flight_cur into fid,al_id,departure,arrival,fare,NumSeats,deptDate,deptTime,arrivalDate,arrivalTime;
		exit when flight_cur%notfound;
		DBMS_OUTPUT.PUT_LINE(fid||' '||departure||' '||arrival||' '||fare||' '||NumSeats||' '||deptDate||' '||deptTime||' '||arrivalDate||' '||arrivalTime);		
		end loop;
	close flight_cur;
	
end;
/