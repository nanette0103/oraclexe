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

SELECT commission_pct
FROM employees
WHERE department_id = 80;

SELECT COUNT(commission_pct) AS non_null_commission_count
FROM employees
WHERE department_id = 80;

--COUNT(DISTINCT expr)은 특정 표현식을 기준으로 중복을 제거한 행의 개수를 반환
SELECT DISTINCT department_id AS distinct_department_id
FROM employees;

SELECT COUNT(DISTINCT department_id) AS distinct_department_id
FROM employees;

--NVL 함수를 활용하여 NULL값을 다른 값으로 대체한 후 COUNT() 함수 사용
SELECT COUNT(NVL(commission_pct, 0)) AS avg_commission
FROM employees;

/*
GROUP BY
    여러 행을 지정된 컬럼 기준으로 그룹화하여 집계 함수를 적용하기 위한 구분
    
HAVING
    GROUP BY와 함께 사용되며, 그룹화된 결과에 따라 조건을 제시할 때 사용된다.
    (WHERE - 개별행의 조건/ HAVING - 그룹의 조건)
    
*/

--부서별 평균 급여
SELECT department_id, AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id;

--GROUP BY 절에서 여러 열을 기준으로 그룹화합니다.
SELECT department_id, job_id, SUM(salary) AS total_salaty
FROM employees
WHERE department_id > 40
GROUP BY department_id, job_id
ORDER BY department_id;

--HAVING절 사용
--부서별 최대 급여가 10000보다 큰 부서를 찾습니다.
SELECT department_id, MAX(salary) AS Max_salary
FROM employees
GROUP BY department_id
HAVING MAX(SALARY) > 10000
ORDER BY DEPARTMENT_ID;

--직무별 총 급여가 13000보다 큰 직무를 찾습니다.
SELECT job_id, SUM(salary) AS total_salary
FROM employees
WHERE job_id NOT LIKE '%REP%'
GROUP BY job_id
HAVING SUM(salary)>13000
ORDER BY TOTAL_SALARY;

--그룹함수 중첩함수 가능
SELECT AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id;

SELECT MAX(AVG(salary)) AS max_avg_salary
FROM employees
GROUP BY department_id;