/*
    테이블
    1. 데이터베이스의 가장 대표적인 객체이다.
    2. 데이터를 보관하는 객체이다.
    3. 표 형식으로 데이터를 보관한다.
    4. 테이블 기본 용어
        1) 열 : column,        속성(attribute),         필드(field) 
        2) 행 :    row,    개체(=객체, entify),      레코드(record)
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


-- 예시 테이블(자바 이클립스랑 다르게 타입선언 이름이 아니라 반대이다 이름 타입선언)
DROP TABLE PRODUCT;      --이렇게 바로 위에 지우는 코드 짜주면 편하다
CREATE TABLE PRODUCT(    --쿼리, 이거 하나를 1개의 쿼리라고 부른다
    CODE            VARCHAR2(2 BYTE)  NOT NULL, -- NULL값이 아니다라고 설정해줘야한다, 필수 제약 조건 
    MODEL           VARCHAR2(10 BYTE),  
    CATRGORY        VARCHAR2(5 BYTE),
    PRICE           NUMBER,
    AMOUNT          NUMBER(2),
    MANUFACTURED    DATE
);    
    

                