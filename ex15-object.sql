/*
�����ͺ��̽� ��ü
    ���̺� : �⺻ ���� �����̸� ������ �����Ǿ� �ֽ��ϴ�.
    �� : �ϳ� �̻��� ���̺� �ִ� �������� �κ� ������ �������� ��Ÿ���ϴ�.(���� ���̺�)
    ������ : �Ϸ��� ���ڸ� �ڵ����� �������ִ� ��ü�Դϴ�.
    �ε��� : ���̺��� �����Ϳ� ���� ���� �˻��� �������ִ� ���� ��ü
    ���Ǿ� : ��ü�� �ٸ� �̸��� �ο��մϴ�.
    
    
*/

--�� ����
CREATE VIEW empvu80
AS SELECT employee_id, last_name, salary
FROM employees
WHERE department_id = 80;

DESC empvu80;

SELECT * FROM empvu80;

--alias ����Ͽ� �� ����
CREATE VIEW salvu50
AS SELECT employee_id ID_number, last_name, salary*12 ANN_SALARY
FROM employees
WHERE department_id = 50;

SELECT * FROM salvu50
WHERE ANN_SALARY >=50000;


-- �� ����
CREATE OR REPLACE VIEW empvu80
    (id_number, name, sal, department_id)
    As Select employee_id, first_name || ' ' || last_name,
    salary, department_id
    FROM employees
    WHERE department_id = 80;

SELECT * FROM empvu80;

UPDATE empvu80 SET
department_id = 10
WHERE id_number = 145 ;

--VIEW ���� = ���� ���̺� ����

ROLLBACK;


/*
���� �� ����
    �ΰ� �̻��� �⺻ ���̺� ���� ���ǵ� ��
*/
CREATE OR REPLACE VIEW dept_sum_vu
    (name, minsal, maxsal, avgsal)
AS SELECT d.department_name, MIN(e.salary),
        MAX(e.salary), AVG(e.salary)
        From employees e JOIN departments d
        ON e.department_id = d.department_id
        GROUP BY d.department_name;
        
SELECT * FROM dept_sum_vu;

/*
�� DML �۾� ���� ��Ģ
    1. �� ���� �� �� ���� ���
        ���׷� �Լ�
        ��group by ��
        ��DISTINCT Ű����
        ��PSEYDOCOLUMN ROWNUM Ű����
        
    2. ���� �����͸� ������ �� ���� ���
        ���׷��Լ�
        ��GROUP BY ��
        ��DISTINCT Ű����
        ��PSEYDOCOLUMN ROWNUM Ű����
        ��ǥ�������� ���ǵǴ� ��
        
    3. �並 ���� �����͸� �߰��� �� ���� ���
        ���׷��Լ�
        ��GROUP BY ��
        ��DISTINCT Ű����
        ��PSEYDOCOLUMN ROWNUM Ű����
        ��ǥ�������� ���ǵǴ� ��
        ���信�� ���õ��� ���� �⺻ ���̺��� not NULL ��

*/

-- BOWNUM : ������ ����� �� �࿡ �������� ��ȣ�� �Ҵ����ش�.
SELECT ROWNUM, employee_id, last_name
FROM employees
WHERE department_id = 80;


-- DML �۾��ź�
CREATE OR REPLACE VIEW  empvu10
    (employee_memeber, employee_name, job_title)
AS SELECT employee_id, last_name, job_id
FROM employees
WHERE department_id=10
WITH READ ONLY;

SELECT * FROM empvu10;

UPDATE empvu SET
employee_name = 'Whalen'
WHERE employee_mamaber = 200;

/*
WITH CHECK OPTION
    �信 ���� ������ �����۾� ����
*/

CREATE OR REPLACE VIEW high_salary_employee_vu
AS SELECT * FROM employees WHERE salary>10000
WITH CHECK OPTION CONSTRAINT high_salary_employee_ck;

SELECT * FROM high_salary_employee_vu;

UPDATE high_salary_employee_vu SET
salary = 26000
WHERE employee_id = 100;

-- �� ����
DROP VIEW high_salary_employee_vu;


/*
������(Sequence)
    �������� ���� ���� �ڵ����� �������Ѽ� ���� �����ϴ� ��ü�Դϴ�.
    ä���� �� ���� ���
*/

CREATE SEQUENCE my_seq
    INCREMENT by 1          --������
    START WITH 1            --���۰�
    MINVALUE 1              --�ּڰ�
    MAXVALUE 99999999       --�ִ밪
    NOCYCLE                 --�ִ밪 ���޽� ���ۺ��� �ݺ� X
    CACHE 20                --�̸� ��ȣ�� �޸𸮿� ����
    ORDER;                  --��û ������� ���� ����
    
    --���� ������ �� Ȯ��
SELECT my_seq.CURRVAL FROM dual;
    
    
SELECT my_seq.NEXTVAL FROM dual;

--������ ����
DROP SEQUENCE my_seq;


DROP table dept3
CREATE TABLE dept3 AS
SELECT * FROM dept3 WHERE 1 = 2;

SELECT * FROM dept;

INSERT INTO dept3 VALUES(my_seq.NEXTVAL,'A',1);
INSERT INTO dept3 VALUES(my_seq.NEXTVAL,'B',2);
INSERT INTO dept3 VALUES(my_seq.NEXTVAL,'C',3);


/* �ε��� (INDEX)
    �����ͺ��̽����� �����͸� ������ �˻��ϱ� ���� Ư�� ��(�Ǵ� ���� ����)�� �����Ͽ� �����ϴ� ����
    ������ ��ȸ ������ ����Ű�� ���� ����մϴ�.
    
    pk - ���̺� ������ �ڵ����� �̵��� ������ �˴ϴ�.

*/

SELECT * FROM employees
WHERE Last_name = 'KING';

SELECT last_name, ROWID FROM employees --������ �ּҰ�
ORDER BY last_name;


--Employees ���̺��� Last_name���� ���� �ε��� ����
CREATE INDEX emp_last_nem_idx
    ON employees(last_name);
    
DROP INDEX emp_last_nem_idx;


/*
���Ǿ�(Synonym)
    ���Ǿ ����Ͽ� ��ü�� ��ü �̸��� �ο��� �� �ִ�.
*/

CREATE SYNONYM d_sum
FOR dept_sum_vu;

SELECT * FROM dept_sum_vu;

SELECT * FROM d_sum;

--����
DROP SYNONYM d_sum;

/*
ROWIN : ROW ������ ���̵�
        �����ͺ��̽� ������ ���� ������ ��ġ�� ��Ÿ���ϴ�.
ROWNUM: ���� ����� �� �࿡ �������� ��ȣ�� �Ҵ����ش�.

*/

SELECT ROWNUM, ROWID, employee_id, last_name, salary
FROM employees;