-- 서브쿼리(SUBQUERY) SQL 문제입니다.
/*
문제1.
평균 월급보다 적은 월급을 받는 직원은 몇명인지 구하시요.
(56건)
*/
select  avg(salary)
from employees
;
select count(*)
from employees
where salary < 6461.831776
;

select count(salary)
from employees
where salary < (select  avg(salary)
				from employees)
;

/*
문제2. 
평균월급 이상, 최대월급 이하의 월급을 받는 사원의 
직원번호(employee_id), 이름(first_name), 월급(salary), 평균월급, 최대월급을 월급의 오름차순으로 정렬하여 출력하세요 
(51건)
*/
-- 평균월급, 최대월급 
select  avg(Salary) -- 6461.831776
		,max(salary) -- 24000.00
from employees
;
-- 
select  employee_id
		,first_name
        ,salary
from employees
where salary >= 6461
and salary <= 24000
order by salary asc 
;
-- 
select  employee_id
		,first_name
        ,salary
        ,round((select  avg(Salary)from employees), 0) as avgsalary
        ,(select  max(salary)from employees) as maxsalary
from employees 
where salary >= any (select  avg(Salary)
					from employees)
and salary <=all (select  max(salary)
				  from employees) 
order by salary asc
;

/*
문제3.
직원중 Steven(first_name) king(last_name)이 소속된 부서(departments)가 있는 곳의 주소를 알아보려고 한다.
도시아이디(location_id), 거리명(street_address), 우편번호(postal_code), 도시명(city), 주(state_province), 나라아이디(country_id) 를 출력하세요
(1건)
*/ -- employees, departments, locations
-- Stevenking 소속된 부서
select d.department_name
from employees e, departments d
where e.department_id = d.department_id
and concat(e.first_name, e.last_name) = 'StevenKing'
;
-- Executive 주소 (도시아이디, 거리명, 우편번호, 도시명, 주, 나라아이디)
select  l.location_id
		,l.street_address
        ,l.postal_code
        ,l.city
        ,l.state_province
        ,l.country_id
from departments d, locations l
where d.location_id = l.location_id
and d.department_name = 'Executive'
;
-- 합치기
select  l.location_id
		,l.street_address
        ,l.postal_code
        ,l.city
        ,l.state_province
        ,l.country_id
from departments d, locations l
where d.location_id = l.location_id
and d.department_id =(select e.department_id
						from employees e
						where concat(e.first_name, e.last_name) = 'StevenKing')
;


/*
문제4.
job_id 가 'ST_MAN' 인 직원의 월급보다 작은 직원의 사번,이름,월급을 월급의 내림차순으로 출력하세요('ST_MAN' 직무의 최고급여 보다 작은직원의 의미)
- ANY연산자 사용       
- max()사용하지 말 것
(74건) -- 78건으로 나옴
*/
-- job_id가 'st_man'인 직원의 최대 월급 -- 8500
select  max_salary
from jobs
where job_id = 'st_man'
;
-- 
select  employee_id
		,first_name
        ,salary
from employees
where salary < 8500
order by salary desc
;
-- 
select  employee_id
		,first_name
        ,salary
from employees
where salary <any (select  max_salary
				   from jobs
				   where job_id = 'st_man')
order by salary desc
;

/*
문제5. 
각 부서별로 최고의 월급을 받는 사원의 직원번호(employee_id), 이름(first_name)과 월급(salary) 부서번호(department_id)를 조회하세요 
단 조회결과는 월급의 내림차순으로 정렬되어 나타나야 합니다. 
조건절비교, 테이블조인 2가지 방법으로 작성하세요
(11건)
*/

-- 조건절 비교 ------------------------------------------------------------
-- 부서별 최고월급
select  department_id
		,max(salary)
from employees
group by department_id
;
-- 
select  employee_id
		,first_name
        ,salary
        ,department_id
from employees
where (department_id, salary) in ((90, 24000), (60, 9000), (100, 12008))
;
-- 합치기
select  employee_id
		,first_name
        ,salary
        ,department_id
from employees
where (department_id, salary) in (select  department_id
										  ,max(salary)
								  from employees
								  group by department_id)
order by salary desc
;

-- 테이블 조인 ------------------------------------------------------------
-- 부서별 최고월급 (가상테이블)
select  department_id
		,max(salary)
from employees
group by department_id
;
-- 합치기 
select  e.employee_id
		,e.first_name
        ,e.salary
        ,e.department_id
from employees e
inner join(select  department_id
			 	   ,max(salary) maxSalary
		   from employees
		   group by department_id)d
on e.department_id = d.department_id
and e.salary = d.maxSalary
order by e.salary desc
;


/*
문제6.
각 업무(job) 별로 월급(salary)의 총합을 구하고자 합니다. 
월급 총합이 가장 높은 업무부터 업무명(job_title)과 월급 총합을 조회하시오 
(19건)
*/



/*
문제7.
자신의 부서 평균 월급보다 월급(salary)이 많은 직원의 직원번호(employee_id), 이름(first_name)과 월급(salary)을 조회하세요 
(38건)
*/



/*
문제8.
직원 입사일이 11번째에서 15번째의 직원의 사번, 이름, 월급, 입사일을 입사일 순서로 출력하세요
*/



