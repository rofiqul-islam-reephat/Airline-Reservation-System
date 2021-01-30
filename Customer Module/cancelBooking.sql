set serveroutput on;

declare
	bid_ number;

begin
	bid_ := &enter_booking_id;
	myPackage.cancelBooking(bid_,0);
end;
/

commit;