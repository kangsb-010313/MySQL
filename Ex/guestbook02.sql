######################################
# guestbook 만들기
######################################

-- -----------------------------------------------------
# guestbook 계정에서 실행
-- -----------------------------------------------------

-- db 조회 ----------------------------------------------
show databases;
-- db 선택 ----------------------------------------------
use guestbook_db;


-- !!!테이블 삭제!!! --------------------------------------------
drop table guestbook;


-- *테이블 생성 --------------------------------------------
create table guestbook(
	no			integer 	primary key		auto_increment
    ,name		varchar(80)		
    ,password	varchar(20)
    ,content 	text
    ,reg_date 	datetime
);

-- 테이블 조회 --------------------------------------------
select *
from guestbook
;

-- 등록
insert into guestbook
values(null, '강수빈', '1313', '안녕하시렵니까', now())
;

insert into guestbook(name, password, content, reg_date)
values('강수빈', '1111', '안녕하수꽈', now())
;


-- 수정
update guestbook
set name = '정성찬'
	,password = '1234'
    ,content = '하이염'
    ,reg_date = now()
where no = ?
;


-- 삭제
delete from guestbook
where no = ?
;

