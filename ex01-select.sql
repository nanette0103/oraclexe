/*
SQL (Structured Query Language) -������ ���� ���
    ������ ������ ���̽� �ý��ۿ��� �ڷḦ ���� �� ó���ϱ� ���� ����� ���
    
SELECT��
    �����ͺ��̽����� ���� �˻� ��ɾ�
    
*/

--<���� �ּ�. ��� �� ���� *

SELECT *
FROM departments;

-- Ư�� �� ����(��������)
SELECT department_id, location_id
FROM departments;

/*
�����
    ��������ڸ� ����Ͽ� ����/��¥ ������ ǥ���� �ۼ�
    
    +���ϱ�
    -����
    *���ϱ�
    /������
    
    */
    
--��� ������ ���
SELECT LAST_NAME, SALARY, SALARY - 300
FROM employees;
--select���� ����: ���� ���� �ٲ��� ����

/*
������ �켱����
    ���ϱ�� ������� ���ϱ�, ���⺸�� ���� ����
*/

SELECT last_name, salary, 12*salary+100
FROM employees;

SELECT last_name, salary, 12*(salary+100)
FROM employees;

/*
������� null��
    null���� �����ϴ� ������� null�� ���
*/

SELECT last_name, 12*salary*commission_pct, salary, commission_pct
FROM employees;

--null�� ���� ������ �ص� null


/*
 �� alias ����
    �� �Ӹ����� �̸��� �ٲߴϴ�
    �� �̸� �ٷ� �ڿ� ���ɴϴ�.
    �� �̸��� aliar ���̿� ���� ������ as Ű���尡 �� �� �ֽ��ϴ�.
    �����̳� Ư�����ڸ� �����ϰų� ��ҹ��ڸ� �����ϴ� �� ����ǥ�� �� �ʿ��Ո�.
    
*/

select last_name as name, commision_pct, salary * 10 as �޿� 10��
FROM employees;

SELECT last_name "Same", salary*12 "Annual Salary"
FROM employees;

/* ���� ������
 ���̳� ���ڸ� �ٸ� ���� �����մϴ�.
 �� ���� ���μ�(||)���� ��Ÿ���ϴ�.
 ������� ���� ǥ�������� �ۼ��մϴ�.
 ��� ���� ���� ǥ������ �ۼ��մϴ�.
*/

SELECT last_name||job_id AS "Employees", last name, job_id
FROM employees;

/*
���ͷ� ���ڿ�
    ���ͷ��� SELECT���� ���Ե� ����, ���� �Ǵ� ��¥�Դϴ�.
    ��¥ �� ���� ���ͷ� ���� ���� ����ǥ�� ������մϴ�.
    �� ���ڿ��� ��ȯ�Ǵ� �� �࿡ �� ���� ��µ˴ϴ�.
*/

SELECT last_name || 'is a '||job_id AS "Empployee Detail"
FROM employees;

/*
��ü �ο�(q)������
    �ڽ��� ����ǥ �����ڸ� �����մϴ�.
    �����ڸ� ���Ƿ� �����մϴ�.
    ���Ӽ� �� ��뼺�� �����մϴ�.
    
*/
SELECT department_name || q'[Department's Manager Id: ]' ||manager_id
As "Department and Manager"
FROM departments;


/*
�ߺ���
    �⺻������ query ������� �ߺ����� ������ ��� ���� ǥ�õ˴ϴ�.
DISRICT 
    ������� �ߺ��� ����
*/

SELECT department_id
FROM employees;

--�ߺ� ����
SELECT DISTINCT department_id
FROM employees;

/*
���̺� ���� ǥ��
DESCRIBE ����� ����Ͽ� ���̺� ������ ǥ���մϴ�.
*/

DESCRIBE employees;

DESC employees;