/**********************************
-guestbook
**********************************/

use guestbook_db;

-- !!!테이블 삭제!!! --------------------------------------------
drop table guestbook;


-- *테이블 생성 --------------------------------------------
create table guestbook(
	no			int 		primary key		auto_increment
    ,name		varchar(80)		
    ,password	varchar(20)
    ,content 	text
    ,reg_date 	datetime
);

-- 테이블 전체 조회 --------------------------------------------
select  no 
		,name
        ,password 
        ,content
        ,reg_date
from guestbook
;


-- 데이터 넣기 
insert into guestbook
values(null, '강수빈', '123', '안녕하시렵니까', now())
;

insert into guestbook
values(null, '쇼타로', '123', '곤니찌와~', now())
;


-- 수정
update guestbook
set name = '정성찬'
	,password = '123'
    ,content = '하이염'
    ,reg_date = now()
where no = ?
;

-- 삭제
delete from guestbook
where no = ?
;


