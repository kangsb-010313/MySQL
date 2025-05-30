-- ----------------------------------------------------
-- *SubQuery
-- ----------------------------------------------------
-- 하나의 SQL 질의문 속에 다른 SQL 질의문이 포함되어 있는 형태

-- 단일행 SubQuery 연산자 : = , > , >=, < , <=, !=(같지않다),<>(같지않다) -------------------------------------
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
-- 가장적은 월급 min(), 그룹함수라서 이름..하고 같이 사용할수 없다
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

-- !!! 절대로 한 번에 작성하지 않는다 오해하지 말자!!!
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
order by salary desc
;

-- 부서번호가 110인 직원의 월급와 같은 월급을 받는 모든 직원의 사번, 이름, 월급를 출력하세요 ----------------------------------
-- 1)부서번호가 110인 직원의 월급 
select  salary
from employees
where department_id = 110
;

-- 2)where 절로 구하기, or 조건절이 여러개
select  employee_id
		,first_name
        ,salary
from employees
where salary = 12008.00
or salary = 8300
;
-- 2-1) in() 구하기
select  employee_id
		,first_name
        ,salary
from employees
where salary in (12008.00, 8300)
;
-- 합치기
-- 다중행 SubQuery 연산자 : ANY, ALL, IN… --------------------------------------------------
-- in 
select  employee_id
		,first_name
        ,salary
from employees
where salary in (select salary -- 다중행 in 
				 from employees
				 where department_id = 110)
;

-- 각 부서별로 최고급여를 받는 사원의 이름과 월급을 출력하세요 ------------------------------------------
-- 1)각 부서별 최고 급여 --> 이름 출력 안됨
select  department_id
		,max(salary)
from employees
group by department_id
;
-- 2)각 부서별 최고급여를 받는 사람 이름 출력
-- 2-1) where절
select  first_name
		,department_id
		,salary
from employees
where (department_id = 10 and salary = 4400)
or (department_id = 20 and salary = 13000)
or (department_id = 30 and salary = 11000)
-- ...
;

-- 2-2) in() --> 비교값이 2개 이상
select  first_name
		,department_id
		,salary
from employees
where (department_id, salary) in ((10,4400), (20, 13000), (30,11000))
;


-- 3) 합치기 		2-2 사용
select  first_name
		,department_id
		,salary
from employees							-- 1식
where (department_id, salary) in (select  department_id
										  ,max(salary)
								  from employees
								  group by department_id)
;

-- 부서번호가 110인 직원의 월급 중 -------------------------------------------------------------
-- 가장 작은 월급 보다 월급이 많은 모든 직원의
-- 이름, 급여를 출력하세요.(or연산--> 8300보다 큰) 

-- 1) 부서번호가 110인 직원의 월급 (8300, 12008)
select salary
from employees
where department_id = 110
; 

-- 2) 8300 보다 월급이 많은 모든 직원 (8300보다 많은 또는 12008보다 많은)
-- 2-1) where 절 
select  *
from employees
where salary >= 8300
or salary >= 12008
;
-- 2-2) any() where절이 or일 때
select  *
from employees
where salary >=any (8300, 12008) 
;

-- 3) 합치기
-- or --> any 		?또는 ? 또는 ? 역할
select  first_name
		,salary
from employees
where salary >=any (select  salary
					from employees
					where department_id = 110) 
;

-- 부서번호가 110인 직원의 월급 중 ------------------------------------------------------------
-- 가장 많은 월급 보다 월급이 많은 모든 직원의
-- 이름, 급여를 출력하세요.(and연산--> 12008보다 큰)

-- 부서번호가 110인 직원의 월급
select  first_name
		,salary
from employees
where department_id = 110
;

-- 2)부서번호 110의 직원의 월급 중 가장 높은 월급보다 월급이 높은 직원 
-- 2-1) where절로 표현
select  first_name
		,salary
from employees
where salary > 8300
and salary > 12008
;
-- 2-2) all() 표현 -- 의미만 
select *
from employees
-- where salary >all (8300, 12008) --> 의미만 이해하기
;

-- 합치기 -> 2-2) 사용
select  first_name
		,salary
from employees
where salary >all (select  salary
				   from employees
				   where department_id = 110)
;

-- ------------------------------------------------
# *SubQuery   where절 vs 테이블
-- ------------------------------------------------
-- #where절로 해결

-- 각 부서별로 최고월급을 받는 사원의 부서번호, 직원번호, 이름, 월급을 출력하세요
-- 1) 각 부서별 최고월급	(리스트)
select  department_id
		,max(salary)
from employees
group by department_id
order by department_id asc -- > 확인용
;

-- 2-1)where절 
select *
from employees
where department_id = 10 and salary = 4400
or department_id = 30 and salary = 11000
;
-- 2-2) in(), any(), all()
select *
from employees
where (department_id, salary) in((10,440), (30, 11000)) 
;

-- 3) 합치기
select  department_id
		,employee_id
        ,first_name
        ,salary
from employees
where (department_id, salary) in (select  department_id
										  ,max(salary)
								  from employees
								  group by department_id)
-- 정렬하고 싶으면 (일 다 끝내고)맨 끝에다가 하기 
order by department_id asc
;

