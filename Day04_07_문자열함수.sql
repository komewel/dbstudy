-- 문자열 함수


-- 1. 대소문자 변환 함수
SELECT
       UPPER(EMAIL)   -- 대문자
     , LOWER(EMAIL)   -- 소문자
     , INITCAP(EMAIL) -- 첫 글자는 대문자, 나머지는 소문자
  FROM
      EMPLOYEES;
  
-- 2. 글자 수(바이트 수) 반환 함수
SELECT
       LENGTH('HELLO')  --글자 수  : 5
     , LENGTH('안녕')   --글자 수  : 2
     , LENGTHB('HELLO') --바이트 수: 5
     , LENGTHB('안녕')  --바이트 수: 6
 FROM
     DUAL;
     
-- 3. 문자열 연결 함수/연산자
--      1) 함수   : CONCAT(A, B) 주의! 인수가 2개만 전달 가능하다.(CONCAT(A, B, C)같은 형태는 불가능하다.)
--      2) 연산자 : || 주의! OR 연산 아닙니다! 오라클 전용입니다! (대표적으로 검색할때 쓰이는 기술(사원명을 찾는데 A를 검색하면 DB상에서 %A%로 만들어서 검색)인데 자바에서도 할수있지만 DB상에서 해주는게 훨씬 더 낫다)
SELECT 
      CONCAT(CONCAT(FIRST_NAME, ' '), LAST_NAME)
    , FIRST_NAME || ' ' || LAST_NAME  
  FROM
       EMPLOYEES;
       
       