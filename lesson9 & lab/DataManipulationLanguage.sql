--start
insert into emp_ss1
VALUES (1, 'hello', 100, '17-JUN-87');

update emp_ss1
set salary = 12000
where id=149;

COMMIT;
--end

--start
update emp_ss1
set salary = 5000
where id=149;

delete emp_ss1;

rollback;
--end

--start
rollback;
update emp_ss1
set salary = 7000
where id=149;

create table emp_ss1 AS
(select employee_id AS id, last_name as name, salary, hire_date 
from employees);
--end AUTO COMMIT DDL

create table order_ss1(
    oId NUMBER(5),
    oDate DATE,
    cusId NUMBER(5)
);

create table order_detail_ss1(
    oId NUMBER(5), --foreign key
    pId NUMBER(5),
    qty NUMBER(5)
);

--Make Order
insert INTO order_ss1
VALUES(1, sysdate, 100);

SAVEPOINT order_1;

insert into order_detail_ss1
VALUES(1, 1, 50);
insert into order_detail_ss1
VALUES(1, 2, 21);
insert into order_detail_ss1
VALUES(1, 3, 34);

ROLLBACK TO order_customer_1;

--End Order

--Lock Row for other Users
select * 
from emp_ss1
WHERE id=101
FOR UPDATE;

--Lock 1 or Many Table at once
select *
from order_ss1 o join order_detail_ss1 od
using (oId)
FOR UPDATE;

ROLLBACK;
COMMIT;

select * 
from order_ss1;

select * 
from order_detail_ss1;

select * 
from emp_ss1;

select * 
from ora1.emp_ss1; --authorization userSystem

create table emp_ss1 AS
(select employee_id AS id, last_name as name, salary, hire_date 
from employees);
drop table emp_ss1;


