use hr_db;

select *
from employees
;
-- ▪ 도시(locations) 테이블의 모든 내용을 출력해 보세요
select *
from locations
;
-- ▪ 국가(countries) 테이블의 모든 내용을 출력해 보세요
select *
from countries
;
-- ▪ 지역(regions) 테이블의 모든 내용을 출력해 보세요
select *
from regions
;
-- ▪ 업무현황(job_history) 테이블의 모든 내용을 출력해 보세요
select *
from job_history
;
-- ▪ 업무(jobs) 테이블의 모든 내용을 출력해 보세요
select *
from jobs
;

-- --------------------------------------
-- 모든 직원의 직원아이디(employee_id), 이름 (fisrt_name), 성(last_name) 을 출력하세요
select  employee_id
		,first_name
        ,last_name
from employees
;

-- ▪ 모든 직원의 이름(fisrt_name)과 전화번호 입사일 월급을 출력하세요
-- → 컬럼은 한줄에 한개씩 쓴다 
select  first_name
		,phone_number
        ,hire_date
from employees
;
-- ▪ 모든 직원의 이름(first_name)과 성(last_name), 월급, 전화번호, 이메일, 입사일을 출력하세요
select  first_name
		,last_name
        ,salary
        ,phone_number
        ,email
        ,hire_date
from employees
;

-- 직원아이디, 이름, 월급을 출력하세요.
-- 단 직원아이디는 empNO, 이름은 "f-name", 월급은 "월 급" 으로 컬럼명을 출력하세요
select  employee_id empNo
		,first_name 'f-name'
        ,salary '월 급'
from employees
;

-- ▪ 직원의 이름(fisrt_name)과 전화번호, 입사일, 월급 으로 표시되도록 출력하세요
select  first_name 이름
		,phone_number 전화번호
        ,hire_date 입사일
        ,salary 월급
from employees
;
-- ▪ 직원의 직원아이디를 사 번, 이름(first_name), 성(last_name), 월급, 전화번호, 이메일,입사일로 표시되도록 출력하세요 
select  employee_id '사 번'
		,first_name 이름
        ,last_name 성
        ,salary 월급
        ,phone_number 전화번호
        ,email 이메일
        ,hire_date 입사일
from employees
;
/*
▪ 전체직원의 정보를 다음과 같이 출력하세요
성명(first_name last_name)
성과 이름사이에 – 로 구분 ex) William-Gietz
월급
연봉(급여*12)
보너스(급여*12+5000)
전화번호 
*/
select  concat(first_name, '-', last_name) name
		,salary 월급
        ,salary*12 연봉
        ,salary*12+5000 보너스
        ,phone_number 전화번호
from employees
;

-- • 부서번호가 10인 사원의 이름을 구하시오 
select  first_name
		,department_id
from employees
where department_id = 10
;
-- ▪ 월급이 15000 이상인 사원들의 이름과 월급을 출력하세요
select  first_name
		,salary
from employees
where salary >= 15000
;
-- ▪ 07/01/01 일 이후에 입사한 사원들의 이름과 입사일을 출력하세요
select  first_name
		,hire_date
from employees
where hire_date > '07/01/01'
;
-- ▪ 이름이 Lex인 직원의 이름과 월급을 출력하세요
select  first_name
		,salary
from employees
where first_name = 'lex'
;
-- 문자열 대소문자를 구별하지 않는다. 구별하려면 binary 사용 
select  first_name
		,salary
from employees
where binary first_name = 'Lex'
;

-- • 월급이 14000이상 17000이하인 사원의 이름과 월급을 구하시오
select  first_name
		,salary
from employees
where salary >= 14000
and salary <= 17000
;
-- ▪ 월급이 14000 이하이거나 17000 이상인 사원의 이름과 월급을 출력하세요
select  first_name
		,salary
from employees
where salary <= 14000
or salary >= 17000
order by salary desc
;
-- 입사일이 04/01/01 에서 05/12/31 사이의 사원의 이름과 입사일을 출력하세요 
select  first_name
		,hire_date
from employees
where hire_date >= '04/01/01'
and hire_date <= '05/12/31'
;
-- • Neena, Lex, John 의 이름, 성, 월급을 구하시오
select  first_name
		,last_name
        ,salary
from employees
where first_name in('neena', 'lex', 'john')
;
-- 월급이 2100, 3100, 4100, 5100 인 사원의 이름과 월급을 구하시오
select  first_name
		,salary
from employees
where salary in(2100, 3100, 4100, 5100) -- 여러 조건을 검색할 때 in 연산자 
;

-- like 연산자로 비슷한 것들 모두 찾기 
-- • 이름이 L(대소문자 구분x)로 시작하는 직원의 이름, 성, 월급을 출력하세요
select  first_name
		,last_name
        ,salary
from employees
where first_name like 'l%'
;
-- ▪ 이름에 am 을 포함한 사원의 이름과 월급을 출력하세요
select  first_name
		,salary
from employees
where first_name like '%am%'
;
-- ▪ 이름의 두번째 글자가 a 인 사원의 이름과 월급을 출력하세요
select  first_name
		,salary
from employees
where first_name like '_a%'
;
-- ▪ 이름의 네번째 글자가 a 인 사원의 이름을 출력하세요
select  first_name
from employees
where first_name like '___a%'
;
-- 이름이 4글자인 사원중 끝에서 두번째 글자가 a인 사원의 이름을 출력하세요
select  first_name
from employees
where first_name like '__a_'
;
-- ▪ 커미션비율이 있는 사원의 이름과 월급 커미션비율을 출력하세요
select  first_name
		,salary
        ,commission_pct
from employees
where commission_pct is not null
;
-- ▪ 담당매니저가 없고 커미션비율이 없는 직원의 이름과 매니저아이디 커미션 비율을 출력하세요
select  first_name
		,manager_id
        ,commission_pct
from employees
where manager_id is null
and commission_pct is null
;
-- 부서가 없는 직원의 이름과 월급을 출력하세요
select  first_name
		,salary
from employees
where department_id is null
;

-- • 직원의 이름과 월급을 월급이 많은 직원부터 출력하세요
select  first_name
		,salary
from employees
order by salary desc
;
-- • 월급이 9000이상인 직원의 이름과 월급을 월급이 많은 직원부터 출력하세요
select  first_name
		,salary
from employees
where salary >= 9000
order by salary desc
;

-- ▪ 부서번호를 오름차순으로 정렬하고 부서번호, 월급, 이름을 출력하세요
select  department_id
		,salary
        ,first_name
from employees
order by department_id asc
;
-- ▪ 월급이 10000 이상인 직원의 이름 월급을 월급이 큰직원부터 출력하세요
select  first_name
		,salary
from employees
where salary >= 10000
order by salary desc
;
-- ▪ 부서번호를 오름차순으로 정렬하고 부서번호가 같으면 월급이 높은 사람부터 부서번호 월급 이름을 출력하세요
select  department_id
		,salary
        ,first_name
from employees
order by department_id asc, salary desc
;
-- ▪ 직원의 이름, 급여, 입사일을 이름의 알파벳 올림차순으로 출력하세요
select  first_name
		,salary
        ,hire_date
from employees
order by first_name asc
;
-- 직원의 이름, 급여, 입사일을 입사일이 빠른 사람 부터 출력하세요
select  first_name
		,salary
        ,hire_date
from employees
order by hire_date asc
;
