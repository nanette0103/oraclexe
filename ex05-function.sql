/* 
�Լ�(function)
 �Ű������� �޾� Ư�� ���(�۾�)�� �����ϰ� ��ȯ�ϴ� ������ �Ǿ��ִ�.
 
 �Լ� ����
    ������ �Լ� - ������ �Ű������� �޾� ����� ��ȯ
    ������(�׷�) �Լ� - ������ �Ű������� �޾� ��� �� ��ȯ
    
*/

--������ �Լ�

--��ҹ��� ��ȯ �Լ�
--LOWER()�Լ� - ���ڿ��� �ҹ��ڷ� ��ȯ
SELECT employee_id, last_name, department_id
FROM employees
WHERE Lower(last_name) = 'higgins';
--�Լ�(�Ű�����/����)='���԰�'

-- UPPER()�Լ� - ���ڿ��� �빮�ڷ� ��ȯ
Select upper ('higgins') From dual; --dual : ������ �ν� ���̺�(�ܼ������ ����)

--INITCAP() �Լ� - ���ڿ��� ù ���ڸ� �빮�ڷ� ��ȯ
SELECT employee_id, last_name, department_id
FROM employees
WHERE last_name = INITCAP('higgins');

--���� ���� �Լ�
--CONCAT()�Լ� - �� ���� �Ķ���� ���� �����մϴ�.
SELECT 'Hello' || 'World' FROM dual;
SELECT CONCAT('Hello', 'World') FROM dual;

--SUBSTR() - ������ ������ ���ڿ��� �����մϴ�.
Select SUBSTR ('HelloWorld', 1, 5) From dual;

-- LENGTH() - ���ڿ��� ���̸� ���ڰ����� ǥ���մϴ�.
Select LENGTH('HelloWorld') From dual;

-- INSTR() - ���ڿ����� ������ ������ ��ġ�� ã���ϴ�.
Select INSTR('HelloWorld', 'W') From dual;

-- LPAD() - ���ʺ��� ���ڽ����� ä�� ǥ������ ��ȯ�մϴ�.
Select LPAD('salary',10,'*') From dual;

-- RPAD() - �����ʺ��� ���ڽ����� ä�� ǥ������ ��ȯ�մϴ�.
Select RPAD('salary',10,'*') From dual;

-- REPLACE() - ���ڿ����� ������ ���ڸ� ġȯ�մϴ�.
SELECT REPLACE('JACK and JUE', 'J', 'BL') FROM dual;

--TRIM() - ���ڿ����� ���� �Ǵ� ���� ���ڸ� �ڸ��ϴ�.
SELECT TRIM('H' FROM 'HelloWorld') From dual;

SELECT TRIM(' ' FROM ' HelloWorld') From dual;


--�����Լ�
--ROUND() -������ �Ҽ��� �ڸ����� ���� �ݿø��մϴ�.
SELECT ROUND(45.926,2) FROM dual;

--TRUNC() -������ �Ҽ��� �ڸ����� ���� �����մϴ�.
SELECT TRUNC(45.926, 2) from dual;

-- CEIL() - �־��� ���ڸ� �ø��Ͽ� ������ ��ȯ
Select CEIL(45.923) FROM dual;

-- MOD() - ���� �������� ��ȯ�մϴ�.
SELECT MOD (1600, 300) FROM dual;


-- ��¥ �Լ�

--SYSDATE - ���� ��¥�� �ð��� ���� �� �ִ� pseudo-column
SELECT SYSDATE FROM dual;

/*
��¥ ����
    ��¥�� ���ڸ� ���ϰų� ���� ��� ��¥ ���� ���մϴ�.
    �� ��¥ ������ �ϼ��� �˾Ƴ��� ���� ���⿬���� �մϴ�.
*/
Select last_name, (sysdate-hire_date)/7 as Weeks 
FROM employees
WHERE department_id = 90;

/*
��¥ ���� �Լ�
    MONTHS_BETWEEN(date1, date2) : �� ��¥ ���� �� ���� ����մϴ�.
    ADD_MONTHS(date, n) : ��¥�� n������ �߰��մϴ�.
    NEXT_DAY(date, day_of_week): ������ ��¥�� �������� �־��� ������ ������ ��¥�� ����մϴ�.
                                (1: �Ͽ��� ~ 7:�����)
    LAST_DAY(date): �־��� ���� ������ ��¥�� ��ȯ�մϴ�.
    ROUND(date, format) : ��¥�� ������ �������� �ݿø��մϴ�.
    TRUNC(date, format) : ��¥�� ������ �������� �����մϴ�.
    
*/
SELECT MONTHS_BETWEEN(TO_DATE('2017-12-22','YYYY-MM-DD'),TO_DATE('2017-05-22','YYYY-MM-DD'))FROM dual;
SELECT ADD_MONTHS(TO_DATE('2022-12-16', 'YYYY-MM-DD'),1) FROM dual;
SELECT NEXT_DAY(TO_DATE('2023-08-05','YYYY-MM-DD'),7) FROM dual;
SELECT LAST_DAY(TO_DATE('2023-08-05','YYYY-MM-DD')) FROM dual;
SELECT LAST_DAY(sysdate) FROM dual;
SELECT ROUND(TO_DATE('2023-08-16','YYYY-MM-DD'), 'MONTH') FROM dual;
SELECT TRUNC(TO_DATE('2023-08-16','YYYY-MM-DD'), 'MONTH') FROM dual;

-- ��ȯ �Լ�

