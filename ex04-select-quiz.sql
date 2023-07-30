--Q1."employees" ���̺��� ��� �������� ��(First name), �̸�(Last name)�� ��ȸ�ϼ���

SELECT first_name, last_name
FROM employees;

--Q2."jobs" ���̺��� ��� �������� ���� id(job id)�� ������(job title)�� ��ȸ�ϼ���
SELECT job_id, job_title
FROM jobs;

--Q3."departments" ���̺��� ��� �μ����� �μ� ID(department id)�� �μ���(department name)�� ��ȸ�ϼ���
SELECT department_id, department_name
FROM departments;

--Q4."locations" ���̺��� ��� �������� ���� ID(location id)�� ����(city)�� ��ȸ�ϼ���.
SELECT location_id, city
FROM locations;

--Q5."employees" ���̺��� �޿�(salary)�� 5000�̻��� �������� �̸�(first name)�� �޿�(salary)�� ��ȸ�ϼ���.
SELECT first_name, salary
FROM employees
WHERE salary >= 5000;

--Q6."employees" ���̺��� �ٹ� ������(hire date)�� 2005�� ������ �������� �̸�(first name)�� �ٹ�������(hire date)�� ��ȸ�ϼ���.

SELECT first_name, hire_date
FROM employees
WHERE hire_date > '05/01/01';

SELECT first_name, hire_date
FROM employees
WHERE hire_date > TO_DATE('2005-01-01', 'YYYY-MM-DD');