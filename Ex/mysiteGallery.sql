
show databases;

use web_db;

-- 테이블 조회 
show tables;

-- file 조회 
select  *
from gallery
;

-- !!!테이블 삭제!!! --------------------------------------------
drop table gallery;


-- 테이블 등록
-- file 테이블
create table gallery(
	no			int					primary key		auto_increment
	,user_no 	int
    ,content	varchar(1000)		
    ,filePath	varchar(500)
    ,orgName	varchar(200)
    ,saveName	varchar(500)
    ,fileSize	int
    ,constraint gallery_fk foreign key(user_no)
    references users(no)
);

-- ----------------------------------------------
-- files 전체 조회
select  no
		,user_no
        ,content
        ,filePath
        ,orgName
        ,saveName
        ,fileSize
from gallery
;

-- 등록 
insert into gallery
values();

-- 삭제 
delete from gallery
where no = ?
;

-- 수정 

