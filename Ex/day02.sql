/*********************************
selcet 문(조회) 
*********************************/

-- --------------------------------------
-- where 절 
-- --------------------------------------

-- *비교 연산자-----------------------------
-- 부서아이디가 30인 사원의 이름과 부서번호를 구하시오
select  first_name
		,department_id
from employees
where department_id <> 30;	-- 	=, >, <, >=, <=, != <> 

-- 월급이 15000 이상인 사원들의 이름과 월급을 출력하세요
select  concat(first_name, ' ' , last_name) as 이름
		,salary as 월급
from employees
where salary >= 15000; 

-- 07/01/01 일 이후에 입사한 사원들의 이름과 입사일을 출력하세요
select  concat(first_name, ' ', last_name) as 이름
		,hire_date 입사일 
from employees
where hire_date >= '07/01/01';
/*
-- 특정기준일을 0 으로 해서 숫자로 관리한다
1700-01-01 00:00:00		0	--> 1700/01/01 00:00:00
1700-01-01 00:00:01		1	
1700-01-01 00:00:02		2	
1700-01-01 00:01:00		60

2025-05-23 00:00:00		231321321312
*/

-- *binary-----------------------------
-- 이름이 Lex인 직원의 이름과 월급을 출력하세요 
select  first_name 이름
		,salary 월급
from employees
where first_name = 'lEx'; -- 대소문자를 구별하지 않음 

-- 비교
select  first_name 이름
		,salary 월급
from employees
where binary first_name = 'lEx'; -- 대소문자를 구별함 
-- 문자열 대소문자를 구별하지 않는다
-- 구별하려면 binary 사용


-- *조건이 2개이상 일때 한꺼번에 조회하기-----------------------------
-- 월급이 14000이상 17000이하인 사원의이름과 월급을 구하시오
-- salary >= 14000 월급이 14000이상
-- salary <= 17000 월급이 17000이하 
-- 두 조건이 모두 만족해야 된다		&& --> and, (|| --> or) 
select *
from employees
where salary >= 14000 and salary <= 17000;
-- 아래처럼 줄바꿈해서 씀 
select  first_name 이름
		,salary 월급
from employees
where salary >= 14000
and salary <= 17000
;  

-- 월급이 14000 이하이거나 17000 이상인 사원의 이름과 월급을 출력하세요
select  first_name 이름
		,salary 월급
from employees
where salary <= 14000
or salary >= 17000
;

-- 입사일이 04/01/01 에서 05/12/31 사이의 사원의 이름과 입사일을 출력하세요
select  first_name 이름
		,hire_date 입사일
from employees
where hire_date >= '04/01/01'
and hire_date <= '05/12/31'
;

-- *BETWEEN 연산자로 특정구간 값 출력하기-----------------------------
-- 월급이 14000이상 17000이하인 사원의이름과 월급을 구하시오
select  first_name 이름
		,salary 월급
from employees
where salary >= 14000 and salary <= 17000
;

-- 조금 더 편한 표현 
-- between 은 두 값이 다 포함일 때만 사용 가능 (미만, 초과 사용 불가)
select  first_name 이름
		,salary 월급
from employees
where salary between 14000 and 17000 -- 작은 값을 앞에, 큰 값을 뒤에
;

-- *IN 연산자로 여러 조건을 검사하기 --> 사이값x -----------------------------
-- Neena, Lex, John 의 이름, 성, 월급을 구하시오
select  first_name 이름
		,last_name 성
        ,salary 월급 
from employees
where first_name = 'neena'
or first_name = 'lex'
or first_name = 'john'
;

-- 비교
select  first_name 이름
		,last_name 성
        ,salary 월급 
from employees
where first_name in('neena', 'lex', 'john') -- 많이 쓰임
;

-- 월급이 2100, 3100, 4100, 5100 인 사원의 이름과 월급을 구하시오
select  first_name
		,salary
from employees
where salary in(2100, 3100, 4100, 5100)
;

-- *Like 연산자로 비슷한것들 모두 찾기 -----------------------------
-- % : 임의의 길이의 문자열(공백 문자 가능)
-- _  : 한글자 길이

-- 이름이 L(대소문자 구분x)로 시작하는 직원의 이름, 성, 월급을 출력하세요
select *
from employees
-- where first_name like 'L%' -- L로 시작하는 모든 first_name --> L로 시작하고 뒤에는 뭐가오든 상관 없다(글자 수 상관없음)
where first_name like 'L___' -- L로 시작하고 뒤에 세글자 인 사람만 찾아
;

-- 이름에 am 을 포함한 사원의 이름과 월급을 출력하세요
select  first_name 이름 
		,salary 월급 
from employees
where first_name like '%am%'
;

-- 이름의 두번째 글자가 a 인 사원의 이름과 월급을 출력하세요
select  first_name 이름
		,salary 월급
from employees
where first_name like '_a%'
;

-- 이름의 네번째 글자가 a 인 사원의 이름을 출력하세요
select  first_name
from employees
where first_name like '___a%'
;

-- 이름이 4글자인 사원중 끝에서 두번째 글자가 a인 사원의 이름을 출력하세요
select first_name
from employees
where first_name like '__a_'
;



