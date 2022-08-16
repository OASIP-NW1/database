use Clinics;
select * from Event;
select * from EventCategory;
select * from user;

insert into Clinics.user (userID,name,email,role) value (2,'เดียร์2','dd@gmail.com',3);
update Clinics.user
set name = 'นภัสวรรณ'
where userID = 2;

delete from  Clinics.user where userID = 5;