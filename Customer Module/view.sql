create or replace view viewAirline as
select * from Airline;

create or replace view viewCustomer(CID,Email,FirstName) as
select cid,email,first_name from Customer;

create or replace view viewCancel as
select * from booking_cancel;

commit;