######################################
# board 만들기
######################################

-- -----------------------------------------------------
# web 계정에서 실행
-- -----------------------------------------------------

-- db 조회 ----------------------------------------------
show databases;
-- db 선택 ----------------------------------------------
use web_db;

show tables;


-- !!!테이블 삭제!!! --------------------------------------------
drop table board;


-- *테이블 생성 --------------------------------------------
create table board(
	no			integer 		primary key		auto_increment
	,user_no 	integer		
    ,title		varchar(500)	not null
    ,content	text
    ,hit		integer
    ,reg_date 	datetime		not null
    ,constraint board_fk foreign key(user_no)
    references users(no)
);

-- 테이블 조회 --------------------------------------------
-- 전체 조회
select  b.no
        ,b.title
        ,b.content
        ,b.hit
        ,date_format(b.reg_date, "%Y-%m-%d") regDate
        ,u.no userNo
        ,u.name userName
from users u, board b
where u.no = b.user_no
;

-- board 조회
select  no
		,user_no as userNo
        ,title
        ,content
        ,hit
        ,reg_date as regDate
from board
;

-- users조회 
select *
from users
;

-- 등록
insert into board
values(null, 30, '첫번째 게시물제목', '첫번재 게시물내용', 0, now())
;

insert into board
values(null, 31, '두번째 게시물제목', '두번재 게시물내용', 0, now())
;

insert into board
values(null, '이찬영', '3333', 'Hi~ 에이치아이~', now())
;


insert into board(name, password, content, reg_date)
values('강수빈', '1111', '안녕하수꽈', now())
;

insert into board(name, password, content)
values('이름', '비밀번호', '내용')
;

-- 수정
update board
set 
where no = ?
;



-- 삭제
delete from board
where no = 4
;

