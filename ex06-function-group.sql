/*
여러 행(그룹) 함수

AVG 평균
MAX 최대값
MIN 최소값
SUM 합계
*/

SELECT TRUNC(AVG(salary),2) AS avg_salary,
        MAX(salary) AS max_salary,
        MIN(salary) AS min_salary,
        SUM(salary) AS total_salary
FROM employees
WHERE job_id LIKE '%REP%';

--COUNT 함수 - null값이 아닌 모든 행의 개수를 반환합니다.
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