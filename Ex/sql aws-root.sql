/**********************************
-root
**********************************/

show databases;

use mysql;

show tables;


-- guestbook 계정만들기
create user 'guestbook'@'%' identified by 'guestbook';

-- guestbook 권한주기
grant all privileges on guestbook_db.* to 'guestbook'@'%';

-- guestbook_db 만들기
create database guestbook_db
    default character set utf8mb4
    collate utf8mb4_general_ci
    default encryption='n'
;

/**********************************
-guestbook/ guestbook
**********************************/
-- 테이블 생성


-- 데이터 넣기


-- 조회




