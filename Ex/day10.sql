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