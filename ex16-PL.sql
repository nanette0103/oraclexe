/*
PL/SQL (Procedual Languege extension to SQL)
    SQL�� Ȯ���� ������ ���
    ���� SQL�� �ϳ��� ������� �����Ͽ� SQL ���� �� �� �ֽ��ϴ�.
    
���ν��� (Procedure)
    �����ͺ��̽����� ���డ���� �ϳ� �̻��� SQL���� ��� �ϳ��� ���� �۾������� ���� �����ͺ��̽� ��ü�Դϴ�.

*/

/*
�͸� ���ν��� -- ��ȸ�� ���ν���. DB�� ������� ����

[�⺻ ����]
    DECLATE -- ��������
    BEGIN -- ó�� ���� ����
    EXCEPTION -- ���� ó��
    END -- ó�� ���� ����
*/

--�������� ���
SET SERVEROUTPUT ON;

--��ũ��Ʈ ��� �ð��� ����ϵ��� ����
SET TIMING ON;

DECLARE
    V_STRD_DT       VARCHAR2(8);
    V_STRD_DEPTNO   NUMBER;
    V_DEPTNO        NUMBER;
    V_DNAME         VARCHAR(50);
    V_LOC           VARCHAR(50);
    V_RESULT_MSG    VARCHAR2(500) DEFAULT 'SUCCESS';
BEGIN   --���� ����
    V_STRD_DT := TO_CHAR(SYSDATE, 'YYYYMMDD')
    V_STRD_DEPTNO := 10;
    
    SELECT t1.department_id
        , t1.department_name
        , t1.location_id
    INTO V_DEPTNO
        ,V_DNAME
        ,V_ROC
    FROM departments t1
    WHERE t1.department_id = V_STRD_DEPTNO
       --��ȸ ��� ���� ����
    V_RESULT_MSG := 'RESULT > DEPTNO='||V_DEPTNO||', DNAME='||V_DNAME||', LOC='||V_LOC;
    --��ȸ ��� ���
    DBMS_OUTPUT.PUT_LINE( V_RESULT_MSG );
EXCEPTION --���� ó��
    WHEN VALUE_ERROR THEN
        V_RESULT_MSG := 'SQLCODE['||SQLCODE||'], VALUE_ERROR_MESSAGE =>'||SQLERRM;
        DBMS_OUTPUT.PUT_LINE( V_RESULT_MSG );
    WHEN OTHERS THEN
        V_RESULT_MSG := 'SQLCODE['||SQLCODE||'], MESSAGE =>'||SQLERRM;
        DBMS_OUTPUT.PUT_LINE( V_RESULT_MSG );
END;
/
-- �۾�����

/*
���ν���
[�⺻ ����]
Create or Replace PROcedure ���ν��� �̸� (�Ķ����1, �Ķ����2...)
    Is [As]
        [�����]
    begin
        [�����]
    [Exception]
        [Exception ó��]
    END;
    /

*/

Create or Replace PROcedure print_hello_proc --�Ķ���� ���� ����
    Is 
        msg VARCHAR2 (20) := 'hello world'; --���� �ʱⰪ ����
    begin
        DBMS_OUTPUT.PUT_LINE(msg);
    END;
/

EXEC print_hello_proc;


/*
in �Ű�����
    ���� ���ν��� ������ ��
    
*/

CREATE TABLE emp2 AS
SELECT employee_id empno, last_name name, salary, department_id depno
FROM employees;

SELECT * FROM emp2;

CREATE OR REPLACE PROCEDURE update_emp_salary_proc(eno IN NUMBER)
    IS
    BEGIN  
        UPDATE emp2 SET
        salary = salary*1.1
        WHERE empno=eno;
        COMMIT;
    END;
/

SELECT * FROM emp2
WHERE empno = 115;

EXEC update_emp_salary_proc(115);


/*
OUT �Ű�����
    ���ν����� ��ȯ���� �����Ƿ� OUT �Ű������� ���� ���� �� �ִ�.
    ������ �Ű������� ���
*/

CREATE OR REPLACE PROCEDURE find_emp_proc(v_eno IN NUMBER,
        v_fname OUT NVARCHAR2, v_lname OUT NVARCHAR2, v_sal OUT NUMBER)
IS
    BEGIN
        SELECT first_name, last_name, salary
        INTO v_fname, v_lname, v_sal
        FROM employees WHERE employee_id = v_eno;
    END;
/
VARIABLE v_fname NVARCHAR2(25);
VARIABLE v_lname NVARCHAR2(25);
VARIABLE v_sal NUMBER;


/*
In OUT �Ű�����
    In�� OUT�� ���ÿ� ����� �� �ִ� �Ű�����
*/

Create or replace procedure find_sal(v_io IN OUT NUMBER)
IS
    begin
    select salary
    INTO v_io
    from employees WHERE employee_id = v_io
    END;
/

DECLARE
    v_io NUMBER :=115;
    BEGIN
    DBMS_OUTPUT.PUT_LINE('eno='||v_io);
    find_sal(v_io);
    DBMS_OUTPUT.PUT_LINE('salary='||v_io);
    END;
    /
    
VAR v_io NUMBER;
EXEC :v_io := 115;
PRINT v_io;
EXEC find_sal(v_io);


/*
�Լ�(function)
    Ư�� ��ɵ��� ���ȭ, ������ �� �ְ� ������ �������� �����ϰ� ���� �� �ֽ��ϴ�.

[�⺻����]
CREATE OR REPLACE FUNCTION_name (�Ķ���� 1, �Ķ���� 2...)
RETURN datatype -- ��ȯ�Ǵ� ���� ����
    IS[AS] -- �����
    BEGIN
        [����� - PL/SQL ��]
    [EXCEPTION]
        [EXCEPTION ó��]
    RETURN ����;
    END;
/

*/
CREATE OR REPLACE FUNCTION fn_get_dept_name (p_dept_no_NUMBER)
RETURN VARCHAR2 -- ��ȯ�Ǵ� ���� ����
    IS -- �����
        V_TEST_NAME VARCHAR2
    BEGIN
        SELECT department_name
        INTO V_TEST_NAME
        FROM departments
        WHERE department_id = p_dept_no;
    RETURN V_TEST_NAME;
    END;
/

SELECT fn_get_dept_name(30) FROM dual