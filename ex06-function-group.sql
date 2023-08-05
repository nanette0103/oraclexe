/*
���� ��(�׷�) �Լ�

AVG ���
MAX �ִ밪
MIN �ּҰ�
SUM �հ�
*/

SELECT TRUNC(AVG(salary),2) AS avg_salary,
        MAX(salary) AS max_salary,
        MIN(salary) AS min_salary,
        SUM(salary) AS total_salary
FROM employees
WHERE job_id LIKE '%REP%';

--COUNT �Լ� - null���� �ƴ� ��� ���� ������ ��ȯ�մϴ�.
SELECT commission_pct 
FROM employees;

SELECT COUNT(commission_pct) AS non_null_commission_count
FROM employees;


SELECT commission_pct ,department_id
FROM employees
WHERE department_id = 50;

SELECT COUNT(*)  AS total_employees
FROM employees
WHERE department_id = 50;

SELECT COUNT(commission_pct) AS non_null_commission_count
FROM employees
WHERE department_id = 50;

SELECT COUNT(NVL(commission_pct, 0)) AS in_null_commission_count
FROM employees
WHERE department_id = 50;