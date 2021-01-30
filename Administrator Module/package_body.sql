create or replace package body myPackage as 
	function isAdmin(mail in varchar2,pass in varchar2,id out varchar2)
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
	end isAdmin;
	


	function isCustomer(mail in varchar2)
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
	end isCustomer;



	function isCustomer1(mail in varchar2,pass in varchar2,id out varchar2)
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
	end isCustomer1;

	function getcost(f_id in number)
	return number
	is
	x number := 0;
	y number := 0;

	begin
		select fare into x from Flight where fid = f_id; 
		return x;
	end getcost;



	function getairlineseats(a_id in number)
	return number
	is
	x number := 0;
	y number := 0;

	begin
		select NumSeats into x from Airline where al_id = a_id;
		return x;
	end getairlineseats;




	procedure getcurrentseats(f_id in number, remaining_seats out number)
        is  

	x number := 0;
	y number := 0;

	begin
		select NumSeats into remaining_seats from Flight where fid = f_id;

	end getcurrentseats;


	procedure updatetickets(f_id in number,remaining_ticket in number, numTicket in number)
        is  

	x number := 0;
	y number := 0;

	begin
		update Flight set NumSeats = (remaining_ticket - numTicket) where fid = f_id;

	end updatetickets;


	procedure addflight(al_id in number,departure in varchar2 ,arrival in varchar2,fare in number,NumSeats in number,deptDate in varchar2,deptTime in varchar2,arrivalDate in varchar2,arrivalTime in varchar2)
        is  
	begin
		insert into Flight (al_id,departure,arrival,fare,NumSeats,deptDate,deptTime,arrivalDate,arrivalTime) values (al_id,departure,arrival,fare,NumSeats,TO_DATE(deptDate, 'YYYY/MM/DD'), deptTime ,TO_DATE(arrivalDate, 'YYYY/MM/DD'), arrivalTime); 	

	end addflight;


	procedure addAircraft(model_num in varchar2,NumSeats in number,manufactureDate in varchar2)
        is  
	begin
		insert into AIRLINE (model_num,NumSeats,manufactureDate) values (model_num,NumSeats,TO_DATE(manufactureDate, 'yyyy/mm/dd')); 	
	end addAircraft;

	
	procedure bookflight(id in number,f_id in number,bookingDate in date,numTicket in number,cost in number,remaining_ticket in number)
        is  

	begin
		if remaining_ticket >= numTicket then
			insert into Booking (cid,fid,bookingDate,numTicket,cost) values (id,f_id,bookingDate,numTicket,cost);
			update Flight set NumSeats = (remaining_ticket - numTicket) where fid = f_id;
			dbms_output.put_line('Taka '||cost||' has been deducted from your credit card');
		else
			dbms_output.put_line('Not Enough Ticket Left');
		end if;
	end bookflight; 



	procedure cancelBooking(bid_ in number,approve in number)
        is  
	begin
	 	insert into Booking_Cancel (bid,approve) values (bid_,0);
	end cancelBooking;

    procedure cancelconfirm(bc_id in number)
    	is  
    	bid_ number;
    	numTicket_ int;
    	numSeats_ number;
    	fid_ int;
	begin
	 
		select bid into bid_ from Booking_Cancel where bcid = bc_id;
		select fid into fid_ from Booking where bid = bid_;
		select numTicket into numTicket_ from Booking where bid = bid_;
		select NumSeats into numSeats_ from Flight where fid = fid_;

		delete from Booking_Cancel where bcid = bc_id;
		delete from Booking where bid = bid_;
		dbms_output.put_line('Booking Canceled with Booking ID: '||bid_);
		update Flight set NumSeats = (numSeats_ + numTicket_ ) where fid = fid_;
	end cancelconfirm;



	procedure changeFlight(fid_ in number,deptDate_ in varchar2,deptTime_ in varchar2,arrivalDate_ in varchar2,arrivalTime_ in varchar2)
        is  
    
	begin
		update Flight set deptDate = TO_DATE(deptDate_, 'YYYY/MM/DD') , 
		deptTime = deptTime_ , arrivalDate = TO_DATE(arrivalDate_, 'YYYY/MM/DD') , arrivalTime = arrivalTime_
		where fid = fid_;
	end changeFlight;



	procedure CustomerReg(email in varchar2,password in varchar2,first_name in varchar2,last_name in varchar2,phone_number in varchar2,address in varchar2)
       	is  
    
	begin

		insert into CUSTOMER (email,password,first_name,last_name,phone_number,address) values (email,password,first_name,last_name,phone_number,address);
	end CustomerReg;



end myPackage; 
/