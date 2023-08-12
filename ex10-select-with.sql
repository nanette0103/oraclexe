/*

WITH절
        서브쿼리 결과를 임시로 정의하고 사용할 수 있는 기능입니다.
        공통테이블표현식 CTE(Common Table Expression)
        
        주로 복잡한 쿼리를 간결하게 작성하거나 가독성을 높이는데 활용됩니다.

*/

--부서별 평균 급여를 계산하는 쿼리
WITH AvgSalByDept AS (
    Select
        department_id,
        AVG(salary) AS avgsalary
    FROM employees
    GROUP BY department_id
    )
SELECT d.department_name, AvgSalByDept.avgsalary
FROM departments d
JOIN AvgSalByDept
ON d.department_id = AvgSalByDept.department_id
AND d.department_id = 10  ;

UNION ALL

