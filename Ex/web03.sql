-- ---------------------------------------------
-- web 계정 03
-- ---------------------------------------------

-- 테이블 계정 삭제
drop table author;
drop table book;

-- 테이블 조회
show tables;

-- 작가 테이블 생성
create table author(
	author_id		int				primary key		auto_increment -- 삭제 후 다시 만들어도 1부터 안됨
    ,author_name	varchar(100)	not null
    ,author_desc	varchar(500)
);






















