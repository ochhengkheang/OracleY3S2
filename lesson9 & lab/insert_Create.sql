create TABLE emp_temp AS
SELECT employee_id AS id, last_name AS name, salary, hire_date
FROM employees
where salary <= 10000;

select *
from emp_temp;

INSERT INTO emp_temp(id, name, salary, hire_date)
    VALUES(1, 'Dara', 5000, '03-JAN-23'); --DD-MON-RR

INSERT INTO emp_temp(id, name, salary, hire_date)
    VALUES(2, 'Dara', 5000, '28-FEB-23'); --DD-MON-RR

INSERT INTO emp_temp
    VALUES(2, 'Dara', 5000, '28-FEB-23'); --DD-MON-RR


INSERT INTO emp_temp
VALUES(2, 'Dara', 5000, TO_DATE('28-FEB-95', 'DD-MM-RR'));

INSERT INTO emp_temp
    VALUES(2, 'Dara', 5000, TO_DATE('28-FEB-95', 'DD-MM-YY'));

INSERT INTO emp_temp
    VALUES(2, 'Dara', 5000, sysdate);

INSERT INTO emp_temp(id, name, salary, hire_date)
VALUES(&id, '&name', &salary, TO_DATE('&hire_date', 'DD-MM-RR'));

INSERT INTO emp_temp(id, name, salary, hire_date)
    SELECT employee_id, last_name, salary, hire_date
    FROM employees
    WHERE commission_pct is not null;

UPDATE emp_temp
SET salary= 2500
WHERE name = 'Dara' AND id= 2;

UPDATE emp_temp
SET salary= NULL
WHERE name = 'Dara' AND id= 2;

UPDATE emp_temp
SET salary= (SELECT salary from emp_temp where name = 'Grant' and id = 174) --grant have 2 name, so identify ID
WHERE name = 'Dara' AND id= 2;

UPDATE emp_temp
SET salary= (SELECT salary from emp_temp where name = 'King') --grant have 2 name, so identify ID
WHERE name = 'Dara' AND id= 2;

DELETE FROM emp_temp
where id= 2;

DELETE emp_temp
where id= 1;

DELETE emp_temp
where id in (select employee_id from employees);

TRUNCATE TABLE emp_ss1; --once deleted, can't rollback

COMMIT;
ROLLBACK;

select id, name, salary, TO_CHAR(hire_date, 'DD-MM-YYYY')
from emp_temp;




