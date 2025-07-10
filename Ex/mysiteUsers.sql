
show databases;

use web_db;

-- 테이블 조회 
show tables;

-- users 조회 
select  no
		,id
		,password 
        ,name
        ,gender
from users
;

-- !!!테이블 삭제!!! --------------------------------------------
drop table users;


-- 테이블 등록
-- users 테이블
create table users(
	no			integer 			primary key		auto_increment
    ,id			varchar(20) 		unique			not null
    ,password	varchar(20)			not null
    ,name		varchar(20)
    ,gender 	varchar(10)			-- male female
);

-- 등록 
insert into users
values(null, 'aaa', '123', '강수빈', '여');

-- 삭제 
delete from users
where no = 4
;

-- 수정
update users
set id = ?
	,password = ?
    ,name = ?
    ,gender = ?
where no = ?
;

-- 로그인 
select *
from users
where id = 'aaa'
and password = '123'
;


-- users 전체 조회 
select  no
		,id
		,password 
        ,name
        ,gender
from users
;

-- 로그인
select  no
		,id
		,password 
        ,name
        ,gender
from users
where id = ''
and password = ''
;

-- 회원정보 수정폼
select  no
        ,id
        ,password
        ,name
        ,gender
from users
where no = 1
;