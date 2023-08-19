/*
데이터베이스 객체
    테이블 : 기본 저장 단위이며 행으로 구성되어 있습니다.
    뷰 : 하나 이상의 테이블에 있는 데이터의 부분 집합을 논리적으로 나타냅니다.(가상 테이블)
    시퀀스 : 일련의 숫자를 자동으로 생성해주는 객체입니다.
    인덱스 : 테이블의 데이터에 대한 빠른 검색을 지원해주는 색인 객체
    동의어 : 객체에 다른 이름을 부여합니다.
    
    
*/

--뷰 생성
CREATE VIEW empvu80
AS SELECT employee_id, last_name, salary
FROM employees
WHERE department_id = 80;

DESC empvu80;

SELECT * FROM empvu80;

--alias 사용하여 뷰 생성
CREATE VIEW salvu50
AS SELECT employee_id ID_number, last_name, salary*12 ANN_SALARY
FROM employees
WHERE department_id = 50;

SELECT * FROM salvu50
WHERE ANN_SALARY >=50000;


-- 뷰 수정
CREATE OR REPLACE VIEW empvu80
    (id_number, name, sal, department_id)
    As Select employee_id, first_name || ' ' || last_name,
    salary, department_id
    FROM employees
    WHERE department_id = 80;

SELECT * FROM empvu80;

UPDATE empvu80 SET
department_id = 10
WHERE id_number = 145 ;

--VIEW 수정 = 원본 테이블 수정

ROLLBACK;


/*
복합 뷰 생성
    두개 이상의 기본 테이블에 의해 정의된 뷰
*/
CREATE OR REPLACE VIEW dept_sum_vu
    (name, minsal, maxsal, avgsal)
AS SELECT d.department_name, MIN(e.salary),
        MAX(e.salary), AVG(e.salary)
        From employees e JOIN departments d
        ON e.department_id = d.department_id
        GROUP BY d.department_name;
        
SELECT * FROM dept_sum_vu;

/*
뷰 DML 작업 수행 규칙
    1. 행 제거 할 수 없는 경우
        ㄴ그룹 함수
        ㄴgroup by 절
        ㄴDISTINCT 키워드
        ㄴPSEYDOCOLUMN ROWNUM 키워드
        
    2. 뷰의 데이터를 수정할 수 없는 경우
        ㄴ그룹함수
        ㄴGROUP BY 절
        ㄴDISTINCT 키워드
        ㄴPSEYDOCOLUMN ROWNUM 키워드
        ㄴ표현식으로 정의되는 열
        
    3. 뷰를 통해 데이터를 추가할 수 없는 경우
        ㄴ그룹함수
        ㄴGROUP BY 절
        ㄴDISTINCT 키워드
        ㄴPSEYDOCOLUMN ROWNUM 키워드
        ㄴ표현식으로 정의되는 열
        ㄴ뷰에서 선택되지 않은 기본 테이블의 not NULL 열

*/

-- BOWNUM : 쿼리의 결과의 각 행에 순차적인 번호를 할당해준다.
SELECT ROWNUM, employee_id, last_name
FROM employees
WHERE department_id = 80;


-- DML 작업거부
CREATE OR REPLACE VIEW  empvu10
    (employee_memeber, employee_name, job_title)
AS SELECT employee_id, last_name, job_id
FROM employees
WHERE department_id=10
WITH READ ONLY;

SELECT * FROM empvu10;

UPDATE empvu SET
employee_name = 'Whalen'
WHERE employee_mamaber = 200;

/*
WITH CHECK OPTION
    뷰에 대한 데이터 변경작업 제한
*/

CREATE OR REPLACE VIEW high_salary_employee_vu
AS SELECT * FROM employees WHERE salary>10000
WITH CHECK OPTION CONSTRAINT high_salary_employee_ck;

SELECT * FROM high_salary_employee_vu;

UPDATE high_salary_employee_vu SET
salary = 26000
WHERE employee_id = 100;

-- 뷰 제거
DROP VIEW high_salary_employee_vu;


/*
시퀀스(Sequence)
    연속적인 숫자 값을 자동으로 증감시켜서 값을 리턴하는 객체입니다.
    채번할 때 많이 사용
*/

CREATE SEQUENCE my_seq
    INCREMENT by 1          --증가값
    START WITH 1            --시작값
    MINVALUE 1              --최솟값
    MAXVALUE 99999999       --최대값
    NOCYCLE                 --최대값 도달시 시작부터 반복 X
    CACHE 20                --미리 번호를 메모리에 생성
    ORDER;                  --요청 순서대로 값을 생성
    
    --현재 시퀀스 값 확인
SELECT my_seq.CURRVAL FROM dual;
    
    
SELECT my_seq.NEXTVAL FROM dual;

--시퀀스 삭제
DROP SEQUENCE my_seq;


DROP table dept3
CREATE TABLE dept3 AS
SELECT * FROM dept3 WHERE 1 = 2;

SELECT * FROM dept;

INSERT INTO dept3 VALUES(my_seq.NEXTVAL,'A',1);
INSERT INTO dept3 VALUES(my_seq.NEXTVAL,'B',2);
INSERT INTO dept3 VALUES(my_seq.NEXTVAL,'C',3);


/* 인덱스 (INDEX)
    데이터베이스에서 데이터를 빠르게 검색하기 위해 특정 열(또는 열의 조합)을 정렬하여 저장하는 구조
    데이터 조회 성능을 향상시키는 데에 사용합니다.
    
    pk - 테이블 생성시 자동으로 이덱스 생성이 됩니다.

*/

SELECT * FROM employees
WHERE Last_name = 'KING';

SELECT last_name, ROWID FROM employees --데이터 주소값
ORDER BY last_name;


--Employees 테이블의 Last_name열에 대한 인덱스 생성
CREATE INDEX emp_last_nem_idx
    ON employees(last_name);
    
DROP INDEX emp_last_nem_idx;


/*
동의어(Synonym)
    동의어를 사용하여 객체에 대체 이름을 부여할 수 있다.
*/

CREATE SYNONYM d_sum
FOR dept_sum_vu;

SELECT * FROM dept_sum_vu;

SELECT * FROM d_sum;

--제거
DROP SYNONYM d_sum;

/*
ROWIN : ROW 고유의 아이디
        데이터베이스 내에서 행의 물리적 위치를 나타냅니다.
ROWNUM: 쿼리 결과의 각 행에 순차적인 번호를 할당해준다.

*/

SELECT ROWNUM, ROWID, employee_id, last_name, salary
FROM employees;