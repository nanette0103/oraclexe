/*

������ ����Ͽ� �� ����
    WHERE�� ����Ͽ� ��ȯ�Ǵ� ���� �����մϴ�.
    
WHERE
    ������ �����ϴ� ������ query�� �����մϴ�.
    
    ������ ���
    -�� �̸�
    -�� ����
    -�� �̸�, ��� �Ǵ� �� ����Ʈ
*/

--WHERE�� ���
SELECT employee_id, last_name, job_id, department_id
FROM employees
WHERE department_id = 90;

/*
���ڿ� �� ��¥
    ���ڿ� �� ��¥���� ���� ����ǥ�� �����ϴ�.
    ���ڰ��� ��ҹ��ڸ� �����ϰ� ��¥ ���� ������ �����մϴ�.
    
    �⺻ ��¥ ǥ�� ����: DD-MON-RR
*/

SELECT last_name, job_id, department_id
From employees
WHERE last_name = 'Whalen';

SELECT last_name, hire_date
FROM employees
WHERE hire_date = '03/06/17'

/* 
�� ������
    Ư�� ǥ������ �ٸ� ���̳� ǥ���İ� ���ϴ� ���ǿ��� ���˴ϴ�.

    =   ����
    >   ���� ŭ
    >   ���� ũ�ų� ����
    <   ���� ����
    <=  ���� �۰ų� ����
    <>  ���� ����
    BETWEEN...AND... �� �� ����(��谪 ����)
    IN(set)         �� ����Ʈ�� ��ġ�ϴ� �� �˻�
    LIKE            ��ġ�ϴ� ���� ���� �˻�
    IS NULL         NULL ������ ���� �˻�
    
    
*/

SELECT last_name, salary
FROM employees
WHERE salary <= 3000;

--BETWEEN �����ڸ� ����ϴ� ��������
SELECT last_name, salary
FROM employees
WHERE salary BETWEEN 2500 AND 3500;

SELECT last_name, salary
FROM employees
WHERE salary >= 2500
And salary <= 3500;

-- IN �����ڸ� ����ϴ� ��������
SELECT employee_id, last_name, salary, manager_id
FROM employees
WHERE manager_id IN (100, 101, 201);

SELECT employee_id, last_name, salary, manager_id
FROM employees
WHERE manager_id =100
OR manager_id =101
OR manager_id =201;

/*
LIKE �����ڸ� ����Ͽ� ���� ��ġ
    LIKE �����ڸ� ����Ͽ� ��ȿ�� �˻� ���ڿ� ���� ��ü ���� �˻��� �����մϴ�.
    �˻� ���ǿ��� ���ͷ� ���ڳ� ���ڰ� ���Ե� �� �ֽ��ϴ�.
    - % : 0�� �̻��� ���ڸ� ��Ÿ���ϴ�.
    - _ : �� ���ڸ� ��Ÿ���ϴ�.
    

*/

SELECT first_name
FROM employees
WHERE first_name LIKE 'A%'

SELECT first_name
FROM employees
WHERE first_name LIKE 'A___'

--  ��ü ���� ����

SELECT last_name 
FROM employees
WHERE last_name LIKE '_o%';
 
 
 --ESCAPE �ĺ���
 SELECT employee_id, last_name, job_id
 FROM employees
 WHERE job_id LIKE '%SA\_%'ESCAPE'\';
 -- �ĺ��� \�� ���� _�� '_'�� �ν�
 
 /* NULL ���� ���
    IS NULL �����ڷ� NULL�� �׽�Ʈ�մϴ�.
*/
SELECT last_name, manager_id
FROM employees
WHERE manager_id IS NULL;

/*
���� �����ڸ� ����Ͽ� ���� ����
    AND : ���� ��� ������ ��� ���� ��� TRUE ��ȯ
    OR  : ���� ��� ���� �� �ϳ��� ���� ��� TRUE ��ȯ
    NOT : ������ ������ ��� TRUE�� ��ȯ
    
*/
--And ������ ���

SELECT employee_id, Last_name, job_id, salary
FROM employees
WHERE salary >= 10000
And job_id LIKE '%MAN%'

-- OR ������ ���
SELECT employee_id Last_name, job_id, salary, 12*1200 as test
FROM employees
WHERE salary >=10000
OR job_id LIKE '%MAN%'

--NOT ������ ���
SELECT Last_name, job_id
FROM employees
Where job_id Not IN ('IT_PROD', 'BT_CLERK', 'SA_REP');