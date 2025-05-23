/*********************************
selcet 문(조회) 
*********************************/

-- --------------------------------------
-- where 절 
-- --------------------------------------

-- 부서아이디가 30인 사원의 이름과 부서번호를 구하시오
select  first_name
		,department_id
from employees
where department_id <> 30;	-- 	=, >, <, >=, <=, != <> 

-- 월급이 15000 이상인 사원들의 이름과 월급을 출력하세요
select  concat(first_name, ' ' , last_name) as 이름
		,salary as 월급
from employees
where salary > 15000; 

-- 07/01/01 일 이후에 입사한 사원들의 이름과 입사일을 출력하세요
select  concat(first_name, ' ', last_name) as 이름
		,hire_date 입사일 
from employees
where hire_date > '07/01/01';

-- 이름이 Lex인 직원의 이름과 월급을 출력하세요 
-- 문자열 대소문자를 구별하지 않는다.  
-- 구별하려면 binary 사용
select  first_name 이름
		,salary 월급
from employees
where first_name = 'lex';






