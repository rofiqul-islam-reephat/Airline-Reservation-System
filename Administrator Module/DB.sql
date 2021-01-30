clear screen;


DROP TABLE CUSTOMER CASCADE CONSTRAINTS;
DROP SEQUENCE customer_seq;
DROP TABLE ADMIN CASCADE CONSTRAINTS;
DROP SEQUENCE admin_seq;
DROP TABLE AIRLINE CASCADE CONSTRAINTS;
DROP SEQUENCE airline_seq;
DROP TABLE Flight CASCADE CONSTRAINTS;
DROP SEQUENCE flight_seq;
DROP TABLE Booking CASCADE CONSTRAINTS;
DROP SEQUENCE booking_seq;
DROP TABLE Booking_Cancel CASCADE CONSTRAINTS;
DROP SEQUENCE cancel_seq;

CREATE TABLE CUSTOMER (
	cid int,
	email varchar2(30),
	password varchar2(30), 
	first_name varchar2(30), 
	last_name varchar2(30),  
	phone_number varchar2(30),
	address varchar2(50),  
        primary key(cid)
);

CREATE SEQUENCE customer_seq START WITH 100;

CREATE TABLE ADMIN (
	aid int,
	email varchar2(30),
	password varchar2(30), 
	first_name varchar2(30), 
	last_name varchar2(30),  
        primary key(aid)
);

CREATE SEQUENCE admin_seq START WITH 100;


CREATE TABLE Airline (
	al_id int,
	model_num varchar2(30),
	NumSeats int, 
	manufactureDate Date,   
        primary key(al_id)
);

CREATE SEQUENCE airline_seq START WITH 100;


CREATE TABLE Flight (
	fid int,
	al_id int,
	departure varchar2(30),
	arrival varchar2(30),
	fare int, 
	NumSeats int,
	deptDate Date,
	deptTime varchar2(30),
	arrivalDate Date,
	arrivalTime varchar2(30),   
        primary key(fid),
	FOREIGN KEY(al_id) REFERENCES AIRLINE(al_id)
);

CREATE SEQUENCE flight_seq START WITH 100;


CREATE TABLE Booking (
	bid int,
	cid int,
	fid int, 
	bookingDate Date,
	numTicket int,
	cost int,   
    primary key(bid),
	FOREIGN KEY(cid) REFERENCES CUSTOMER(cid),
	FOREIGN KEY(fid) REFERENCES Flight(fid)
);

CREATE SEQUENCE booking_seq START WITH 1000;



CREATE TABLE Booking_Cancel (
	bcid int,
	bid int,
	approve int,   
    primary key(bcid),
	FOREIGN KEY(bid) REFERENCES Booking(bid)
);

CREATE SEQUENCE cancel_seq START WITH 100;

commit;















 
