select  b.no
		,b.title
		,b.content
		,b.hit
		,date_format(b.reg_date, "%Y-%m-%d") regDate
		,u.no userNo
		,u.name userName
from users u, board b
where u.no = b.user_no
order by b.no asc
limit 10, 10
;


-- 전체 글 갯수 구하기
select count(*) count
from board
;



 
-- listcnt = 10 한페이지에 출력되는 갯수

-- crtPage 1 --> 0, 10
-- crtPage 2 --> 10, 10
-- crtPage 3 --> 20, 10

-- 시작글번호 = (crtPage-1)*listCnt
-- 		  (1-1)*10 --> 10 0
--           (2-1)*10 --> 20 10
--           (3-1)*10 --> 30 20
--           
-- (시작글번호=(crtPage-1)*listCnt listCnt)


-- 1 (0 ~ 10)
-- 2 (11 ~ 10)


