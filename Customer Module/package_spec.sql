create or replace package myPackage as 

	function isAdmin(mail in varchar2,pass in varchar2,id out varchar2)
		return number; 

	function isCustomer(mail in varchar2)
	return number;
	
	function isCustomer1(mail in varchar2,pass in varchar2,id out varchar2)
	return number;

	function getcost(f_id in number)
	return number;

	function getairlineseats(a_id in number)
	return number;

 	procedure getcurrentseats(f_id in number, remaining_seats out number);
	procedure updatetickets(f_id in number,remaining_ticket in number, numTicket in number);
	procedure addflight(al_id in number,departure in varchar2 ,arrival in varchar2,fare in number,NumSeats in number,deptDate in varchar2,deptTime in varchar2,arrivalDate in varchar2,arrivalTime in varchar2);
	procedure addAircraft(model_num in varchar2,NumSeats in number,manufactureDate in varchar2);
	procedure bookflight(id in number,f_id in number,bookingDate in date,numTicket in number,cost in number,remaining_ticket in number);
    procedure cancelBooking(bid_ in number,approve in number);
	procedure cancelconfirm(bc_id in number);
    procedure changeFlight(fid_ in number,deptDate_ in varchar2,deptTime_ in varchar2,arrivalDate_ in varchar2,arrivalTime_ in varchar2);
	procedure CustomerReg(email in varchar2,password in varchar2,first_name in varchar2,last_name in varchar2,phone_number in varchar2,address in varchar2);
      
       
      

end myPackage;
/