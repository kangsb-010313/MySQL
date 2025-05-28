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
-- • 직원이 없는 부서도 표시 (오른쪽 기준으로 했기 때문에 Kimberely는 빠짐)
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









select *
from employees
;
-- --------------------------------------
-- *
-- --------------------------------------


