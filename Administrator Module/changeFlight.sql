set serveroutput on;

declare
	
	fid_ int;
	al_id_ int;
	departure_ varchar2(30);
	arrival_ varchar2(30);
	fare_ int; 
	deptDate_ varchar2(30);
	deptTime_ varchar2(30);
	arrivalDate_ varchar2(30);
	arrivalTime_ varchar2(30);  


begin
	fid_ := &enter_flight_id;
	deptDate_ := '&enter_departure_date';
	deptTime_ := '&enter_departure_time';
	arrivalDate_ := '&enter_arrival_date';
	arrivalTime_ := '&enter_arrival_time';

	myPackage.changeFlight(fid_,deptDate_,deptTime_,arrivalDate_,arrivalTime_);
	
end;
/

commit;