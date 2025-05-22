/*********************************
selcet 문(조회) 
*********************************/
-- select문 (select절 + from절)
select * from employees; -- 마침표
seLEct * from Employees; -- 대소문자 구분하지 않음

-- 테이블 전체 조회하기 
select * from employees;  -- 직원
select * from locations;  -- 도시
select * from regions; 	  -- 지역
select * from countries;  -- 나라 
select * from job_history;-- 업무 현황 
select * from jobs;		  -- 업무 
select * from departments;-- 부서

-- --------------------------------------
-- select 절 
-- --------------------------------------
-- * 전체 
select * from employees; 

-- employees_id 만 
select employee_id from employees; 

-- employees_id, first_name, last_name 
select employee_id, first_name, last_name from employees; 

-- 모든 직원의 이름(fisrt_name)과 전화번호 입사일 월급을 출력하세요 
select first_name, phone_number, hire_date, salary from employees;

-- 모든 직원의 이름(first_name)과 성(last_name), 월급, 전화번호, 이메일, 입사일을 출력하세요
select  first_name, 
		last_name, 
        salary, 
        phone_number, 
        email, 
        hire_date 
from employees;

-- *컬럼명에 별명 사용하기* 
-- 직원아이디, 이름, 월급을 출력하세요
-- 단 직원아이디는 empNO, 이름은 "f-name", 월급은 "월 급" 으로 컬럼명을 출력하세요
select  employee_id as empNO,
		first_name as 'f-name',
        salary as '월 급' -- 한글도 가능하지만 공백 때문에 '' 안에 써줌 
from employees;

-- 직원의 이름(fisrt_name)과 전화번호, 입사일, 월급 으로 표시되도록 출력하세요 
-- as 생략 가능
select  first_name as 이름,
		phone_number as 전화번호,
        hire_date as 입사일,
        salary as 월급
from employees;

-- 직원의 직원아이디를 사 번, 이름(first_name), 성(last_name), 월급, 전화번호, 이메일, 입사일로 표시되도록 출력하세요
select  employee_id as '사 번',
		first_name as 이름,
        last_name as 성,
        salary as 월급,
        phone_number as 전화번호,
        email as 이메일,
        hire_date as 입사일
from employees;

-- *산술 연산자 사용하기*
-- 정수/정수 소수점까지 계산됨 
select  first_name,
		salary 월급,
        salary-100 '월급-식대',
        salary*12 연봉,
        salary*12+5000 연봉보너스포함,
        salary/30 일급,
        employee_id%3 팀,
        employee_id/3 정수나누기
from employees;

-- 연산 시 문자열은 0으로 처리 --> 오류가 나지 않으므로 주의
select  job_id*12 
from employees;

select  first_name, last_name,
		concat(first_name, last_name) as 전체이름,
		concat(first_name, '-', last_name) as '전체-이름',
		concat(first_name, ' ', last_name) as '전체-이름',
        concat(first_name, ' ', last_name, ' 입사일은 ', hire_date, ' 입니다.') as 문장 	-- 강수빈 입사일은 2025-05-22 입니다.
from employees;