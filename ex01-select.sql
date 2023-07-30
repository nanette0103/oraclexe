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