-- ----------------------------------------------------
-- *SubQuery
-- ----------------------------------------------------

-- 'Den'보다 월급이 많은 사람의 이름과 월급은? ----------------------------------------------------
-- 딘의 월급
select  salary
from employees
where first_name = 'Den'
;

-- 11000보다 많이 받은 사람 리스트
select  first_name 
		,salary
from employees
where salary >= 11000 -- 합칠 때 숫자만 와야돼서 first_name을 넣지 않음
;

-- 합친다
select  first_name
		,salary
from employees
where salary >= (select salary -- first_name 넣으면 식이 안 맞음
				 from employees
				 where first_name = 'Den')
;
-- 월급을 가장 적게 받는 사람의 이름, 월급, 사원번호는? -----------------------------------------
-- 가장 적은 월급
select  min(salary)
from employees
;

-- 월급이 2100인 사람의 이름, 월급, 사번
select  first_name
		,salary
        ,employee_id
from employees
where salary = 2100
;

-- 합치기 
select  first_name
		,salary
        ,employee_id
from employees
where salary = (select min(salary)
				from employees)
;

-- !!! 절대로 한방에 작성하지 않는다 오해하지 말자!!!
-- 나눠서 작성 후 합치기 (테스트 꼭 하기)

-- 평균 월급보다 적게 받는 사람의 이름, 월급을 출력하세요 -----------------------------------------
-- 평균 월급
select avg(salary)
from employees
;

-- 평균월급보다 적게 받는 사람의 이름, 월급
select  first_name
		,salary
from employees
where salary <= 6461
;

-- 합치기
select  first_name
		,salary
from employees
where salary <= (select avg(salary)
				from employees)
;






-- * ----------------------------------------------------

select *
from employees
;

-- ----------------------------------------------------
-- *
-- ----------------------------------------------------
