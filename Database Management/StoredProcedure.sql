create database Stored_procedure
use  Stored_procedure
--create table
create table Student (ID int, Student_name varchar (30), Course varchar (30), Grade float)
insert Student values (101, 'Mili','Math', 20)
insert Student values (102, 'Adib','English',22.5)
insert Student values (145, 'Tisha','English',36.5)
insert Student values (123, 'Monirul','Math',17)

--Rename column name
exec sp_rename 'Student.Grade','Marks', 'column'
select*from Student

--create stored procedure
Alter proc Manage_Student
--add parameters
@ID int, @Name varchar (20), @Course varchar (20), @Marks float
as begin
--body for sql statements
--insert values
Insert Student (ID, Student_name,Course,Marks) values (@ID,@Name,@Course,@Marks)
--show who has highest marks
select top 1 ID, Student_name, Marks from Student 
where Course= 'English' order by Marks desc
end

exec Manage_Student 107,'Mili','English',37.9
exec Manage_Student 101,'Mili','English',11