/*
TO_CHAR()�Լ� - ��¥ �Ǵ� ���ڸ� ���ڿ��� ��ȯ
    YYYY -��ü ������ ���ڷ� ��Ÿ���ϴ�.
    YEAR -���� ö�ڷ� ǥ��� ������ ��ȯ�մϴ�.
    MM   -���� ���ڸ� ���ڰ��� ��ȯ�մϴ�.
    MONTH-��ü �� �̸��� ��ȯ�մϴ�.
    MON  -���� 3�ڸ� �� ��ȯ�մϴ�.
    DY   -3�ڸ� ���� �� ��ȯ�մϴ�.
    DAY  -������ ��ü �̸��� ��ȯ�մϴ�.
    DD   -���� ��(1~31)�� ���� �������� ��ȯ�մϴ�.
    HH, HH12, HH24   - 1�� ���� �ð� �Ǵ� ���Ͻð�(0-12), ���Ͻð�(0-23)���� ��ȯ�մϴ�.
    MI   -��(0~59)�� ��ȯ�մϴ�.
    SS   -��(0~59)�� ��ȯ�մϴ�.
    FF   -�и�������(0~999)�� ��ȯ�մϴ�.
    AM/PM-����/���ĸ� ��Ÿ���� �ڿ��� ǥ�� ��ȯ�մϴ�.
    A.m./P.M.   -����/���ĸ� ��Ÿ���� ��ħǥ�� �ִ� �ڿ��� ǥ�ø� ��ȯ�մϴ�.
    
*/

SELECT last_name, To_CHAR(hire_date, 'YYYY-MM-DD HH24:MI:SS') AS HIREDATE
FROM employees;

--TIMESTAMP - ��¥����+�и�������
SELECT TO_CHAR(SYSTIMESTAMP, 'yyyy-mm-dd hh24:MI:ff2')from dual;

/*
TO_CHAR()�Լ��� ���ڿ� ����� ��
    9   - ���ڷ� ��Ÿ���ϴ�.
    0   - 0�� ǥ�õǵ��� ������ �����մϴ�.
    $   - �ε� �޷� ��ȣ�� ��ġ�մϴ�.
    L   - �ε� ���� ��ȭ ��ȣ�� ����մϴ�.
    .   - �Ҽ����� ����մϴ�.
    ,   - õ���� ǥ���ڷ� ��ǥ�� ����մϴ�.
    
*/
SELECT TO_CHAR(salary, 'L99,999.00') SALARY
FROM employees
WHERE last_name = 'Ernst';

--TO_DATE() �Լ� - ���ڿ��� DATE Ÿ������ ��ȯ
SELECT last_name, TO_CHAR(Hire_date, 'YYYY-MM-DD')
FROM employees
WHERE hire_date < TO_DATE('2005-01-01', 'YYYY-MM-DD-');

/* �Լ� ��ø
    ���� �� �Լ��� ��� �����ε� ��ø�� �� �ֽ��ϴ�.
    ��ø�� �Լ��� ���� ���� �������� ���� ���� ������ �򰡵˴ϴ�.    
*/

SELECT last_name, UPPER(CONCAT(SUBSTR(last_name, 1, 8), '_US'))
FROM employees
WHERE department_id = 60;

-- NVL()�Լ� - null���� ���� ������ ������ ��ȯ�մϴ�. (null�� ������ �ȵ� �� ���)(null�� ���� �Ұ�!)
SELECT last_name, salary, NVL(commission_pct, 0), (salary*12)AS Y_SAL,
(salary*12)+(salary*12*NVL(commission_pct, 0)) AS AN_SAL
From employees;

--NVL2() �Լ�
--ù ��° ǥ������ �˻��մϴ�. ù��° ǥ������ null�� �ƴϸ� �ι�° ǥ������ ��ȯ�մϴ�.
--ù ��° ǥ������ null�̸� ����° ǥ������ ��ȯ�˴ϴ�.
SELECT last_name, salary, commission_pct,
        NVL2(commission_pct, 'SAL+COMM', 'SAL') AS income
FROM employees
WHERE department_id IN(50,80);

--NULLIF() �Լ�
--�� ǥ������ ���ϰ� ������ null�� ��ȯ�ϰ� �ٸ��� expr1�� ��ȯ�մϴ�.
--�׷��� expr1�� ���� ���ͷ� Null�� ������ �� �����ϴ�.
SELECT first_name, LENGTH(first_name) AS expr1,
        last_name, LENGTH(last_name) AS expr2,
        NULLIF(LENGTH(first_name), LENGTH(last_name)) As result
FROM employees;


--COALESCE()�Լ�
--����Ʈ���� null�� �ƴ� ù ��° ǥ������ ��ȯ�մϴ�.
SELECT last_name, employee_id,
        COALESCE(TO_CHAR(commission_pct), TO_CHAR(manager_id),'No commission and no manager')
FROM employees;

-- ���Ǻ� ǥ����
/*
CASE��
    IF-THEN-ELSE�� �۾��� �����Ͽ� ���Ǻ� ��ȸ�� ���ϰ� �����ϵ��� �մϴ�.
*/

SELECT last_name, job_id, salary,
        case job_id
            WHEN 'IT_PROG' THEN 1.10*salary
            WHEN 'ST_CLERK' THEN 1.15*salary
            WHEN 'SA_REP' THEN 1.20*salary
            ELSE salary
        END AS REBISED_SALARY
FROM employees;

--DECODE()�Լ�
--CASE�İ� ������ �۾��� �����մϴ�.
SELECT last_name, job_id, salary,
        DECODE(job_id, 'IT_PROG', 1.10*salary,
                        'ST_CLERK', 1.15*salary,
                        'SA_REP', 1.20*salary,
                        salary) AS RREBISED_SALARY
FROM employees;