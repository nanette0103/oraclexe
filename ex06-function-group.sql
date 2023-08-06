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

SELECT commission_pct
FROM employees
WHERE department_id = 80;

SELECT COUNT(commission_pct) AS non_null_commission_count
FROM employees
WHERE department_id = 80;

--COUNT(DISTINCT expr)�� Ư�� ǥ������ �������� �ߺ��� ������ ���� ������ ��ȯ
SELECT DISTINCT department_id AS distinct_department_id
FROM employees;

SELECT COUNT(DISTINCT department_id) AS distinct_department_id
FROM employees;

--NVL �Լ��� Ȱ���Ͽ� NULL���� �ٸ� ������ ��ü�� �� COUNT() �Լ� ���
SELECT COUNT(NVL(commission_pct, 0)) AS avg_commission
FROM employees;

/*
GROUP BY
    ���� ���� ������ �÷� �������� �׷�ȭ�Ͽ� ���� �Լ��� �����ϱ� ���� ����
    
HAVING
    GROUP BY�� �Բ� ���Ǹ�, �׷�ȭ�� ����� ���� ������ ������ �� ���ȴ�.
    (WHERE - �������� ����/ HAVING - �׷��� ����)
    
*/

--�μ��� ��� �޿�
SELECT department_id, AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id;

--GROUP BY ������ ���� ���� �������� �׷�ȭ�մϴ�.
SELECT department_id, job_id, SUM(salary) AS total_salaty
FROM employees
WHERE department_id > 40
GROUP BY department_id, job_id
ORDER BY department_id;

--HAVING�� ���
--�μ��� �ִ� �޿��� 10000���� ū �μ��� ã���ϴ�.
SELECT department_id, MAX(salary) AS Max_salary
FROM employees
GROUP BY department_id
HAVING MAX(SALARY) > 10000
ORDER BY DEPARTMENT_ID;

--������ �� �޿��� 13000���� ū ������ ã���ϴ�.
SELECT job_id, SUM(salary) AS total_salary
FROM employees
WHERE job_id NOT LIKE '%REP%'
GROUP BY job_id
HAVING SUM(salary)>13000
ORDER BY TOTAL_SALARY;

--�׷��Լ� ��ø�Լ� ����
SELECT AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id;

SELECT MAX(AVG(salary)) AS max_avg_salary
FROM employees
GROUP BY department_id;