
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
drop table author;


-- 테이블 등록
-- users 테이블
create table users(
	no			integer 			primary key		auto_increment
    ,id			varchar(20) 		unique			not null
    ,password	varchar(20)			not null
    ,name		varchar(20)
    ,gender 	varchar(10)
);

-- 등록 
insert into users
values(null, 'aaa', '1234', '강수빈', '여');

-- 삭제 
delete from users
where no = 3
;

-- 수정
update users
set id = ?
	,password = ?
    ,name = ?
    ,gender = ?
where no = ?
;

-- 전체 조회
select *
from users
;