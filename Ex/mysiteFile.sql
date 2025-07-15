
show databases;

use web_db;

-- 테이블 조회 
show tables;

-- file 조회 
select  *
from files
;

-- !!!테이블 삭제!!! --------------------------------------------
drop table files;


-- 테이블 등록
-- file 테이블
create table files(
	no			int					primary key		auto_increment
	,org_name	varchar(200)		not null
    ,ex_name	varchar(20)			not null
    ,save_name	varchar(500)		not null
    ,file_path	varchar(500)	 	not null
    ,file_size 	bigint				not null
);

-- ----------------------------------------------
-- files 전체 조회
select  no
		,org_name
        ,ex_name
        ,save_name
        ,file_path
        ,file_size
from files
;

-- 등록 
insert into files
values();

-- 삭제 
delete from files
where no = ?
;

-- 수정 

