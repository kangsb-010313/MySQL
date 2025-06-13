-- 혼합 SQL 문제입니다.
/*
문제1.
담당 매니저가 배정되어있으나 커미션비율이 없고, 월급이 3000초과인 직원의 
이름, 매니저아이디, 커미션 비율, 월급 을 출력하세요.
(45건)
*/
select  first_name
		,manager_id
        ,commission_pct
        ,salary
from employees
where manager_id is not null
and commission_pct is null
and salary > 3000
;

/*
문제2. 
각 부서별로 최고의 월급을 받는 사원의 직원번호(employee_id), 이름(first_name), 월급 (salary), 
입사일(hire_date), 전화번호(phone_number), 부서번호(department_id) 를 조회하세요 
-조건절비교 방법으로 작성하세요
-월급의 내림차순으로 정렬하세요
-입사일은 2001-01-13 토요일 형식으로 출력합니다.
-전화번호는 515-123-4567 형식으로 출력합니다.
(11건)
*/
-- 각 부서별 최고 월급
select  department_id
		,max(salary)
from employees
group by department_id
order by max(salary) desc
;

select  employee_id
		,first_name
        ,salary
        ,concat(
				date_format(hire_date, '%Y-%m-%d ')
				,CASE date_format(hire_date, '%w') 
					 WHEN '0' THEN '일요일'
					 WHEN '1' THEN '월요일'
                     WHEN '2' THEN '화요일'
                     WHEN '3' THEN '수요일'
                     WHEN '4' THEN '목요일'
                     WHEN '5' THEN '금요일'
                     WHEN '6' THEN '토요일'
				 END
                ) as 'hire_date'
        ,replace(phone_number, '.', '-') as 'phone_number'
        ,department_id
from employees
where salary in(select  max(salary)
				from employees
				group by department_id)
order by salary desc
;

/*
문제3
매니저별 담당직원들의 평균월급 최소월급 최대월급을 알아보려고 한다.
-통계대상(직원)은 2005년 이후(2005년 1월 1일 ~ 현재)의 입사자 입니다.
-매니저별 평균월급이 5000이상만 출력합니다.
-매니저별 평균월급의 내림차순으로 출력합니다.
-매니저별 평균월급은 소수점 첫째자리에서 반올림 합니다.
-출력내용은 매니저아이디, 매니저이름(first_name), 매니저별평균월급, 매니저별최소월급, 매니저별최대월급 입니다.
(9건)
*/
select  manager_id
		,round(avg(salary), 0) avgSalary
        ,min(salary) minSalary
        ,max(salary) maxSalary
from employees
where hire_date >= '2005-01-01'
group by manager_id
having avg(salary) >= 5000
; 

-- 
select  m.manager_id
		,e.first_name
        ,m.avgSalary
        ,m.minSalary
        ,m.maxSalary
from employees e,(select  manager_id
						  ,round(avg(salary), 0) avgSalary
						  ,min(salary) minSalary
						  ,max(salary) maxSalary
				  from employees
				  where hire_date >= '2005-01-01'
				  group by manager_id
				  having avg(salary) >= 5000) m
where e.employee_id = m.manager_id
;


/*
문제4.
각 사원(employee)에 대해서 사번(employee_id), 이름(first_name),
부서명(department_name), 매니저(manager)의 이름(first_name)을 조회하세요.
부서가 없는 직원(Kimberely)은 표시 합니다.
매니저가 없는 직원(Steven) 은 출력하지 않습니다.
(106명)
(106명)
*/



/*
문제5.
2005년 이후 입사한 직원중에 입사일이 11번째에서 20번째의 직원의 
사번, 이름, 부서명, 월급, 입사일을 입사일 순서로 출력하세요
*/
select  employee_id
		,first_name
        ,salary
        ,hire_date
from employees
where hire_date >= '2005/01/01'
limit 10,10
;


/*
문제6.
가장 늦게 입사한 직원의 이름(first_name last_name)과 월급(salary)과 근무하는 부서 이름(department_name)은?
*/
-- 가장 늦은 입사일
select max(hire_date)
from employees
;

-- 합치기 
select  concat(e.first_name, e.last_name) name
        ,e.salary
        ,d.department_name
        ,e.hire_date
from employees e, departments d
where e.department_id = d.department_id
and e.hire_date = (select max(hire_date)
				 from employees)
;


/*
문제7.
평균월급(salary)이 가장 높은 부서 직원들의 직원번호(employee_id), 이름(firt_name), 성(last_name)과  업무(job_title), 월급(salary)을 조회하시오.
*/
-- 부서별 평균월급
select avg(salary)
from employees
group by department_id
;

-- 

/*
문제8.
평균 월급(salary)이 가장 높은 부서명과 월급은? (limt사용하지 말고 그룹함수 사용할 것)
*/


/*
문제9.
평균 월급(salary)이 가장 높은 지역과 평균월급은?( limt사용하지 말고 그룹함수 사용할 것)
*/



/*
문제10.
평균 월급(salary)이 가장 높은 업무와 평균월급은? (limt사용하지 말고 그룹함수 사용할 것)
*/


