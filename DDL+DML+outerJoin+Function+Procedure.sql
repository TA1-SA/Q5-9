--DDL + DML 


--DDL :create ,alter ,drop , truncat 
--DML: insert ,delete ,update

--Create table : 

create table tablename ( colname datatype ,etc.. )

eg:

create table table1 ( id int ) 

--namming constraint:
/*
1-should start with letter
2-could be alphunumeric and symbole $ # 
3-should be unique 
4-should be 30 character or less 

--table level constraint 
1-primary key
2-unique
3-not null
4-check
5-foriegn key

--data type :
1-int 
2-decimal 
3-varchar/nvarchar
4-char/nchar 
5-datetime
*/

eg:

create table student ( id int identity(100,10) primary key,name nvarchar(max) not null
,mobile varchar(20) unique)
;
create table course ( id int identity(1,1) primary key ,name nvarchar(max),fees decimal(10,2) check(fees>0),
startdate datetime ,duration int not null )

create table enrolledCourse (id int identity(100,100) primary key,courseid int,
studentid int references student(id) ,
foreign  key(courseid) references course(id))

============================================================
--insert data 
insert into student(name,mobile) values ('sharee','059')
insert into student(name,mobile) values ('hamad','058')
insert into course values ('SQL',2000,getdate(),21)
insert into course values ('SQL Advanced',4000,getdate()+14,30)
==================================================================================
--insert into table
insert into enrolledCourse
values(1,100)

insert into enrolledCourse
values(2,100)


insert into enrolledCourse
values(1,110)

======================================================

--outer join scenario

insert into employees
 values ('sharee','qahtani','sh@abadnet.com','059',GETDATE()-200,4,100000,100,null)
 
 insert into departments values ('Governance',1700)

 select first_name ,department_name from employees left join departments
 on departments.department_id=employees.department_id

 select first_name ,department_name from employees full outer join departments
 on departments.department_id=employees.department_id

 =============================================================================
--update employee department and first name for employee number207
 update employees
 set department_id=10,first_name='Sharee'
 where employee_id=207

=============================================================================
--delete the employee number 207
 delete employees
 where employee_id=207

=============================================================================
 --adding new column after creating the table
 alter table course
 add enddate datetime not null default getdate()
 =============================================================================
 --alter existing column  increase the size from decimal(10,2) to (11,2)
 alter table course
 alter column fees decimal(11,2)
 ==============================================================================

 create table test ( id int )
 

-- drop table : delete all table data with the structure
 drop table test


=====================================================================================
--procedure : instruction saved in the Database 
--used when filter with a literla value  as 17000 , '059'

--Eg
create proc getSutdentCourse
as 
begin
select c.name,s.name,fees from course c join enrolledcourse e on c.id=e.courseid
join student s on s.id=e.studentid
order by 1

end 

--how to execute procedure 
exec getSutdentCourse

--another example with an input

create proc getSutdentbyMobile (@mobile int)
as 
begin
select * from student 
where mobile=@mobile
end 


--execute the procedure
exec getSutdentbyMobile '059'
============================================
--function : set of instruction save in db to return value
--used when the input is table data 

CREATE FUNCTION highOrLowSalary (
	@salary DECIMAL(10,2)
)
RETURNS VARCHAR(6) AS
BEGIN
	DECLARE @return_value CHAR(4);
	
    IF (@salary >= 15000) SET @return_value = 'High';
    
	IF (@salary < 15000) SET @return_value = 'low';
 
    RETURN @return_value
END;

--function execution 
select employee_id,first_name ,salary,dbo.highOrLowSalary(salary) from employees
=======================================================================================
---views : virtual table ,subset of data    [complex ,simple]
---view used when the data is not dynamic
create view EmpData 
as 

select first_name ,last_name ,hire_Date 
from employees


select * from empdata


