-- ---------------------------------------------
-- web 계정 복습
-- ---------------------------------------------

-- web 계정으로 로그인

-- web 사용가능한 데이터베이스 조회
show databases;

-- web_db 선택
use web_db;

-- 테이블 조회
show tables;

-- 테이블 삭제
drop table book;
drop table author;


-- 테이블 생성
-- 작가 테이블
create table author(
	author_id 		int 			primary key
    ,author_name 	varchar(100) 	not null 
    ,author_desc 	varchar(500) 	
);
-- 북 테이블
create table book(
	book_id		int 			primary key
    ,title		varchar(100) 	not null
    ,author		varchar(100)
    ,pub_date	datetime
);

-- insert 문
-- author 데이터 입력
-- insert into author(컬럼명)values(값); -- > 값을 full로 다 쓸거면 컬럼명 생략 가능
insert into author(author_id, author_name, author_desc)
values(1, '이문열', '서울');

-- 컬럼명을 생략하면 테이블 기본 구조로 적용된다
insert into author
values(2, '정성찬', '서울');

-- 기본은 컬럼명의 순서와 갯수가 동일하게 데이터를 입력해야한다
insert into author
values(3, '유재석', ''); -- 가짜데이터 넣기

-- 데이터를 넣지 않고 싶을때는 null로 표기한다 
insert into author
values(4, '이효리', null);

insert into author(author_id, author_name)
values(5, '박원빈');

insert into author(author_id, author_desc) -- 오류
values(6, '농구선수'); -- author_name에 데이터가 꼭 있어야함 (not null로 만들어서)

-- author 데이터 조회
select *
from author
;








