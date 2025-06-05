show databases;

use web_db;

show tables;

select * from author;
select * from book;

select *
from book b, author a
where b.author_id = a.author_id
;

select  b.book_id
		,b.title
        ,b.pubs
        ,date_format(b.pub_date, '%Y-%m-%d') as 'pub_date'
        ,a.author_id
        ,a.author_name
        ,a.author_desc
from book b, author a
where b.author_id = a.author_id
;

delete from author
where author_id = 8
;


select  author_id
		,author_name
        ,author_desc
from author
where author_id = 4
;

select *
from author
;
-- book DAO-------------------------------------------------
select  book_id
		,title
        ,pubs
        ,date_format(pub_date, '%Y-%m-%d') as pub_date
from book
;


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


insert into book
values(null, "책", "출판사", "날짜", 1);


