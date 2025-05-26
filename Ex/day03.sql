-- 복습
-- 월급이 10000 이상인 직원의 이름 월급을 월급이 큰 직원부터 출력하세요
-- select 문의 기본 구조(4개의 절)

-- 정상 작동
select  first_name fname
		,salary s
from employees
where salary >= 10000
order by salary desc
;

-- where 절 x, order by 절 o
select  first_name fname
		,salary s
from employees
where s >= 10000
order by s desc
;

-- --------------------------------------
-- 단일행 함수
-- --------------------------------------
-- *단일행 함수 > 숫자 함수

-- *round() : 반올림 ----------------------------------------
-- 소수점 m 자리까지 표현
select  round(123.123, 2)	-- 123.123 소수점 2자리까지 표현  
		,round(123.126, 2)	-- 소수점 3자리에서 반올림 
        ,round(234.567, 0) 	-- 235
        ,round(123.456, 0) 	-- 123
        ,round(123.124, -1)	-- 120
        ,round(125.126, -1)	-- 130
        ,round(125.126, -2)	-- 100
from dual -- 표 (테이블)
;

-- *ceil(): 올림 ----------------------------------------
-- 대소문자 상관 없음
select  ceil(123.456)	-- 124
		,ceil(123.789)	-- 124
        ,ceil(123.7892313)	-- 124
        ,ceil(987.1234)	-- 988
from dual
;

-- *floor(): 내림 0번째 자리까지 표현 (소수점1자리에서 버림) ----------------
select  floor(123.456)		-- 123
		,floor(123.789)		-- 123
        ,floor(123.7892313)	-- 123
        ,floor(987.1234) 	-- 987
from dual
;

-- *truncate : (숫자, m) : 자리수 버림 ----------------------------------
select  truncate(1234.34567, 2)		-- 1234.34
		,truncate(1234.345, 3)		-- 1234.345
        ,truncate(1234.34567, 0)	-- 1234
        ,truncate(1235.34567, -2)	-- 1200
from dual
;

-- * power(숫자, n),  pow(숫자, n): 숫자의 n승   -------------------------
select  power(12, 2)	-- 12*12 --> 144 / (개발에서)2^2 표현하기도 함
		,pow(12, 2)		-- 12*12 --> 144
from dual
;

-- *sqrt(숫자): 숫자의 제곱근 --------------------------------------------
select  sqrt(144)		-- 12
from dual
;  

-- *sign(숫자): 숫자가 음수이면 -1, 0이면 0, 양수이면 1 -----------------------
select  sign(123) 	-- 1 양수 
		,sign(0)	-- 0 = 0
        ,sign(-123) -- -1 음수 
from dual
;  

-- abs(숫자): 절대값 ------------------------------------------
select  abs(123)	-- 123
		,abs(0) 	-- 0
        ,abs(-123)	-- 123
from dual
;  

-- *greatest(x, y, z, ...): 괄호안의 값 중 가장 큰 값  ----------------
-- 파라미터 몇 개 써도 상관없음
select  greatest(2, 0, -2)				-- 2
		,greatest(4, 3.2, 5.25) 		-- 5.25
        ,greatest('B', 'A', 'C', 'c')	-- c -->알파벳 뒤로 갈수록 큼, 소문자>대문자
        ,greatest('ㄱ', 'ㄴ') 			-- ㄴ 한글 뒤로 갈수록 큼 
        ,greatest('ㄱ', 'ㅎ', 'ㅏ')		-- ㅏ 자음<모음 
        ,greatest('ㄴ', 'A') 			-- ㄱ 한글>영어
from dual
;

-- *least(x, y, z, ...): 괄호안의 값 중 가장 작은 값  ------------------------
select  least(2, 0, -2)				-- -2
		,least(4, 3.2, 5.25) 		-- 3.20
        ,least('B', 'A', 'C', 'c')	-- A
from dual
;

-- --------------------------------------
-- *단일행 함수 > 문자 함수 
-- --------------------------------------

-- *concat(str1, str2, ..., strn): str1, str2, ..., strn을 연결  ------
select  concat('안녕', '하세요') 	-- 안녕하세요 
from dual
;
select  concat('안녕', '-', '하세요')	-- 안녕-하세요 
from dual
;
select  concat(first_name, " ", last_name)	abc-def
from employees
;

