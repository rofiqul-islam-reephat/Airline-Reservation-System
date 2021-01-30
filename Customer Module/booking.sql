set serveroutput on;

declare
	id number ;
	x number;
	mail varchar2(100);
	pass varchar2(100);
	choice number;
	remaining_ticket int;
	f_id int; 
	bookingDate Date;
	numTicket int;
	cost int;  

begin	
	
	mail := '&enter_your_email';
	pass := '&enter_your_password';
	
	if myPackage.isCustomer1(mail,pass,id) > 0 then
		
		f_id := &enter_fid;
		numTicket := &enter_number_of_tickets;
		cost := numTicket * myPackage.getcost(f_id);
		bookingDate := sysdate;
		myPackage.getcurrentseats(f_id,remaining_ticket);

		myPackage.bookflight(id,f_id,bookingDate,numTicket,cost,remaining_ticket);
		
	else
		dbms_output.put_line('Wrong email and password');
		
	end if;

end;
/