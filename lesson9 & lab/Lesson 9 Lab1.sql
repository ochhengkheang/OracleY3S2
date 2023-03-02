--1
create TABLE setec_departments AS
    SELECT *
    FROM departments;

--2
INSERT INTO setec_departments
VALUES(1, 'IT Support', 1800, 201);

--3
INSERT INTO setec_departments(department_id, department_name)
VALUES(2, 'IT Programing');

--4
Update setec_departments
SET location_id=1500
WHERE department_id= 1;

--5
Update setec_departments
SET location_id= 
    (SELECT location_id
     FROM setec_departments
     WHERE department_id = 80)
WHERE department_id= 2;

--6
Update setec_departments
SET location_id=null
WHERE department_id= 20;

--7
DELETE setec_departments
WHERE department_id= 10;

--8
DELETE setec_departments
WHERE department_id IN
    (SELECT department_id
     FROM departments);
     
--9
INSERT INTO setec_departments
    SELECT *
    FROM departments;
    
--10
create TABLE setec_employees AS
    SELECT employee_id, last_name, hire_date
    FROM employees
    WHERE employee_id = -1;

--11
INSERT INTO setec_employees
VALUES(1, 'Tola', TO_DATE('12-12-2019', 'DD-MM-YYYY'));

--12
INSERT INTO setec_employees(employee_id, last_name, hire_date)
VALUES(&employee_id, &last_name, TO_DATE('&hire_date', 'DD-MM-RR'));

--13
DROP TABLE setec_departments;

--14
DROP TABLE setec_employees;