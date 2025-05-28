/*****************************************
*join
*****************************************/
-- 기본 ------------------------------------------------------------------------------
-- 직원의 이름과 직원이 속한 부서명을 출력하세요
-- Steven	90  90  Executive
-- 카디젼 프로덕트 모든 경우의 수의 갯수가 된다
-- 107*27=2889건 (원하는게 아니다 107개)
-- where을 안 쓸 시 스티븐 27개 정보가 뜸 :  두 테이블의 행들의 가능한 모든 쌍이 추출됨 (107*27=2889) 
select  first_name
		,department_name
from employees, departments
;

-- where 절 사용 : 106개 / PK, FK ------------------------------------------------------
select  first_name
		,department_name
from employees, departments
where employees.department_id = departments.department_id -- 꼭 사용
;
/*
select  count(*)
from employees -- 107
;
select count(*)
from departments -- 27
;
*/


-- --------------------------------------
-- *inner join(equi Join) 
-- --------------------------------------

-- 기본 문법 ------------------------------------------------------
-- 직원의 이름과 직원이 속한 부서명을 출력하세요
select  first_name
		,employees.department_id -- department_id 만 쓰면 오류남 
		,departments.department_id 
from employees inner join departments
on employees.department_id = departments.department_id
;

-- 별명 짓기 ------------------------------------------------------
select  e.first_name
		,e.department_id
		,d.department_id
		,d.department_name
from employees e inner join departments d -- 이름 줄이기(?)
on e.department_id = d.department_id
;

-- inner join (equi join)약식표현 where절 사용 : (많이 사용함) ------------------------------------------------------
select  e.first_name
		,e.department_id
		,d.department_id
		,d.department_name
from employees e, departments d
where e.department_id = d.department_id
;

select count(*) from employees; -- 107

select count(*) from departments; -- 27

select count(*) from locations; -- 23

-- ----------------------------------------
-- 여러개 테이블을 조인할 때 ------------------------------------------------------
/*

107 	27 		23
이름		부서명 	부서도시
steven  
neena
...
david  IT 		southlake
106개 (null이 빠져서)
*/
-- ----------------------------------------
select  e.first_name
		,d.department_name
		,l.city
from employees e, departments d, locations l
where e.department_id = d.department_id 
and d.location_id = l.location_id
;

-- 위 문제 inner join (equi join) 정식표현  ------------------------------------------------------
select  e.first_name
		,d.department_name
		,l.city
		,l.location_id -- 다른테이블과 겹치기 때문에 앞에 꼭 어디꺼인지 붙여줘야함
        ,d.location_id
from employees e 
inner join departments d -- inner 생략 가능
		on e.department_id = d.department_id
inner join locations l
		on d.location_id = l.location_id
;

-- 모든 직원이름, 부서이름, 업무명을 출력하세요 ------------------------------------------------------
-- inner join where절
select  e.first_name
		,d.department_name
		,j.job_title
from employees e, departments d, jobs j
where e.department_id = d.department_id
and e.job_id = j.job_id
;
-- inner join 정식표현
select  e.first_name
		,d.department_name
        ,j.job_id
from employees e
inner join departments d
		on e.department_id = d.department_id
inner join jobs j 
		on e.job_id = j.job_id
;

-- --------------------------------------
-- *outer join
-- --------------------------------------

-- *left outer join ----------------------------------------------------------------------
-- 왼쪽 테이블을 기준, 기준테이블의 정보는 다 보여줌
-- Kimberely(소속 부서가 없는 직원)가 결과에 있어야 함
select  e.first_name
		,d.department_name
        ,e.department_id
        ,d.department_id
from employees e
left outer join departments d -- 왼쪽 테이블을 기준으로 (null버리지 말자)
	on e.department_id = d.department_id -- 107개
;

-- *right outer join ----------------------------------------------------------------------
-- • 모든 직원의 부서번호, 이름, 부서번호를 출력하세요
-- • 직원이 없는 부서도 표시 (오른쪽 기준으로 했기 때문에 Kimberely는 결과에 없다)
select  e.first_name
		,d.department_id
        ,d.department_name
from employees e 
right outer join departments d
	on e.department_id = d.department_id 
;

-- *right outer join -> left outer join ---------------------------------------
select  e.first_name
        ,d.department_name
        ,e.department_id ed
		,d.department_id dd
