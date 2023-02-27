--삽입/삭제/수정하면 메시지를 출력하는 트리거 만들기
DROP TRIGGER MY_TRIGGER;
SET SERVEROUTPUT OFF;
SET SERVEROUTPUT ON; --이걸 켜놔야 메시지 확인 가능함

CREATE OR REPLACE TRIGGER MY_TRIGGER
    AFTER 
    INSERT OR DELETE OR UPDATE  --OR로 연결하면 됨
    ON DEPARTMENT_TBL           --어떤 테이블 대상인지
    FOR EACH ROW                --한줄씩 읽어달라
BEGIN    
    DBMS_OUTPUT.PUT_LINE('하하하하하');
END;

INSERT INTO DEPARTMENT_TBL(DEPT_NO,DEPT_NAME,LOCATION) VALUES(5,'개발부','서울');  --정상 작동 하는지 확인해보는 수단
    
DESC DEPARTMENT_TBL;    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
