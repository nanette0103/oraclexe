/*
6, 8, 10, 11
*/

-- 1. 각 직원의 성(last_name)과 해당 직원의 매니저인 직원의 성(last_name) 조회하기

SELECT worker.last_name, manager.last_name
FROM employees worker JOIN employees manager
ON worker.manager_id = manager.employee_id;

-- 2. 각 직원의 성(last_name)과 해당 직원의 부서 이름(department_name) 조회하기

SELECT last_name, department_name
FROM  employees e JOIN departments d
ON e.department_id = d.department_id;


-- 3. 각 부서의 이름(department_name)과 해당 부서의 평균 급여(avg_salary) 조회하기

SELECT department_name, AVG(salary) AS avg_salary
FROM employees e JOIN departments d
ON e.department_id = d.department_id
Group by department_name;

SELECT department_name, AVG(e.salary) AS avg_salary
FROM departments d JOIN employees e
ON e.department_id = d.department_id
Group by department_name;

-- 4. 각 부서의 이름(department_name)과 해당 부서의 최대 급여(max_salary) 조회하기

SELECT d.department_name, MAX(e.salary) AS max_salary
FROM employees e JOIN departments d
ON e.department_id = d.department_id
Group by department_name;

-- 5. 각 직원의 성(last_name)과 해당 직원이 속한 부서의 최소 급여(min_salary) 조회하기

SELECT oe.last_name, od.min_Salary
FROM employees oe JOIN(
    SELECT department_id, MIN(salary) AS min_salary
    FROM employees e
    GROUP BY department_id) od
    ON oe.department_id = od.department_id;

-- 6. 각 부서의 이름(department_name)과 해당 부서에 속한 직원 중 가장 높은 급여(highest_salary) 조회하기

SELECT d.department_name, MAX(e.salary) AS highest_salary
FROM employees e JOIN departments d
ON e.department_id = d.department_id
Group by department_name;


-- 7. 각 직원의 성(last_name)과 해당 직원의 매니저의 성(last_name) 및 부서 이름(department_name) 조회하기

SELECT worker.last_name emp, manager.last_name mgr, department_name
FROM employees worker JOIN employees manager
ON worker.employee_ID = manager.manager_ID
JOIN departments d
ON worker.department_id = d.department_id;

-- 8. 각 직원의 성(last_name)과 해당 직원이 속한 부서의 매니저의 성(last_name) 조회하기

SELECT oe.last_name AS w_last_name, om.last_name AS om_last_name
FROM(SELECT worker.last_name, d.department_id, d.manager_id
    FROM employees worker JOIN departments d
    ON worker.department_id = d.department_id)oe
JOIN employees om ON oe.manager_id = om.employee_id;


GROUP BY worker.department_id;

-- 9. 각 직원의 성(last_name)과 해당 직원의 보고 상사가 있는 경우 보고 상사의 성(last_name) 조회하기

SELECT worker.last_name, manager.last_name
FROM employees worker JOIN employees manager
ON worker.manager_id=manager.employee_id;


-- 10. 직원들 중에서 급여(salary)가 10000 이상인 직원들의 성(last_name)과 해당 직원의 부서 이름(department_name) 조회하기

SELECT e.last_name, d.department_name, e.salary
FROM employees e JOIN departments d
ON e.department_id = d.department_id
WHERE salary >= 10000;


/*
11.
각 부서의 이름(department_name), 해당 부서의 매니저의 ID(manager_id)와 매니저의 성(last_name),
직원의 ID(employee_id), 직원의 성(last_name), 그리고 해당 직원의 급여(salary) 조회하기.
직원들의 급여(salary)가 해당 부서의 평균 급여보다 높은 직원들을 조회합니다.
결과는 부서 이름과 직원의 급여가 높은 순으로 정렬됩니다.
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

-- 부서별 평균 급여 구하기
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