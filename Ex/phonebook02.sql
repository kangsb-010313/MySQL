######################################
# phonebook 만들기
######################################

-- -----------------------------------------------------
# phonebook 계정에서 실행
-- -----------------------------------------------------

-- db 조회 ----------------------------------------------
show databases;
-- db 선택 ----------------------------------------------
use phonebook_db;


-- !!!테이블 삭제!!! --------------------------------------------
drop table person;


-- *테이블 생성 --------------------------------------------
create table person(
	person_id	integer			primary key		auto_increment
    ,name 		varchar(30)		not null
    ,hp			varchar(20)	
	,company	varchar(20)
);

-- 테이블 조회 --------------------------------------------
select  person_id
		,name
        ,hp
        ,company
from person
order by person_id desc
;

-- 등록
insert into person
values(null, '강호동', '010-1111-1111', '02-1111-1111')
;

insert into person
values(null, '정우성', '010-1111-1111', '02-1111-1111')
;

insert into person
values(null, '테스트이름', '010-1234-5678', '02-123-4567')
;

-- 수정
update person
set name = '송은석'
	,hp = '010-3333-3333'
    ,company = '02-3333-3333'
where person_id = 3
;

-- 삭제
delete from person
where person_id = 3
;

