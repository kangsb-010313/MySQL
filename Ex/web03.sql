-- ----------------------------------------------------
-- web 계정 - 03  fk
-- ----------------------------------------------------

-- 테이블 계정 삭제 --------------------------------------------
-- 작가 테이블 삭제 
drop table author;
-- 북 테이블 삭제
drop table book;


-- 테이블 리스트 조회 -------------------------------------------
show tables;

-- 테이블 생성 ------------------------------------------------
-- 북 테이블 생성
create table book(
	book_id		int 			primary key		auto_increment
    ,title		varchar(100) 	not null
    ,pubs		varchar(100)
    ,pub_date	datetime
    ,author_id 	int
    ,constraint book_fk foreign key(author_id)
    references author(author_id)
);

/*
- ON DELETE CASCADE: 해당하는 FK를 가진 참조행도 삭제
- ON DELETE SET NULL: 해당하는 FK를 NULL로 바꿈
*/

-- 작가 테이블 생성
create table author(
	author_id		int				primary key		auto_increment -- 삭제 후 다시 만들어도 1부터 안됨
    ,author_name	varchar(100)	not null
    ,author_desc	varchar(500)
);

-- insert -> 테이블 데이터 입력 -----------------------------------------------------
-- 작가 테이블 데이터 조회 
select *
from author
;
-- 작가 데이터 입력
insert into author
values(null, '이문열', '경북 영양');
insert into author
values(null, '박경리', '경상남도 통영');

-- -------------------------------------------------------------------------------------

-- 북 테이블 데이터 조회
select *
from book
;
-- 책 데이터 입력
insert into book
values(null, '우리들의 일그러진 영웅', '다림', '1998-02-22', 1); -- 작가 데이터 등록 먼저 해야함 (fk)

insert into book
values(null, '삼국지', '민음사', '2002-03-01', 1);

insert into book
values(null, '토지', '마로니에북스', '2012-08-15', 2);

insert into book
values(null, '유시민의 글쓰기 특강', '생각의길', '2015-04-01', 3); -- 오류 (아직 author에 3 안 만들었음)



-- 전체조회
select * -- 테스트 할 땐 *로 조회해도 되지만, 실전에서는 전체 컬럼명을 써줘야함
from book bo, author au
where bo.author_id = au.author_id
;

-- 전체조회 (실전 코드) 		컬럼명을 모두 명확하게 표기해준다 *사용하지 않는다
select  bo.book_id
		,bo.title
        ,bo.pubs
        ,bo.pub_date
        ,bo.author_id
        ,au.author_id
        ,au.author_name
        ,au.author_desc
from book bo, author au
where bo.author_id = au.author_id
;




-- 데이터 수정 ------------------------------------------------------
-- 경북 영양 -> 서울
update author
set author_desc = '서울'
where author_id = 1
;

-- 데이터 삭제 ------------------------------------------------------
-- 우리들의 일그러진 영웅 책 삭제
delete from book
where book_id = 1
;

-- 작가 박경리 삭제 안됨 	작가 번호 2번을 책(book테이블 데이터)에서 사용하고 있기 때문에 
delete from author
where author_id = 2
;

-- 새로 넣고 삭제 -------------------------
-- 삭제 잘 됨 --> 작가번호 3번을 책(book테이블데이터)에서 사용하고 있지 않음
insert into author
values(null, '정성찬', '라이즈');

delete from author
where author_id = 3
;

/*
DCL 계정만들기, 권한부여 
DDL 데이터베이스관련, 테이블관련
DML 등록 수정 삭제 *조회
*/