from departments d
left outer join employees e
	on d.department_id = e.department_id
;

-- *union : full outer join---------------------------------------------------
-- 중복 한 번만 적용
-- 컬럼명과 갯수가 같아야함 
(-- left join : 왼쪽 기준
select  e.employee_id
		,first_name
		,d.department_id
        ,d.department_name
from employees e
left outer join departments d
	on e.department_id = d.department_id
)
union -- 한 번에 쭉 짜지 않고 왼 오 각자 짠 후 테스트 해보고 합쳐서 많이 짬
(-- right join : 오른쪽 기준
select   e.employee_id
		,e.first_name
		,d.department_id
        ,d.department_name
from employees e
right outer join departments d
	on e.department_id = d.department_id
);


-- *self join -------------------------------------------------------------------
-- 테이블에서 자신의 pk를 fk로 가지고 있는 경우
-- 같은 테이블을 두 번 불러와서 써야되는 경우 
-- 두 번 불러와서 별명을 다르게 준다 (꼭 별명을 주어야 함)
select  *
from employees e, employees m
;
-- ---------------------------------------------
select  e.employee_id
		,e.first_name
		,e.phone_number
        ,m.employee_id m_id
        ,m.first_name m_first_name
        ,m.phone_number m_phone_number
from employees e, employees m
where e.manager_id = m.employee_id
;

-- 잘못된 join -------------------------------------------------------------------
-- 아무 의미 없는 데이터가 연결이 되는 경우 
-- 아무 컬럼이나 where에 사용하면 안됨
-- 월급과 도시는 아무런 관계가 없음
select  *
from employees e, locations l
where e.salary = l.location_id
;



-- ------------------------------------------------------------------------------
# 조인 연습(equi join, inner join 두가지로 풀어볼것)
-- 직원아이디, 이름, 월급, 부서아이디, 부서명, 도시아이디, 도시명
select  e.employee_id
		,e.first_name
        ,e.salary
        ,d.department_id
        ,d.department_name
        ,l.location_id
        ,l.city
from employees e, departments d, locations l
where  e.department_id = d.department_id
and d.location_id = l.location_id
;

select  e.employee_id
		,e.first_name
        ,e.salary
        ,d.department_id
        ,d.department_name
        ,l.location_id
        ,l.city
from employees e 
inner join departments d 
	on e.department_id = d.department_id
inner join locations l
	on d.location_id = l.location_id
;
   
-- 직원아이디, 이름, 월급, 부서아이디, 부서명, 도시아이디, 도시명, 나라아이디, 나라명
select  e.employee_id
		,e.first_name
		,e.salary
        ,d.department_id
        ,d.department_name
        ,l.location_id
        ,l.city
        ,c.country_id
        ,c.country_name
from employees e, departments d, locations l, countries c
where e.department_id = d.department_id
and d.location_id = l.location_id
and l.country_id = c.country_id
;

select  e.employee_id
		,e.first_name
        ,e.salary
        ,d.department_id
        ,d.department_name
        ,l.location_id
        ,l.city
        ,c.country_id
        ,c.country_name
from employees e 
inner join departments d
	on e.department_id = d.department_id
inner join locations l 
	on d.location_id = l.location_id
inner join countries c
	on l.country_id = c.country_id
;

-- 직원아이디, 이름, 월급, 부서아이디, 부서명, 도시아이디, 도시명, 나라아이디, 나라명, 지역아이디, 지역명
select  e.employee_id
		,e.first_name
        ,e.salary
        ,d.department_id
        ,d.department_name
        ,l.location_id
        ,l.city
        ,c.country_id
        ,c.country_name
        ,r.region_id
        ,r.region_name
from employees e, departments d, locations l, countries c, regions r
where e.department_id = d.department_id
and d.location_id = l.location_id
and l.country_id = c.country_id
and c.region_id = r.region_id 
;

select  e.employee_id
		,e.first_name
        ,e.salary
        ,d.department_id
        ,d.department_name
        ,l.location_id
        ,l.city
        ,c.country_id
        ,c.country_name
        ,r.region_id
        ,r.region_name
from employees e 
inner join departments d
	on e.department_id = d.department_id
inner join locations l 
	on d.location_id = l.location_id
inner join countries c
	on l.country_id = c.country_id
inner join regions r
	on c.region_id = r.region_id
;



