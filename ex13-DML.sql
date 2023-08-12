/*
DML(Data Manipulation Language)
    DB에서 데이터를 조작하고 처리하는 SQL
    
    INSERT문 : 테이블에 새로운 레코드 삽입
    UPDATE문 : 테이블에 기존 레코드를 갱신(업데이트)하는데에 사용
    DELETE문 : 테이블에서 특정 레코드를 삭제
    
SELECT는 DML에 포함될 수 있지만, 보통 DQL로 분류한다.

*/

/*
INSERT 문
[기본형식]
    INSERT INTO 테이블명 (컬럼명1, 컬럼명2, ...)
    VALUES(값1, 값2, ...)
    
    또는
    INSERT INTO 테이블명 (컬럼명1, 컬럼명2, ...) subquery;
    
*/
SELECT * FROM departments;

INSERT INTO departments(department_id, department_name, manager_id, location_id)
VALUES(280, 'Public Relations', 100, 1700);
COMMIT; -- DML 결과를 영구적으로 DB에 반영


-- null값을 가진 행 삽입
-- 열 생략

INSERT INTO departments (department_id, department_name)
VALUES (290, 'Purchasing');

SELECT * FROM departments;

ROLLBACK; -- DML문의 실행 결과를 취소할 때 (COMMIT 이전)

INSERT INTO departments
VALUES (300, 'Finance', null, null); --null키워드 지정

/*
INSERT subquery
*/

DROP TABLE sales_reps;

Create TABLE sales_reps
AS (SELECT employee_id id, last_name name, salary, commission_pct
    FROM employees
    WHERE 1 = 2
    )
;

SELECT * FROM sales_reps;

--job_id:REP포함된 사원
SELECT employee_id, last_name, salary, commission_pct
FROM employees
WHERE job_id LIKE '%REP%'
;

INSERT INTO sales_reps(id, name, salary, commission_pct)
SELECT employee_id, last_name, salary, commission_pct
FROM employees
WHERE job_id LIKE '%REP%'
;