/*
Subquery 구문
    다른 SELECT문에 포함되는 SELECT문 입니다.
    
*/

--단일형 Subquery 실행
SELECT last_name, salary
FROM employees
WHERE last_name ='Abel';

SELECT last_name, salary
FROM employees
WHERE salary > (SELECT salary FROM employees WHERE last_name = 'Abel');

-- Subquery에서 그룹 함수 사용
SELECT last_name, job_id, salary
FROM employees
WHERE salary = (SELECT MIN(salary) FROM employees);


/*
여러 행 Subquery
    IN: 리스트의 임의 멤버와 같음
    ANY: =, <>, >, <, >=, <= 연산자가 앞에 있어야 함
        <ANY는 최댓값보다 작음을 의미, >ANY는 최소값보다 큼을 의미
        =ANY는 IN
    ALL: >ALL은 최대값보다 큼, <ALL은 최소값보다 작음
        
*/

SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary <ANY (SELECT salary FROM employees WHERE job_id = 'IT_PROG')
AND job_id <> 'IT_FROG';
-- <>: 제외한다

SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary >ALL (SELECT salary FROM employees WHERE job_id = 'IT_PROG')
AND job_id <> 'IT_FROG';

SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary IN(SELECT salary FROM employees WHERE job_id = 'IT_PROG')
AND job_id <> 'IT_FROG';
-- IN: 하나라도 일치

/*
EXISTS 연산자
    Subquery에서 최소한 한 개의 행을 반환하면 TRUE로 평가됩니다.
*/
SELECT * FROM departments
WHERE NOT EXISTS
        (SELECT * FROM employees
        WHERE employees.department_id=departments.department_id);

SELECT * FROM departments
WHERE department_id NOT IN
        (SELECT department_id FROM employees
        WHERE employees.department_id=departments.department_id);
        
        
/*
Subquery의 null값
    반환된 값 중 하나가 null이면 전체 query가 행을 반환하지 않습니다.
    null값을 비교하는 모든 조건은 결과가 null이기 때문.
*/

SELECT emp.last_name
FROM employees emp
WHERE emp.employee_id NOT IN
                        (SELECT mgr.manager_id
                        FROM employees mgr);