-- *concat_ws(s, str1, str2, ..., strn): str1, str2, ..., -------------
-- strn을 연결할때 사이에 s 로 연결    
-- ws --> *with seperator
select  concat_ws('-', 'abc', '123', '가나다') -- abc-123-가나다 
from dual
;
select  first_name, last_name  	-- 이름, 성 따로
		,concat(first_name, last_name)	-- 이름 성 
        ,concat(first_name, '-', last_name) -- 이름-성
        ,concat_ws('-', first_name, last_name, employee_id) -- 이름-성-직원아이디
from employees
;

-- *lcase(str) 또는 lower(str): str의 모든 대문자를 소문자로 변환 --------------
-- 이름만 다르고 똑같은 기능 
select 	first_name
		,lcase(first_name)
		,lower(first_name)
		,lower('ABCabc!#$%')
		,lower('가나다')		-- 못 바꾸면 그냥 원래꺼 입력해주고, 오류가 나진 않음 
from employees
;

-- *UCASE(str) 또는 UPPER(str): str의 모든 소문자를 대문자로 변환 --------------
select 	first_name
		,ucase(first_name)
		,upper(first_name)
		,upper('ABCabc!#$%')
		,upper('가나다')		
from employees
;

-- 문자 갯수 
-- *length(str): str의 길이를 바이트로 반환------------------------------------
-- *char_length(str) 또는 chatacter_length(): str의 문자열 길이를 반환 ---------
select 	first_name
		,length(first_name)			-- 바이트 수(주의)
		,char_length(first_name)		-- 글자 수 
		,character_length(first_name)	-- 글자 수
from employees
;

select  length('a')
		,char_length('a')
        ,character_length('a')
from dual
;
select  length('가') 	-- 바이트 수->3
		,char_length('가')
        ,character_length('가')
from dual
;

-- *substring(str, pos, len) 또는 substr(str, pos, len) ---------------
-- str의 pos 위치에서 시작하여 len 길이의 문자열 반환 ---------------------------
select 	first_name
		, substring(first_name, 1, 3) -- 첫 번째 부터 3글자 (오른쪽 방향)
        , substring(first_name, 2, 3) -- 두 번째 부터 3글자 (오른쪽 방향)
        , substr(first_name, -3, 2)	  -- 끝에서 3번째 부터 2글자 	(오른쪽 방향)
from employees
where department_id = 100
;

select  substr('90/11/12-1234567', 8, 1)   -- 성별
		,substr('90/11/12-1234567', -7, 1) -- 성별 
        ,substr('010-3333-1313', 1, 3)	   -- 입학년도
from dual
;

-- *LPAD(str, len, padstr): str 문자열 왼쪽에 padstr 문자열을 추가하여, ----------
-- 전체 문자열의 길이가 len이 되도록 만듬 
-- *RPAD(str, len, padstr)str 문자열 오른쪽에 padstr 문자열을 추가하여, -----------
-- 전체 문자열의 길이가 len이 되도록 만듬
select first_name
       ,lpad(first_name,10,'*') -- 왼쪽
       ,rpad(first_name,10,'*') -- 오른쪽 
from employees;

-- ------------------------------------------------------------
-- *TRIM(str): str의 양쪽에 있는 공백 문자를 제거 --> 문장의 중간의 공백은 적용되지 않음
-- *LTRIM(str): str의 왼쪽에 있는 공백 문자를 제거
-- *RTRIM(str): str의 오른쪽에 있는 공백 문자를 제거
select  concat('|', '        안녕하세요        ', '|')
		,concat('|', trim('        안녕하세요        '), '|')
        ,concat('|', ltrim('        안녕하세요        '), '|')
        ,concat('|', rtrim('        안녕하세요        '), '|')
        ,concat('|', '        안녕하세요        ', '|')
        
        ,trim(concat('|', '        안녕하세요        ', '|'))
from dual
;
-- replace(str, from_str, to_str): str에서 from_str을 to_str로 변경
select  first_name
		,replace(first_name, 'a', '*')
from employees
;
select  first_name
		,substr(first_name, 2, 3)
        ,replace(first_name, substr(trim(first_name), 2, 3), '***')
        -- Steven -> 	tev	 -> 	S***en
from employees
;

-- --------------------------------------
-- *단일행 함수 > 날짜 함수 
-- --------------------------------------

-- *CURRENT_DATE() 또는 CURDATE(): 현재 날짜를 반환
-- *CURRENT_TIME() 또는 CURTIME(): 현재 시간을 반환
-- *CURRENT_TIMESTAMP() 또는 NOW(): 현재 날짜와시간을 반환
select  current_date() from dual; 		-- 날짜
select curdate() from  dual; 

select current_time() from dual;		-- 시간
select curtime() from  dual; 

select current_timestamp() from dual;	-- 날짜, 시간 
select now() from  dual; 

