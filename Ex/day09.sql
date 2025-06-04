show databases;

-- 접속 
use web_db;

-- 조회 
show tables;

-- 테이블 데이터 조회 -----------------------------------
-- 테스트용 
select * from author;



-- 데이터 추가 
insert into author
values(null, '정성찬', '서울')
;
insert into author
values(null, '유재석', '압구정')
;


-- 데이터 삭제 
delete from author
where author_id = 5
;


-- 데이터 수정
update author
set author_name = '박원빈'
	,author_desc = '라이즈'
where author_id = 2
;
-- java 수정 
update author
set author_name = '이찬영'
	,author_desc = '미국'
where author_id = 2
;


-- 실전 데이터 조회
select  author_id as id
		,author_name
        ,author_desc
from author
;



select * from book;
select *
from author a, book b
where a.author_id = b.author_id
;


-- book 과제-------------------------------------------------
select * from book;
select * from book b, author a where b.author_id = a.author_id;

-- book 추가
insert into book
values(null, '토지', '마로니에북스', '2012-08-15', 2);

-- book 삭제 
delete from book
where book_id = 3
;

-- book 데이터 수정
update book
set title = '패션왕'
	,pubs = '중앙북스(books)'
    ,pub_date = '2012-02-22'
where book_id = 5
;

-- book 전체 데이터 조회
select  book_id
		,title
        ,pubs
        ,pub_date
from book
;


-- book, author 전체 테이블 조회 (author_id는 1개만 출력)
select  b.book_id
		,b.title
        ,b.pubs
        ,b.pub_date
        ,a.author_id
        ,a.author_name
        ,a.author_desc
from book b, author a
where b.author_id = a.author_id
;


