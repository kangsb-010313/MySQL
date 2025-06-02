-- ---------------------------------------------
-- web
-- ---------------------------------------------

-- ---------------------------------------------
-- 테이블 만들기
create table book(
	book_id int
    ,title varchar(50)
    ,author varchar(20)
    ,pub_date datetime
);


-- 테이블에 컬럼 추가
alter table book add pub varchar(50); 
-- 테이블에 컬럼 수정
alter table book modify title varchar(100); -- varchar(50) --> varchar(100)
-- 컬럼명 수정
alter table book rename column title to subject;
-- 컬럼 삭제 
alter table book drop author;


-- 테이블 이름 수정
rename table book to article;

-- 테이블 삭제(조심)
drop table article;

select * from article; -- book에서 article로 테이블명 수정함

-- 작가 테이블 만들기 ---------------------------------------------------------------
create table author(
	author_id 		int 			primary key
    ,author_name 	varchar(100) 	not null 
    ,author_desc 	varchar(500) 	
);

-- 작가 데이터 insert -------------------------------------------------------------
-- insert 문 
-- pk가 없다는 가정하에 계속 실행 시 계속 추가됨

/*
insert into author(author_id, author_name, author_desc) -- 명시적 방법
values(1, '박경리', '토지 작가');
*/
insert into author -- 묵시적 방법
values(1, '박경리', '토지 작가');

-- 
insert into author -- 오류
values(2, '이문열'); -- 컬럼 수와 데이터 수가 맞지 않아서 오류 남

insert into author -- 데이터 갯수를 맞춰야 함 
values(2, '이문열', ''); -- 작가 설명에 '' 데이터로 입력한 것임 

insert into author -- 데이터 갯수를 맞춰야 함 
values(6, '송은석', null); -- 작가 설명에 null 데이터로 입력한 것임 
-- 
insert into author
values(3, '강수빈', '수강생');

-- 컬럼명을 표시하면 컬럼명과 일치해야 함
insert into author(author_id, author_name) -- 정상
values(4, '정성찬'); -- author_desc 가 null로 표기됨 

-- 
insert into author(author_id, author_desc) -- 오류 author_name --> not null 비워져있으면 안됨
values(5, '라이즈');						   -- author_name 데이터가 꼭 있어야 한다

-- 
insert into author(author_name, author_desc) -- 오류 author_id --> pk (unique + not null)
values('박원빈', '라이즈');						 -- author_id 데이터가 꼭 있어야 한다 (유니크 해야함)


insert into author(author_desc, author_name, author_id)
values('riize', '이찬영', 5);


-- 
select * 
from author
;

-- ----------------------------------------------------------------
-- 책 테이블 만들기
create table book(
	book_id		int				primary key
    ,title 		varchar(100)	not null
    ,pubs		varchar(100) 	
    ,pub_date 	datetime
);

-- 다양한 insert문으로 데이터 넣어보기
insert into book
values(1, '우리들의 일그러진 영웅', '다림', '1998-02-22');
insert into book(book_id, title, pub_date)
values(2, '삼국지', '2002-03-01');
insert into book
values(3, '토지', '마로니에북스', '2012-08-15');
insert into book
values(4, '유시민의 글쓰기 특강', '생각의길', '2015-04-01');
insert into book
values(5, '패션왕', '중앙북스(books)', '2012-02-22');
insert into book
values(6, '순정만화', '재미주의', '2011-08-03');
insert into book
values(7, '26년', '재미주의', '2012-02-14');

select * 
from book
;





