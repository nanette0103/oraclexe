/*
SQL (Structured Query Language) -구조적 질의 언어
    관계형 데이터 베이스 시스템에서 자료를 관리 및 처리하기 위해 설계된 언어
    
SELECT문
    데이터베이스에서 정보 검색 명령어
    
*/

--<한줄 주석. 모든 열 선택 *

SELECT *
FROM departments;

-- 특정 열 선택(프로젝션)
SELECT department_id, location_id
FROM departments;

/*
산술식
    산술연산자를 사용하여 숫자/날짜 데이터 표현식 작성
    
    +더하기
    -빼기
    *곱하기
    /나누기
    
    */
    
--산술 연산자 사용
SELECT LAST_NAME, SALARY, SALARY - 300
FROM employees;
--select문에 연산: 실제 값을 바꾸진 않음

/*
연산자 우선순위
    곱하기와 나누기는 더하기, 빼기보다 먼저 수행
*/

SELECT last_name, salary, 12*salary+100
FROM employees;

SELECT last_name, salary, 12*(salary+100)
FROM employees;

/*
산술식의 null값
    null값을 포함하는 산술식은 null로 계산
*/

SELECT last_name, 12*salary*commission_pct, salary, commission_pct
FROM employees;

--null은 무슨 연산을 해도 null


/*
 열 alias 정의
    열 머리글의 이름을 바꿉니다
    열 이름 바로 뒤에 나옵니다.
    열 이름과 aliar 사이에 선태 사행인 as 키워드가 올 수 있습니다.
    공백이나 특수문자를 포함하거나 대소문자를 구분하는 존 따옴표가 꼭 필요합닏.
    
*/

select last_name as name, commision_pct, salary * 10 as 급여 10배
FROM employees;

SELECT last_name "Same", salary*12 "Annual Salary"
FROM employees;

/* 연결 연산자
 열이나 문자를 다른 열에 연결합니다.
 두 개의 세로선(||)으로 나타냅니다.
 결과물을 문자 표현식으로 작성합니다.
 결과 열로 문자 표현식을 작성합니다.
*/

SELECT last_name||job_id AS "Employees", last name, job_id
FROM employees;

/*
리터럴 문자열
    리터럴은 SELECT문에 포함된 문자, 숫자 또는 날짜입니다.
    날짜 및 문자 리터럴 값은 작은 따옴표로 묵어야합니다.
    각 문자열은 반환되는 각 행에 한 번씩 출력됩니다.
*/

SELECT last_name || 'is a '||job_id AS "Empployee Detail"
FROM employees;

/*
대체 인용(q)연산자
    자신의 따옴표 구분자를 지정합니다.
    구분자를 임의로 선택합니다.
    가속성 및 사용성이 증가합니다.
    
*/
SELECT department_name || q'[Department's Manager Id: ]' ||manager_id
As "Department and Manager"
FROM departments;


/*
중복행
    기본적으로 query 결과에는 중복행을 포함한 모든 행이 표시됩니다.
DISRICT 
    결과에서 중복행 제거
*/

SELECT department_id
FROM employees;

--중복 제거
SELECT DISTINCT department_id
FROM employees;

/*
테이블 구조 표시
DESCRIBE 명령을 사용하여 테이블 구조를 표시합니다.
*/

DESCRIBE employees;

DESC employees;