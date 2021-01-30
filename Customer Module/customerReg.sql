set serveroutput on;

declare
	email varchar2(30);
	password varchar2(30); 
	first_name varchar2(30); 
	last_name varchar2(30); 
	phone_number varchar2(30);
	address varchar2(50);

begin	
	
	email := '&enter_your_email';
	password := '&enter_your_password';
	first_name:= '&enter_your_first_name';
	last_name := '&enter_your_last_name';
	phone_number := '&enter_your_phone_number';
	address := '&enter_your_address';
	
	if myPackage.isCustomer(email) = 0 then
		myPackage.CustomerReg(email,password,first_name,last_name,phone_number,address);
	else
		dbms_output.put_line('Email Already Exist.');
		
	end if;

end;
/