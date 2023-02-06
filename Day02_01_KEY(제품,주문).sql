/*
    KEY 제약조건 
    1. 기본키(PK : Primary Key) 
        1) 개체무결성
        2) PK는 NOT NULL + UNIQUE 해야 한다.
    2. 외래키(FK : Foreign Key)
        1) 참조무결성
        2) FK는 참조하는 값만 가질수 있다.
*/

/*
    일대다(1:M) 관계
    1. PK와 FK를 가진 테이블 간의 관계이다.
        1) 부모 테이블 : 1, PK를 가진 테이블
        2) 자식 테이블 : M, FK를 가진 테이블
    2. 생성과 삭제 규칙
        1) 생성 규칙 : "반드시" 부모 테이블을 먼저 생성한다.
        2) 삭제 규칙 : "반드시" 자식 테이블을 먼저 삭제한다.    
*/

/*
    외래키 제약 조건의 옵션
    1. ON DELETE CASCADE 
        1) 참조 중인 PARENT KEY가 삭제되면 해당 PARENT KEY를 가진 행 전체를 함께 삭제한다
        2) 예시) 회원 탈퇴 시 작성한 모든 게시글이 함께 삭제됩니다.(CASCADE옵션)
            게시글 삭제 시 해당 게시글에 달린 모든 댓글이 함께 삭제됩니다.
    2. ON DELETE SET NULL(PK의 NOT NULL 처리 해놓고 FK에 ON DELETE SET NULL로 설정하면 안된다 PK가 사라지면 NULL처리해라 라는 의미인데 NOT NULL 설정하고 삭제되면 NULL값을 주라는건 말이 안되기 때문)
        1) 참조 중인 PARENT KEY가 삭제되면 해당 PARENT KEY를 가진 칼럼 값만 NULL로 처리한다.
        2) 예시) 어떤 상품을 제거하였으나 해당 상품의 주문 내역은 남아 있는 경우(상품이 없어졌다고 해서 그동안 주문내역까지 다 지울 필요는 없다, 유연하게 데이터관리가 가능하다)
    
        
*/


--테이블 삭제 자식 테이블을 먼저 삭제해줘야 한다는 규칙 삭제를 몰아서 순서를 거꾸로 위쪽에 생성을 아래쪽에 
DROP TABLE ORDER_TBL;
DROP TABLE PRODUCT_TBL;

--제품 테이블(부모 테이블) 
CREATE TABLE PRODUCT_TBL (
    PROD_NO    NUMBER NOT NULL,   --PK설정, PRIMARY KEY와 UNIQUE는 같이 적을수 없다
                                  --다른이유는 아니고 그냥 이게 형식이다 심지어 NOT NULL도 생략 가능하다
                                  --PRIMARY KEY코드안에 다 의미가 함축되어 있는듯하다, CONSTRAINT PK_PROD는 제약조건의 이름을 주는 방식이다 PK_PROD가 이름이 된다.
    PROD_NAME  VARCHAR2(10 BYTE),       
    PROD_PRICE NUMBER,
    PROD_STOCK NUMBER,
    CONSTRAINT PK_PROD PRIMARY KEY(PROD_NO)  --PROD_NO 칼럼에다가 PK를 PK_PROD이름과 같이 줘라
);   

--주문 테이블(자식 테이블)
CREATE TABLE   ORDER_TBL (
    ORDER_NO   NUMBER NOT NULL,
    USER_ID    VARCHAR2(10 BYTE),
    PROD_NO    NUMBER,  
    ORDER_DATE DATE,
    CONSTRAINT PK_ORDER PRIMARY KEY(ORDER_NO), 
    CONSTRAINT FK_ORDER_PROD FOREIGN KEY(PROD_NO) REFERENCES PRODUCT_TBL(PROD_NO) ON DELETE CASCADE --FK이름은 테이블간의 관계로 이름을 짓는다
);  



/*
    제약조건 테이블 (COMMIT이 필요한 요소는 삽입, 수정, 삭제), (제약조건 정보를 쿼리문으로 불러오기 위한 기능, 제약조건도 데이터로 볼게 아니라 테이블로 짜져있다)
    1. SYS, SYSTEM 관리 계정으로 접속해서 확인한다.
    2. 종류(DATA DICTIONARY, CATALOG 라고 부른다) 
        1) ALL_CONSTRAINTS   모든 제약조건
        2) USER_CONSTRAINTS  사용자 제약조건
        3) DBA_CONSTRAINTS   관리자 제약조건
*/

--테이블의 구조를 확인하는 쿼리문 (설명)
--DESCRIBE ALL_CONSTRAINTS;
--SELECT * FROM ALL_CONSTRAINTS WHERE CONSTRAINT_NAME LIKE 'PK%';





