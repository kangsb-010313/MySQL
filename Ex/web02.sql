-- ---------------------------------------------
-- web 계정 02
-- ---------------------------------------------

-- 계정삭제
drop table author;
drop table book;

-- 작가 테이블 생성
create table author(
	author_id		int				primary key		auto_increment -- 삭제 후 다시 만들어도 1부터 안됨
    ,author_name	varchar(100)	not null
    ,author_desc	varchar(500)
);


-- insert 
insert into author
values(null, '박경리', '토지작가');

insert into author
values(null, '이문열', null);

insert into author(author_desc, author_name)
values('런닝맨', '유재석');

-- ----------------------------------------------------
-- 데이터 삭제 (주의!!!)
-- where절에 pk 컬럼 조건식으로 삭제 
delete from author
where author_id = 3
;

-- pk컬럼 이외의 컬럼은 기본적으로 삭제되지 않는다(옵션으로 조정할 수 있다)
delete from author
where author_name = '이문열'
;

-- 전부 삭제 (!!!!!!!!진심 주의!!!!!!!!!)
delete from author; -- 전체삭제의미(막혀있음)

-- TRUNCATE 명령: 테이블의 모든 로우를 제거     --> DML delete문과 비교
-- truncate table article;

-- ----------------------------------------------------
-- 데이터 수정
-- update author set 컬럼명=값,컬럼명=값,컬럼명=값 조건절;

-- where 절이 없는 경우 모든 데이터가 바뀐다(기본은 막혀있음) 
update author
set author_name = '기안84'
	,author_desc = '웹툰작가'
;

-- where 절을 꼭 써야 한다(pk로 조건절 작성)
update author
set author_name = '기안84'
	,author_desc = '웹툰작가'
where author_id = 1;

update author
set author_name = '정성찬'
	,author_desc = 'riize'
where author_id >= 1;



-- 작가 테이블 데이터 조회
select *
from author
;











