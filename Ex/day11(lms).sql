
show databases;

use web_db;

-- 테이블 조회 
show tables;

-- author 조회 
select  *
from author
;
-- book 조회 
select  *
from book
;



-- 테이블 등록
-- author 테이블
create table author(
	author_id		int				primary key		auto_increment -- 삭제 후 다시 만들어도 1부터 안됨
    ,author_name	varchar(100)	not null
    ,author_desc	varchar(500)
);


-- book 테이블
create table book(
	book_id		int 			primary key		auto_increment
    ,title		varchar(100) 	not null
    ,pubs		varchar(100)
    ,pub_date	datetime
    ,author_id 	int
    ,constraint book_fk foreign key(author_id)
    references author(author_id)
);

insert into author
values(null, '김문열', '경북 영양');
insert into author
values(null, '박경리', '경상남도 통영');
insert into author
values(null, '유시민', '17대 국회의원');
insert into author
values(null, '기안84', '기안동에서 산 84년생');
insert into author
values(null, '강풀', '서울특별시');


select  book_id
		,title
        ,pubs
        ,date_format(pub_date, '%Y-%m-%d') as 'pub_date'
        ,author_id
from book
;

select *
from book b, author a
where b.author_id = a.author_id
;