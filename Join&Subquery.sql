-- join : disply data from multiple table 

--join type:
--[1] inner

select employee_id ,first_name ,last_name ,departments.department_id ,department_name 
from employees join departments
on employees.department_id=departments.department_id


select * from employees
select * from departments
select * from locations


---- disply city and department name for employees who reside in seattle
select employee_id ,first_name ,last_name ,departments.department_id ,department_name ,city
from employees join departments
on employees.department_id=departments.department_id
join locations on locations.location_id=departments.location_id
where city='seattle'

---- disply employess info  for  whom reside in seattle

--subquey : more than one select in the same statment 
select employee_id ,first_name ,last_name ,department_id from employees
where department_id in
(select department_id from departments 
where location_id in (select location_id from locations where city='seattle'))

select * from employees
where salary>(select salary from employees where employee_id=103)


select employee_id,last_name,salary from employees
where salary>(select avg(salary) from employees)


select last_name ,job_id ,departments.department_id ,
department_name 
from employees join departments
on employees.department_id=departments.department_id
where location_id=(select location_id from locations
where city='Toronto')
order by salary