set serveroutput on;

declare
	
	fid int;
	al_id int;
	departure varchar2(30);
	arrival varchar2(30);
	fare int; 
	NumSeats int;
	deptDate varchar2(30);
	deptTime varchar2(30);
	arrivalDate varchar2(30);
	arrivalTime varchar2(30);  


begin
	al_id :=  &enter_airline_number;
	departure := '&enter_the_place_of_departure';
	arrival := '&enter_the_place_of_arrival';
	fare := &enter_fare;
	deptDate := '&enter_departure_date';
	deptTime := '&enter_departure_time';
	arrivalDate := '&enter_arrival_date';
	arrivalTime := '&enter_arrival_time';
	NumSeats := getairlineseats(al_id);

	myPackage.addflight(al_id,departure,arrival,fare,NumSeats,deptDate,deptTime,arrivalDate,arrivalTime);
end;
/

commit;