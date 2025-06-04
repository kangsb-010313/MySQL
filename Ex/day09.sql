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

