CREATE DATABASE HR;
USE HR;

CREATE TABLE regions
(
region_id int PRIMARY KEY,
region_name varchar(25) not null
);
CREATE TABLE countries
(
country_id varchar(2) PRIMARY KEY,
country_name varchar(40) not null,
region_id int,
CONSTRAINT FK_REG_ID FOREIGN KEY(region_id)
REFERENCES regions(region_id)
);
CREATE TABLE locations
(
location_id int primary key,
street_address varchar(25),
postal_code varchar(12),
city varchar(30),
state_province varchar(12),
country_id varchar(2) ,
CONSTRAINT FK_COUNTRY_ID FOREIGN KEY(country_id)
REFERENCES countries(country_id)

);
CREATE TABLE departments
(
department_id int primary key,
department_name varchar(30),
manger_id int ,
location_id int,
CONSTRAINT FK_LOCATION_ID FOREIGN KEY(location_id)
REFERENCES locations(location_id)
);
CREATE TABLE jobs
(
job_id varchar(10) primary key,
job_title varchar(35),
min_salary numeric(10,2),
max_salary numeric(10,2),
);
CREATE TABLE job_grades
(
grade_level varchar(2) primary key,
lowest_sal decimal(10,2),
highest_sal decimal(10,2),
);

CREATE TABLE job_history
(
employee_id int NOT NULL,
start_date date ,
end_date date,
job_id varchar(10),
department_id int,
primary key(employee_id,start_date),
CONSTRAINT FK_JOB_ID FOREIGN KEY(job_id)
REFERENCES jobs(job_id),
CONSTRAINT FK_DEPARTMENT_ID FOREIGN KEY(department_id)
REFERENCES departments(department_id)
);

CREATE TABLE employees
(
employee_id int primary key,
first_name varchar(20) not null,
last_name varchar(25) not null,
email varchar(25) unique,
phone_number varchar(20) unique,
hire_date date ,
job_id varchar(10),
salary decimal(10,2),
commission_pst decimal(10,2),
manger_id int ,
department_id int,
constraint FK_EMP_HISTORY_ID FOREIGN KEY (employee_id,hire_date)
REFERENCES job_history(employee_id,start_date),

constraint FK_JOP_ID FOREIGN KEY (job_id)
REFERENCES jobs(job_id),

constraint FK_DEP_ID FOREIGN KEY (department_id)
REFERENCES departments(department_id),
);











