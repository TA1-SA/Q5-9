--####################
--Single Row Function
--####################

--built in function ,return one result per row 
--types:

--1)Numeric 
select abs(-1)   -- remove minus operator 

select SQRT(16) --sequare root 

select SQUARE(10) --multiply by itself  10*10

select POWER(2,3) -- 2*2*2 

select ROUND(22.54,0)

select ROUND(22.5456,2)

--2)String 

select len('ahmed') -- return number of character 

select SUBSTRING('ahmed',1,3) ---return sub of string  1 is starting position and 3 is the count

select left ('ahmed',2) --- last two character from the left

select RIGHT('ahmed',2)---last two character from the right

---3)Conversion  :convert from data type to another

--implicit conversion 
select '12'+1 

select ('12'+'1') +'1'

select GETDATE()+1


--explicit conversion

--select  CONVERT(int ,'12'+'1') +'1'   wrong one

select  CONVERT(int ,'12') +'1'


select CAST('12'+'1' as int )+'1'



---------------------------------------------------------------------------------------------------
--Multi row Function : built in function return one result per set of rows 
---------------------------------------------------------------------------------------------------
/*

1-sum ===>summation of numbers
2-max:==>maximum value
3-min:==>minimum value
4-avg :==>average of  numbers
5-count ==>number of rows 



note that ---> sum,avg  only with numbers 



*/
eg:

select min(salary) min ,max(salary) max,avg(salary) avg,count(salary) count,sum(salary) sum
from employees


select max(salary)-min(salary)
from employees




------------------------------------------------
--group by
------------------------------------------------
select * from employees
order by department_id


deptid   min salary
-----------------------
1===> min salary
2===>min salary
3===> min salary
4===>min salary
5===> min salary
6===>min salary
7===> min salary
8===>min salary
9===> min salary
10===>min salary
11===> min salary





select department_id ,min(salary) as minSalary,max(salary),count(salary),avg(salary)
from employees
group by department_id
having  min(salary)>5000