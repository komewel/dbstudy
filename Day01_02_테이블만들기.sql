/*
    테이블
    1. 데이터베이스의 가장 대표적인 객체이다.
    2. 데이터를 보관하는 객체이다.
    3. 표 형식으로 데이터를 보관한다.
    4. 테이블 기본 용어
        1) 열 :  column,        속성(attribute),         필드(field) 
        2) 행 :     row,    개체(=객체, entity),      레코드(record)
*/

/*
    오라클의 데이터 타입
    1. CHAR(=String, size를전달)  : 고정 길이 문자 타입(size : 1 ~ 2000바이트), 데이터(길이)가 고정되어 있을때(ex.주민등록번호)
    2. VARCHAR2(size)             : 가변 길이 문자 타입(size : 1 ~ 4000바이트)
    3. DATE                       : 날짜/시간 타입
    4. TIMESTAMP                  : 날짜/시간 타입(좀 더 정밀)
    5. NUMBER(p,s)                : 정밀도(p), 스케일(s)로 표현하는 숫자 타입
        1) 정밀도(p) : 정수부와 소수부를 모두 포함하는 전체 *유효* 숫자가 몇 개인가?
        2) 스케일(s) : 소수부의 전체 *유효* 숫자가 몇 개인가? 
           EX)  (1) NUMBER      : 최대 38자리 숫자를 표현가능(사이즈 22바이트)
                (2) NUMBER(3)   : 정수부가 최대 3자리인 숫자(최대 999)
                (3) NUMBER(5,2) : 최대 전체 5자리, 소수부 2자리(EX, 123.45)
                (4) NUMBER(2,2) : 1미만의 소수부 2자리인 실수(EX, 0.15) - 정수부의 0 은 유효 자리가 아님 소수부 뒤에 0을 붙여도 비슷한 개념 
*/

/*
    제약 조건(Constraint)( ";" 이게 나오기전까지는 쿼리문이 끝난게 아니므로 조건을 걸때는 띄어쓰기나 줄바꿈 다 상관없이 정리중요)
    1. 널 
        1) NULL 또는 생략
        2) NOT NULL
    2. 중복 데이터(값) 방지
        UNIQUE(특별하다, 동일한 데이터가 입력될수 없다)
    3. 값의 제한(가격이 마이너스거나 말도안되는 상황을 제한해준다)
        CHECK 
    5개 중 3개 설명     
*/

-- 예시 테이블(자바 이클립스랑 다르게 타입선언 이름이 아니라 반대이다 이름 타입선언, SQL은 소문자만 쓸거면 소문자만 아님 대문자만 이렇게 자기가 정한 규칙을 정해서 하나로만 작성해야한다.)
DROP TABLE PRODUCT;      --이렇게 바로 위에 지우는 코드 짜주면 편하다
CREATE TABLE PRODUCT(    --쿼리, 이거 하나를 1개의 쿼리라고 부른다
    CODE            VARCHAR2(2 BYTE)    NOT NULL UNIQUE, -- NULL값이 아니다라고 설정해줘야한다(값을 비워두지 말아라), 필수 제약 조건 
    MODEL           VARCHAR2(10 BYTE)   NULL,  
    CATRGORY        VARCHAR2(5 BYTE)    CHECK(CATEGORY = 'MAIN' OR CATEGORY = 'SUB'),  --CATEGORY값이 MAIN 과 SUB 밖에 없다는 가정하에 값입력은 이렇게 한다, CHECK(CATEGORY IN('MAIN','SUB'))이렇게 대체가능 (추천)
    PRICE           NUMBER              CHECK(PRICE >= 0),
    AMOUNT          NUMBER(2)           CHECK(AMOUNT >= 0 AND AMOUNT <= 100),  -- CHECK(AMOUNT BETWEEN 0 AND 100) 이렇게 대체 가능 (추천)
    MANUFACTURED    DATE
);    
    

                