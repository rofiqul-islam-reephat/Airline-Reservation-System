create or replace function isAdmin(mail in varchar2,pass in varchar2,id out varchar2)
	return number
	is
x number := 0;
y number := 0;

begin
	select count(aid) into x from admin where email = mail and password = pass;	
	if x > 0 then
		select aid into id from admin where email = mail and password = pass;
		return 1;
	else
		return 0;
	end if; 
end;
/

create or replace function isCustomer(mail in varchar2)
	return number
	is
x number := 0;
y number := 0;

begin
	select count(cid) into x from customer where email = mail;	
	if x > 0 then
		return 1;
	else
		return 0;
	end if; 
end;
/


create or replace function isCustomer1(mail in varchar2,pass in varchar2,id out varchar2)
	return number
	is
x number := 0;
y number := 0;

begin
	select count(cid) into x from customer where email = mail and password = pass;	
	if x > 0 then
		select cid into id from customer where email = mail and password = pass;
		return 1;
	else
		return 0;
	end if; 
end;
/


create or replace function getcost(f_id in number)
	return number
	is
x number := 0;
y number := 0;

begin
	select fare into x from Flight where fid = f_id; 
	return x;
end;
/


create or replace function getairlineseats(a_id in number)
	return number
	is
x number := 0;
y number := 0;

begin
	select NumSeats into x from Airline where al_id = a_id;
	return x;
end;
/




commit;