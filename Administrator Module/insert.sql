insert into CUSTOMER (email,password,first_name,last_name,phone_number,address) values ('alihasnan@gmail.com','123456','Ali','Hasan','01813045901','Dhaka,Bangladesh'); 
insert into CUSTOMER (email,password,first_name,last_name,phone_number,address) values ('abuhasnat@gmail.com','123456','Abu','Hasnat','01876137363','Dhaka,Bangladesh'); 
insert into CUSTOMER (email,password,first_name,last_name,phone_number,address) values ('hasanbayezid@gmail.com','123456','Bayezid','Hasan','01314632902','Satkhira,Bangladesh'); 
insert into CUSTOMER (email,password,first_name,last_name,phone_number,address) values ('fahimahmad@gmail.com','123456','Fahim','Ahmed','01986215901','Dhaka,Bangladesh'); 
insert into CUSTOMER (email,password,first_name,last_name,phone_number,address) values ('zerin123@gmail.com','123456','Sayedunahar','Zerin','01712245212','Dhaka,Bangladesh'); 
insert into CUSTOMER (email,password,first_name,last_name,phone_number,address) values ('farhan123@gmail.com','123456','Farhan','Shahriar','01817831271','Dhaka,Bangladesh'); 
insert into CUSTOMER (email,password,first_name,last_name,phone_number,address) values ('mahmudalam@gmail.com','123456','Mahmud','Alam','01813089211','Dhaka,Bangladesh'); 
insert into CUSTOMER (email,password,first_name,last_name,phone_number,address) values ('shibbirhasan@gmail.com','123456','Shibbir','Hasan','0134565901','Dhaka,Bangladesh'); 
insert into CUSTOMER (email,password,first_name,last_name,phone_number,address) values ('sarikatrina@gmail.com','123456','Sarika','Trina','0166711103','Dhaka,Bangladesh'); 
insert into CUSTOMER (email,password,first_name,last_name,phone_number,address) values ('nowrinislam@gmail.com','123456','Nowrin','Islam','01976045907','Dhaka,Bangladesh'); 
insert into CUSTOMER (email,password,first_name,last_name,phone_number,address) values ('saimasultana@gmail.com','123456','Saima','Sultana','01819910926','Dhaka,Bangladesh'); 



insert into ADMIN (email,password,first_name,last_name) values ('admin@gmail.com','admin','Peter','Parker'); 



insert into AIRLINE (model_num,NumSeats,manufactureDate) values ('DC-10-30ER',216,TO_DATE('2015/01/02', 'yyyy/mm/dd')); 
insert into AIRLINE (model_num,NumSeats,manufactureDate) values ('A310-300',236,TO_DATE('2016/03/19', 'yyyy/mm/dd')); 
insert into AIRLINE (model_num,NumSeats,manufactureDate) values ('Boeing-737',142,TO_DATE('2016/04/21', 'yyyy/mm/dd')); 
insert into AIRLINE (model_num,NumSeats,manufactureDate) values ('S2-AGQ',35,TO_DATE('2018/07/20', 'yyyy/mm/dd')); 



insert into Flight (al_id,departure,arrival,fare,NumSeats,deptDate,deptTime,arrivalDate,arrivalTime) values (103,'Dhaka','Delhi',10000,35,TO_DATE('2019/10/18', 'YYYY/MM/DD'), '11:00 AM' ,TO_DATE('2019/10/18', 'YYYY/MM/DD'), '12:30 PM'); 
insert into Flight (al_id,departure,arrival,fare,NumSeats,deptDate,deptTime,arrivalDate,arrivalTime) values (102,'Dhaka','Kathmandu',15000,142,TO_DATE('2019/10/18', 'YYYY/MM/DD'),'1:00 PM', TO_DATE('2019/10/18', 'YYYY/MM/DD'), '3:00 PM'); 



insert into Booking (cid,fid,bookingDate,numTicket,cost) values (100,100,sysdate,2,30000); 
insert into Booking (cid,fid,bookingDate,numTicket,cost) values (101,101,sysdate,1,10000); 

commit;