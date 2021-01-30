
--assigns auto incrimented primary key to customer
 
CREATE OR REPLACE TRIGGER customer_id 
BEFORE INSERT ON CUSTOMER 
FOR EACH ROW

BEGIN
  SELECT customer_seq.NEXTVAL
  INTO   :new.cid
  FROM   dual;
END;
/

--assigns auto incrimented primary key to admin
 
CREATE OR REPLACE TRIGGER admin_id 
BEFORE INSERT ON ADMIN 
FOR EACH ROW

BEGIN
  SELECT admin_seq.NEXTVAL
  INTO   :new.aid
  FROM   dual;
END;
/

--assigns auto incrimented primary key to airline
 
CREATE OR REPLACE TRIGGER airline_id 
BEFORE INSERT ON AIRLINE 
FOR EACH ROW

BEGIN
  SELECT airline_seq.NEXTVAL
  INTO   :new.al_id
  FROM   dual;
END;
/


--assigns auto incrimented primary key to flight
 
CREATE OR REPLACE TRIGGER flight_id 
BEFORE INSERT ON Flight  
FOR EACH ROW

BEGIN
  SELECT flight_seq.NEXTVAL
  INTO   :new.fid
  FROM   dual;
END;
/


--assigns auto incrimented primary key to flight
 
CREATE OR REPLACE TRIGGER booking_id 
BEFORE INSERT ON Booking  
FOR EACH ROW

BEGIN
  SELECT booking_seq.NEXTVAL
  INTO   :new.bid
  FROM   dual;
END;
/



--assigns auto incrimented primary key to Booking_Cancel
 
CREATE OR REPLACE TRIGGER cancel_id 
BEFORE INSERT ON Booking_Cancel  
FOR EACH ROW

BEGIN
  SELECT cancel_seq.NEXTVAL
  INTO   :new.bcid
  FROM   dual;
END;
/


create or replace trigger flight_insert
after insert
on Flight
for each row
begin
	dbms_output.put_line('New row inserted in Flight table.');
end;
/


create or replace trigger aircraft_insert
after insert
on Airline
for each row
begin
	dbms_output.put_line('New row inserted in Airline table.');
end;
/



create or replace trigger flight_update
after update or delete
on Flight
for each row

begin
	dbms_output.put_line('Row updated in Flight table.');
end;
/


create or replace trigger customer_insert
after insert
on Customer
for each row
begin
	dbms_output.put_line('Registration Successful.');
end;
/


create or replace trigger booking_insert
after insert
on Booking
for each row
begin
  dbms_output.put_line('Your Ticket is booked. Booking Id: '|| :new.bid);
end;
/

create or replace trigger cancel_insert
after insert
on Booking_Cancel
for each row
begin
  dbms_output.put_line('Your Request is pending.');
end;
/

commit;