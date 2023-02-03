DROP TABLE PRODUCT_TBL;
DROP TABLE ORDER_TBL;

CREATE TABLE PRODUCT_TBL (
    PROD_NO     NUMBER,
    PROD_NAME   VARCHAR2(10 BYTE),  
    PROD_PRICE  NUMBER,
    PROD_STOCK  NUMBER,
    CONSTRAINT PK_PROD PRIMARY KEY(PROD_NO)
);

CREATE TABLE ORDER_TBL (
    ORDER_NO    NUMBER,
    USER_ID     VARCHAR2(10 BYTE),
    PROD_NO     NUMBER,
    ORDER_DATE  DATE,
    CONSTRAINT PK_ORDER PRIMARY KEY(ORDER_NO),
    CONSTRAINT FK_ORDER_PROD FOREIGN KEY(PROD_NO) REFERENCES PRODUCT_TBL(PROD_NO)
);    