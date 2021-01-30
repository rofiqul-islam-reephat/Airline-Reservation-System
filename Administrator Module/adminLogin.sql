set serveroutput on;

declare
	id number ;
	x number;
	mail varchar2(100);
	pass varchar2(100);

begin	
	dbms_output.put_line('--------Airline Reservation System---------');
	
	mail := '&enter_your_email';
	pass := '&enter_your_password';
	
	if myPackage.isAdmin(mail,pass,id) > 0 then
		dbms_output.put_line('Admin Login Successful with admin id: '||id);
	else
		dbms_output.put_line('Wrong email and password');
		
	end if;

end;
/