/*
select  *
from 테이블명
where 컬럼명 in (서브커리 결과)
*/
-- -----------------------------------------------------------


-- 각 부서별로 최고월급을 받는 사원의 부서번호, 직원번호, 이름, 월급을 출력하세요
-- #테이블로 해결

-- 1) 각 부서별 최고월급 데이터가 있는 테이블이 있다면 구할 수 있다
--    --> 이부분은 아디디어가 필요함(어려울 수있으므로 지금 생각이 안난다면 넘어가자)
--    --> 단 테이블 조인으로 해결할 수 있다 는 믿고가자
select  department_id,
		max(salary) maxSalary   -- 별명을 왜 주었는지 생각해 볼것
from employees
group by department_id
; 
/*결과 일부
(10, 4400)
(20, 13000)
(30, 11000)
*/

-- 2) 전체구조
select employee_id,
	   department_id,
	   first_name,
	   salary
from employees e,  가상의테이블 s
where e.department_id = s.department_id
and e.salary = s.salary
;

-- 3) 합치기      -- 1)번의 결과를 테이블로 사용
select 	e.department_id,
		e.employee_id,
        e.first_name,
		e.salary,
        s.maxSalary
from employees e, (select  department_id,
						   max(salary) maxSalary
				   from employees
				   group by department_id) s 
where e.department_id = s.department_id
and e.salary = s.maxSalary
;


-- ------------------------------------------------
# *limit
-- ------------------------------------------------

-- 직원관리 페이지  ---------------------------------------------------------
-- 사번이 작은 직원이 위쪽에 출력(요구사항에 있었음)
-- > 자동으로 정렬되더라도(믿으면 안됨) 꼭 order by 절로 정렬해줘야함
-- *1페이지의 데이터만 가져오기(1페이지에 5개)
/*
(0, 5)  --> 1번부터 5개 
(5, 10)  --> 6번부터 5개  
(10, 10)  --> 11번부터 5개  
*/ 
select  employee_id
		,first_name
        ,salary
from employees
order by employee_id asc 
limit 0,5 			-- 1번째부터 5개
;
select  employee_id
		,first_name
        ,salary
from employees
order by employee_id asc 
limit 5,5 			-- 6번째부터 5개 
;
select  employee_id
		,first_name
        ,salary
from employees
order by employee_id asc 
limit 10,5			 -- 10번째부터 5개 
;
-- 0 생략 ---------------------------------------------------------
select  employee_id
		,first_name
        ,salary
from employees
order by employee_id asc 
limit 7			-- 처음부터 7개
;

-- 다른표현 limit offset --------------------------------------------
select  employee_id
		,first_name
        ,salary
from employees
order by employee_id asc 
limit 5 offset 0 -- 1번째부터 5개
;
select 	employee_id,
		first_name,
        salary
from employees
order by employee_id asc
limit 5 offset 5      -- 6번째부터 5개
;
select  employee_id
		,first_name
        ,salary
from employees
order by employee_id asc 
limit 5 offset 10 -- 11번째부터 5개 
;

-- 07년에 입사한 직원중 급여가 많은 직원중 3에서 7등의 이름 급여 입사일은? --------------------------------------
-- 2007년 입사자만 조회 
select  *
from employees
where hire_date >= '07/01/01'
and hire_date <= '07/12/31'
;
-- 월급이 큰 사람부터 내림차순 정렬 
select  *
from employees
where hire_date >= '07/01/01'
and hire_date <= '07/12/31'
order by salary desc
;
-- 3번째(~7번째)부터 5명 출력
select  *
from employees
where hire_date >= '07/01/01'
and hire_date <= '07/12/31'
order by salary desc
limit 2,5
;
-- 출력 컬럼 결정 
select  first_name
		,salary
        ,hire_date
from employees
where hire_date >= '07/01/01'
and hire_date <= '07/12/31'
order by salary desc
limit 2,5
;

-- 2007년도 출력하는 방법들 -------------------------------------------
-- 1) 원래 하던거
select  *
from employees
where hire_date >= '07/01/01'
and hire_date <= '07/12/31'
order by salary desc
;
-- 2) between and
select  first_name
        ,hire_date
from employees
where hire_date between '2007-01-01' and '2007-12-31'
order by hire_date asc
;
-- 3) date_format
select  first_name
        ,date_format(hire_date, '%Y')
from employees
where date_format(hire_date, '%Y') = '2007' -- 1907과 겹치는 오류가 있을 수 있으니 %Y로 출력
order by hire_date desc
;


-- 부서번호가 100인 직원 중 급여를 가장 많이 받은 직원의 이름, 급여, 부서번호를 출력하세요 --------------------------------------
select  max(salary)
from employees
where department_id = 100
;
select  first_name
		,salary
        ,department_id
from employees
where salary = (select max(salary)
				from employees
				where department_id = 100) 
and department_id = 100
;
-- limit 사용으로 위 문제 풀기 : order by가 데이터를 많이 잡아먹기 때문에 좋은 방법은 아님 --------------------------------
select  first_name
		,salary
        ,department_id
from employees
where department_id = 100
order by salary desc
limit 0, 1
;

