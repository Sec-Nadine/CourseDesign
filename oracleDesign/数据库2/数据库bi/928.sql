CREATE TABLE regions
( region_id NUMBER PRIMARY KEY, 
  region_name VARCHAR2(25)
);
CREATE TABLE countries
     ( country_id CHAR(2) PRIMARY KEY, 
        country_name VARCHAR2(40), 
        region_id NUMBER REFERENCES  regions(region_id)
     );
CREATE TABLE locations
   ( location_id NUMBER(4) PRIMARY KEY, 
      street_address VARCHAR2(40), 
      postal_code VARCHAR2(12), 
      city VARCHAR2(30) NOT NULL, 
      state_province VARCHAR2(25), 
      country_id CHAR(2)  REFERENCES  countries(country_id)
    );
CREATE TABLE departments
   ( department_id NUMBER(4) PRIMARY KEY, 
     department_name VARCHAR2(30) NOT NULL, 
     manager_id NUMBER(6), 
     location_id NUMBER(4) REFERENCES   locations (location_id)
    ) ;
CREATE TABLE jobs
   ( job_id VARCHAR2(10) PRIMARY KEY, 
      job_title VARCHAR2(35) NOT NULL, 
      min_salary NUMBER(6), 
      max_salary NUMBER(6)
    ) ;
CREATE TABLE employees
   ( employee_id NUMBER(6) PRIMARY KEY, 
      first_name VARCHAR2(20), 
      last_name VARCHAR2(25) NOT NULL, 
      email VARCHAR2(25) NOT NULL UNIQUE,   
      phone_number VARCHAR2(20), 
      hire_date DATE NOT NULL, 
      job_id VARCHAR2(10) NOT NULL REFERENCES jobs (job_id), 
      salary NUMBER(8,2) CHECK (salary > 0),
      commission_pct NUMBER(2,2), 
       manager_id NUMBER(6), 
       department_id NUMBER(4) REFERENCES  departments(department_id)
    ) ;
CREATE TABLE job_history
   ( employee_id NUMBER(6) NOT NULL  REFERENCES employees(employee_id), 
      start_date DATE NOT NULL, 
      end_date DATE NOT NULL, 
      job_id VARCHAR2(10) NOT NULL REFERENCES jobs(job_id), 
      department_id NUMBER(4) REFERENCES departments(department_id),
       CONSTRAINT jhist_date_interval 
   CHECK (end_date > start_date),
       CONSTRAINT jhist_emp_id_st_date_pk 
            PRIMARY KEY (employee_id, start_date)
     ) ;
CREATE TABLE sal_grades
   ( grade  NUMBER PRIMARY KEY,
      min_salary  NUMBER(8,2),
      max_salary  NUMBER(8,2)
    );
CREATE TABLE users(
    user_id NUMBER(2)PRIMARY KEY,
    user_name CHAR(20),
    password  VARCHAR2(20) NOT NULL
    );