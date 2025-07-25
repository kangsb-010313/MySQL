/**********************************
-root
**********************************/

show databases;

use mysql;

show tables;


-- guestbook 계정만들기
create user 'web'@'%' identified by 'web';

-- guestbook 권한주기
grant all privileges on web_db.* to 'web'@'%';

-- guestbook_db 만들기
create database web_db
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




