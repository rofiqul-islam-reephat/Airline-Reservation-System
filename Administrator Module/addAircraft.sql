set serveroutput on;

declare
	
	model_num varchar2(30);
	NumSeats int; 
	manufactureDate varchar2(30);


begin
	model_num :=  '&enter_airline_model_number';
	NumSeats := &enter_number_of_seats;
	manufactureDate := '&enter_manufacture_date';

	myPackage.addAircraft(model_num,NumSeats,manufactureDate); 	
	
end;
/

commit;