-- *ADDDATE() 또는 DATE_ADD(): 날짜 시간 더하기--------------------------------
select '2021-06-20 00:00:00'
		,adddate('2021-06-20 00:00:00', interval 1 year) -- > +1년
		,adddate('2021-06-20 00:00:00', interval 1 month)-- > +1달 
		,adddate('2021-06-20 00:00:00', interval 1 week) -- > 1주
		,adddate('2021-06-20 00:00:00', interval 1 day)  -- > 1일
        
        ,adddate('2021-06-20 00:00:00', interval 1 hour) -- > 1시간
        ,adddate('2021-06-20 00:00:00', interval 1 minute)  -- > 1분
        ,adddate('2021-06-20 00:00:00', interval 1 second)  -- > 1초
from dual
;

-- *SUBDATE() 또는 DATE_SUB(): 날짜 시간 빼기-------------------------------
select '2021-06-20 00:00:00'
		,subdate('2021-06-20 00:00:00', interval 1 year) -- > +1년
		,subdate('2021-06-20 00:00:00', interval 1 month)-- > +1달 
		,subdate('2021-06-20 00:00:00', interval 1 week) -- > 1주
		,subdate('2021-06-20 00:00:00', interval 1 day)  -- > 1일
        ,subdate('2021-06-20 00:00:00', interval 1 hour) -- > 1시간
        ,subdate('2021-06-20 00:00:00', interval 1 minute)  -- > 1분
        ,subdate('2021-06-20 00:00:00', interval 1 second)  -- > 1초
from dual
;

-- *DATEDIFF(): 두 날짜간 일수차, TIMEDIFF(): 두 날짜시간 간 시간차 ---------------
select  datediff('2021-06-21 01:05:05', '2021-06-21 01:00:00') 일수차  -- 일 
		,timediff('2021-06-21 01:05:05', '2021-06-20 01:00:00') 시간차 -- 초
from dual
;

select datediff('2025-09-05', '2025-03-27') 수업기간
from dual -- 수업 기간 며칠 
;

select  first_name
		,datediff(now(), hire_date)/365 -- 입사일부터 오늘까지 며칠 /365-> 몇 년
        ,concat(ceil(datediff(now(), hire_date)/365), '년차') -- 반올림, 년차 
from employees
;

-- --------------------------------------
-- *단일행 함수 > 변환 함수 
-- --------------------------------------
-- *DATE_FORMAT(date, format): date를 format형식으로 변환--------------------
-- 날짜(시간) -> 문자열
select  now()
		,date_format(now(), '%y/%m/%d %h:%i:%s') 
        ,date_format(now(), '%Y-%M-%D (%p)%h:%i:%s') -- 2025-May-26th (PM)03:41:44
		,date_format(now(), '%Y-%m-%d %H:%i:%s')
from dual
;
-- 응용 패턴 (자주 쓰임)
select  first_name
		,date_format(hire_date, '%d.%m.%Y') hire_date
from employees
;


-- *STR_TO_DATE(str, format): str를 format형식으로 변환 -------------------
-- 원래 문자열 --> 날짜형(자동으로 변환)
select datediff('2021-06-22', '2021-06-21')
from dual
;
-- 문자열 --> 날짜형으로 변환 --> 계산
select datediff('2021-Jun-22', '2021-06-21') -- 안됨
from dual
;
select  str_to_date('2021-Jun-22', '%Y-%b-%d')
		,str_to_date('2021-06-21', '%Y-%m-%d')
        ,datediff(str_to_date('2021-Jun-22', '%Y-%b-%d'), str_to_date('2021-06-21', '%Y-%m-%d'))
from dual
;

-- *FORMAT(숫자, p): 숫자에 콤마(,) 를 추가, 소수점 p자리까지 출력 ----------------
-- 숫자 --> 문자열
select  format(123456, 0)
		,format(1234567.89128, 4) -- 소수점 자리수 반올림 
        ,format(1234567.89128, -5) -- 소수점 자리수(-는 안 먹음) 반올림
from dual
;

-- *IFNULL(컬럼명, null일때값): 컬럼의 값이 null일때 정해진값을 출력-----------------
select  first_name
		,commission_pct
        ,ifnull(commission_pct, 0)
from employees
order by commission_pct desc
;

select  first_name
		,manager_id
        ,ifnull(manager_id, '매니저없음')
from employees
;
-- is null, is not null 기억하기 잊지말기

-- select 문
select  메소드(first_name) -- 오늘 배운 거
		,salary
from employees
where salary >= 10000
order by salary desc
;



