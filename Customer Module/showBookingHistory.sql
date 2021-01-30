set serveroutput on;

declare
	id number ;
	x number;
	mail varchar2(100);
	pass varchar2(100);
	departure varchar2(50);
	arrival varchar2(50);
	deptDate date;
	arrivalDate date;
	numTicket int;
	cost int; 
	bid int;

	cursor booking_cur(id int ) is
	select B.bid,F.departure,F.arrival,F.deptDate,F.arrivalDate,B.numTicket,B.cost from Booking B inner join Flight F
	on B.fid = F.fid where B.cid = id;
begin	
	
	mail := '&enter_your_email';
	pass := '&enter_your_password';
	
	if myPackage.isCustomer1(mail,pass,id) > 0 then
		
		DBMS_OUTPUT.PUT_LINE('Your Booking History: ');
		open booking_cur(id);
		loop
			fetch booking_cur into bid,departure,arrival,deptDate,arrivalDate,numTicket,cost;
			exit when booking_cur%notfound;
			DBMS_OUTPUT.PUT_LINE('Booking ID: '||bid);
			DBMS_OUTPUT.PUT_LINE('Departure: '||departure);
			DBMS_OUTPUT.PUT_LINE('Arrival: '||arrival);
			DBMS_OUTPUT.PUT_LINE('Departure Date: '||deptDate);
			DBMS_OUTPUT.PUT_LINE('Arrival Date: '||arrivalDate);
			DBMS_OUTPUT.PUT_LINE('Number of Tickets: '||numTicket);		
			DBMS_OUTPUT.PUT_LINE('Cost: '||cost);	
			DBMS_OUTPUT.PUT_LINE(chr(10));	
		end loop;
		close booking_cur;
		
	else
		dbms_output.put_line('Wrong email and password');
		
	end if;

end;
/