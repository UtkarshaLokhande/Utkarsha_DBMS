create database dbda;
use dbda;
#Q1) 
create table students(
	student_id int primary key,
    s_name varchar(30) not null,
    age int not null check(age>0)
);

#Q2) 
insert into students (student_id,s_name,age) values
(1,"Utkarsha",23),
(2,"Aditi",34),
(3,"Pranita",45);

use hr3;
select * from employees;
select * from departments;
select * from locations;
select * from jobs;

#Q3) 
select distinct(d.department_name),count(e.employee_id) from employees e
inner join departments d on e.department_id=d.department_id
where e.first_name like "%d"
group by employee_id;

#Q4)
select max(e.salary),e.first_name from employees e
inner join departments d on e.department_id=d.department_id 
group by d.department_name limit 3;


#Q5) 
select employee_id,concat(first_name," ",last_name) as full_name from employees where salary>(select avg(salary) from employees);

#Q6) 
select distinct(d.department_name),count(e.employee_id),d.location_id from employees e
inner join departments d on e.department_id=d.department_id
where datediff(now(),e.hire_date)>5
group by employee_id;
-- __________________

#Q8)
delimiter //
create procedure emply(in emp_id int)
begin
	select first_name,department_id,salary from employees
    where employee_id=emp_id;
end; //
delimiter ;

drop procedure emp;
call emply(90);

#Q7) 
select j.job_title,e.employee_id,e.hire_date,e.salary from employees e
join jobs j on e.job_id=j.job_id
order by salary asc;

#Q9) 
create table promotion_log (first_name int ,old.job_title varchar(30),new.job_title varchar(30), promotion_date date);

delimiter //
create trigger promotion 
after update on employees
for each row
begin
		update job_title into promotion_log from employees values
        set(first_name,old.job_title,new.job_title, current_timestamp());
end;
//
delimiter ;



##########
-- mongoDB
#Q1) 
db.Restaurant.find({$where:[{borough:"Manhattan"}]})

#Q2)
db.Restaurant.find().sort({name:1})

#Q3) 
db.Resaturant.findOne({$where:[{grade:"1"}]})

