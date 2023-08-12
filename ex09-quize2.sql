/*
6, 8, 10, 11
*/

-- 1. �� ������ ��(last_name)�� �ش� ������ �Ŵ����� ������ ��(last_name) ��ȸ�ϱ�

SELECT worker.last_name, manager.last_name
FROM employees worker JOIN employees manager
ON worker.manager_id = manager.employee_id;

-- 2. �� ������ ��(last_name)�� �ش� ������ �μ� �̸�(department_name) ��ȸ�ϱ�

SELECT last_name, department_name
FROM  employees e JOIN departments d
ON e.department_id = d.department_id;


-- 3. �� �μ��� �̸�(department_name)�� �ش� �μ��� ��� �޿�(avg_salary) ��ȸ�ϱ�

SELECT department_name, AVG(salary) AS avg_salary
FROM employees e JOIN departments d
ON e.department_id = d.department_id
Group by department_name;

SELECT department_name, AVG(e.salary) AS avg_salary
FROM departments d JOIN employees e
ON e.department_id = d.department_id
Group by department_name;

-- 4. �� �μ��� �̸�(department_name)�� �ش� �μ��� �ִ� �޿�(max_salary) ��ȸ�ϱ�

SELECT d.department_name, MAX(e.salary) AS max_salary
FROM employees e JOIN departments d
ON e.department_id = d.department_id
Group by department_name;

-- 5. �� ������ ��(last_name)�� �ش� ������ ���� �μ��� �ּ� �޿�(min_salary) ��ȸ�ϱ�

SELECT oe.last_name, od.min_Salary
FROM employees oe JOIN(
    SELECT department_id, MIN(salary) AS min_salary
    FROM employees e
    GROUP BY department_id) od
    ON oe.department_id = od.department_id;

-- 6. �� �μ��� �̸�(department_name)�� �ش� �μ��� ���� ���� �� ���� ���� �޿�(highest_salary) ��ȸ�ϱ�

SELECT d.department_name, MAX(e.salary) AS highest_salary
FROM employees e JOIN departments d
ON e.department_id = d.department_id
Group by department_name;


-- 7. �� ������ ��(last_name)�� �ش� ������ �Ŵ����� ��(last_name) �� �μ� �̸�(department_name) ��ȸ�ϱ�

SELECT worker.last_name emp, manager.last_name mgr, department_name
FROM employees worker JOIN employees manager
ON worker.employee_ID = manager.manager_ID
JOIN departments d
ON worker.department_id = d.department_id;

-- 8. �� ������ ��(last_name)�� �ش� ������ ���� �μ��� �Ŵ����� ��(last_name) ��ȸ�ϱ�

SELECT oe.last_name AS w_last_name, om.last_name AS om_last_name
FROM(SELECT worker.last_name, d.department_id, d.manager_id
    FROM employees worker JOIN departments d
    ON worker.department_id = d.department_id)oe
JOIN employees om ON oe.manager_id = om.employee_id;


GROUP BY worker.department_id;

-- 9. �� ������ ��(last_name)�� �ش� ������ ���� ��簡 �ִ� ��� ���� ����� ��(last_name) ��ȸ�ϱ�

SELECT worker.last_name, manager.last_name
FROM employees worker JOIN employees manager
ON worker.manager_id=manager.employee_id;


-- 10. ������ �߿��� �޿�(salary)�� 10000 �̻��� �������� ��(last_name)�� �ش� ������ �μ� �̸�(department_name) ��ȸ�ϱ�

SELECT e.last_name, d.department_name, e.salary
FROM employees e JOIN departments d
ON e.department_id = d.department_id
WHERE salary >= 10000;


/*
11.
�� �μ��� �̸�(department_name), �ش� �μ��� �Ŵ����� ID(manager_id)�� �Ŵ����� ��(last_name),
������ ID(employee_id), ������ ��(last_name), �׸��� �ش� ������ �޿�(salary) ��ȸ�ϱ�.
�������� �޿�(salary)�� �ش� �μ��� ��� �޿����� ���� �������� ��ȸ�մϴ�.
����� �μ� �̸��� ������ �޿��� ���� ������ ���ĵ˴ϴ�.
*/

SELECT d.department_name, d.manager_id, m.last_name manager, 
        e.employee_id, e.last_name, e.salary
FROM departments d JOIN employees m
ON d.manager_id = m.employee_id
JOIN employees e
ON e.manager_id = m.employee_id
WHERE e.salary > (select AVG(e1.salary)
                    FROM employees e1
                    WHERE e1.department_id = d.department_id
                    )
ORDER BY d.department_id, e.salary DESC;

-- �μ��� ��� �޿� ���ϱ�
select e1.department_id, AVG(e1.salary)
FROM employees e1
GROUP BY e1.department_id;

-- --------------------------------------------------------------------------------------
SELECT worker.department_id, worker.manager_id, manager.last_name manager, worker.employee_id, worker.last_name employee, worker.salary
From employees worker Join employees manager
ON worker.manager_id = manager.employee_id
JOIN(SELECT department_id, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id)da
ON worker.department_id = da.department_id
WHERE worker.salary> da.avg_salary
ORDER BY department_id, salary;

SELECT department_id, AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id;

Having worker.salary >= AVG(worker.salary)
HAVING salary > ANY (SELECT salary From employees WHERE AVG(salary))
ORDER BY department_name, salary