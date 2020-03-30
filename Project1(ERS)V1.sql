
/************************************
 * Project 1 Database 
 * Script Project1(ERS).sql
 * Description: Creates a simple reimbursement database
 * DB Server: Local PostGreSQL
 * Author: Gayathri Addagada 
************************************/

-- command used to find out what version postgresql your using 
SELECT version();
/****************************
	Create Tables 
****************************/
DROP SCHEMA ers CASCADE;

-- Creates the Employee Reimbursement schema if it doesn't exist
CREATE SCHEMA IF NOT EXISTS ERS;
	
-- Creates the ERS Role table
create table ers."Role"(
RoleId serial primary key, 
Role_name varchar(10) not null
);

-- Creates the ERS Employee table
create table ers."Employee"(
EmployeeId serial primary key,
FirstName varchar(40) not null, 
LastName varchar(40) not null,
Title varchar (40) not null,
Username text not null unique,
Password text not null,
Email varchar(60) unique, 
manager_id int not null
);

-- Creates the ERS Reimbursement table
create table ers."Reimbursement"(
ReimbursementId serial primary key,
Date Timestamp not null, 
Description varchar(100) not null,
Category varchar(40) not null, 
Cost varchar(16) not null,
status varchar(40) not null,
comments text, 
employee_id int not null

);


--CREATE TABLE note(
  --  note_id serial PRIMARY KEY,
    --message varchar(255) NOT NULL,
    --created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
--);


-- Creates the ERS Reimbursement_Status table
--create table ers."Reimbursement_Status"(
--StatusId serial primary key, 
--Status text not null, 
--Comments varchar(256)
--);





/****************************
	Create Foreign Keys
****************************/
/*alter table ers.Employee add constraint FK_EmployeeRoleId 
foreign key Role_Id references "Role".RoleId 
--on delete no action 
--on update no action;
FOREIGN KEY (Role_Id) REFERENCES Role (RoleId)
*/


ALTER TABLE ers."Employee"
ADD CONSTRAINT fk_employee_role FOREIGN KEY (role_id) REFERENCES ers."Role" (RoleId);


ALTER TABLE ers."Reimbursement"
ADD CONSTRAINT fk_employee_reimbursement FOREIGN KEY (employee_id) REFERENCES ers."Employee" (EmployeeId);


ALTER TABLE ers."Reimbursement"
ADD COLUMN reviewed_date Timestamp;
ALTER TABLE ers."Reimbursement"
ADD COLUMN reviewed_date Timestamp;

ALTER TABLE ers."Reimbursement"
ADD COLUMN reviewed_by int;
commit;

update ers."Reimbursement"
set reviewed_date='3-09-2020';

UPDATE ers."Reimbursement" 
set status = 'SUBMITTED' where ReimbursementId <5;

update users set updated_at = now();

update ers."Reimbursement" set status='APPROVED',  reviewed_by=2, reviewed_date='2020-03-10 08:46:13.401-05' where reimbursementid=3;


update ers."Reimbursement"
set reviewed_by=2;

ALTER TABLE table_name
ADD column_name data_type column_constraint;

fk_employee_reimbursement FOREIGN KEY (employee_id) REFERENCES ers."Employee" (EmployeeId);


--on delete no action 
--on update no action;


--drop table ERS
--drop schema ERS cascade;


/****************************
	Populate Tables
****************************/
-- inserts data into "ers.Employee" table
INSERT INTO ers."Employee" (FirstName, LastName, Title, Username, Password, Email, manager_id) 
                     Values('Gayathri', 'Addagada', 'Associate', 'gadddagada1', 'abc123', 'gaddagada1@yahoo.com',  2); 
INSERT INTO ers."Employee" (FirstName, LastName, Title, Username, Password,  Email, manager_id) 
                     Values('Carolyn', 'Rehm', 'Manager', 'cRehm1', 'abc123', 'cRehm1@revature.com', 2); 
INSERT INTO ers."Employee" (FirstName, LastName, Title, Username, Password, Email,manager_id) 
                     Values('Christopher', 'Gaugh', 'Manager', 'cGaugh1', 'abc123', 'cGaugh1@revature.com', 3); 
INSERT INTO ers."Employee" (FirstName, LastName, Title, Username, Password,  Email, manager_id) 
                     Values('Christopher', 'Thompson', 'Director', 'cThompson1', 'abc123','cThompson1@revature.com', 2);                   

insert into ers."Employee" (FirstName, LastName,Title, Username, Password,  Email, manager_id) 
                            values('Zachary','Pieper','Auditer','zPieper1','abc123','zPieper@revature.com',2)
                    
                    
-- inserts data into "ers.Reimbursement" table 
insert into ers."Reimbursement" (date, description, category, cost, status, comments, employee_id) 
						values( now(),'relocation expenses', 'travel', 150, 'submitted', 'intial submission of expense', 1 );
insert into ers."Reimbursement" (date, description, category, cost, status, comments, employee_id) 
						values( now(),'relocation expenses', 'travel', 250, 'In Review', 'intial submission of expense', 2 );
insert into ers."Reimbursement" (date, description, category, cost, status, comments, employee_id) 
						values( now(),'office supplies', 'office', 250, 'In Review', 'Ran out of office supplies', 3);
--inserts prepopulated data into Reimbursement_Status  table 
--insert into Reimbursement_Status (Status, Comments) values('Draft','');
--insert into Reimbursement_Status (Status, Comments) values('Submitted','');
--insert into Reimbursement_Status (Status, Comments) values('In Review','');
--insert into Reimbursement_Status (Status, Comments) values('Approved','');
--insert into Reimbursement_Status (Status, Comments) values('Resubmitted','');
--insert into Reimbursement_Status (Status, Comments) values('Denied','');
--insert into Reimbursement_Status (Status, Comments) values('Closed','');

--inserts prepopulated data ers."Role" table 
insert into ers."Role" (Role_Name) values('Employee');
insert into ers."Role" (Role_Name) values('Manager');
insert into ers."Role" (Role_Name) values('Director');
insert into ers."Role" (Role_Name) values('Auditer');

-- Adds the status and comments column to the Reimbursement table in the schema
--alter table ers."Reimbursement" add status text not null;
--alter table ers."Reimbursement" add comments text not null;


/****************************
	Querying Tables
****************************/
select * from ers."Role";
select * from reimbursement_status;
select * from ers."Employee";
select * from ers."Reimbursement";

insert into ers."Reimbursement" (date, description, category, cost, status, comments, employee_id, reimbursement_id) values (?,?,?,?,?,?,?,?);


--delete from ers."Role" ;

delete from ers."Reimbursement"; 

-- deletes employee where employee id = ?
--delete from ers."Employee" where employeeid=?;

-- Update Employee information 
update ers."Employee" 
set username = 'gaddagada1'
where employeeid=1;

update ers."Employee" 
set title = 'EMPLOYEE'
where username='gaddagada1'

update ers.employee set FirstName = ?, LastName=?, Title=?, Username=?, 
Password=?, Phone=?, Email=?, Address=?, City=?, State=?, Country=?, 
PostalCode=?, Role_Id=?  where username = ?


update ers."Reimbursement" set Date=now(), Description ='office supplies', Category ='office' Cost=250, status='Denied', comments='Ran out off office supplies', employee_id =3 where reimbursementid =3

-- Update Reimbursement information 
update ers."Reimbursement" 
set status = 'APPROVED'
where status='Approved';
select * from ers."Reimbursement" ;


update ers."Reimbursement" set Date=?, Description =?, 
Category =? Cost=?, status=?, comments=?, employee_id =? where status =? 

commit;

	SELECT username
	FROM ers."Employee" 
	WHERE 

select * ers."Employee" where employeeid=1;



SELECT *
FROM ers."Reimbursement" 
WHERE reimbursementid = 1

commit;

-- This is what my query ws getting in prepared statement in eclipse 
update ers."Reimbursement" set Date='2020-03-03 -06', Description ='office supplies', 
Category='office', Cost='250', status='Denied', comments='Ran out of office supplies', employee_id =3 where reimbursementid=null

SELECT * FROM ers."Employee" WHERE  username ='gaddagada1';

delete from ers."Employee" ;

