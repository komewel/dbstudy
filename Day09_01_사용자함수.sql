/*
    사용자 함수(FUNCTION) --함수가 발전해서 메소드가 된것
    1. 어떤 값을 반환할 때 사용하는 데이터베이스 객체 
    2. 실제로 함수를 만들어서 사용하는 개념이다.
    3. RETURN 개념이 존재한다.
    4. 함수의 결과 값을 확인할 수 있도록 SELECT문에서 많이 사용한다.
    5. 형식
        CREATE [OR REPLACE] FUNCTION 함수명[(매개변수)]
        RETURN 반환타입
        IS -- AS도 가능
            변수 선언
        BEGIN 
            함수 본문
        [EXCEPTION
            예외 처리]
        END;    
*/

/*내가 정리한거
CREATE OR REPLACE FUNCTION --PK로 설정할 칼럼,연관지을 테이블과 PK연결짓기
RETURN --반환하는값의 타입을정해준다
IS     --특정 테이블에서 가져오는 칼럼을 타입 그대로 가져와서 별명을 설정한다.
       --이 메소드에서 쓰여질 재료가 모이는 곳같은 느낌
    
BEGIN  --본문에 해당한다 여기는(참조할 테이블이 있을땐 아래 방식)  
    SELECT --복사할 테이블의 칼럼을 적고
      INTO --붙여넣기할 칼럼위에 적힌 칼럼 정보를 여기다 넣어주는 느낌 
      FROM --복사할 칼럼 테이블 출처
     WHERE --복사할 테이블과 붙여넣기할 테이블 PK로 연관짓기
     RETURN --반환할 데이터 종류와 양식
     
     END;
*/     

-- 사용자 함수 FUNC1 정의 
CREATE OR REPLACE FUNCTION FUNC1
RETURN VARCHAR2 --반환타입에서는 크기를 명시하지 않는다.
IS
BEGIN 
    RETURN 'HELLO WORLD';
END;

--사용자 함수 FUNC1 호출 
SELECT FUNC1() FROM DUAL;



--사용자 함수 FUNC2 정의
--사원번호를 전달하면 해당 사원의 FIRST_NAME을 반환하는 함수

--사용자 함수의 파라미터는 IN/OUT표기가 없다.
--입력 파라미터 형식으로 사용된다.

CREATE OR REPLACE FUNCTION FUNC2(EMP_ID EMPLOYEES.EMPLOYEE_ID%TYPE)
RETURN VARCHAR2 
IS 
    FNAME EMPLOYEES.FIRST_NAME%TYPE; --받을때의 변수 타입 지정
    LNAME EMPLOYEES.LAST_NAME%TYPE;
BEGIN
    SELECT FIRST_NAME, LAST_NAME
      INTO FNAME, LNAME
      FROM EMPLOYEES
     WHERE EMPLOYEE_ID = EMP_ID;
     
     RETURN FNAME || ' ' || LNAME;
     
END; -- 데이터를 가져와서 여기서 조합하고 섞는 느낌

--사용자 함수 FUNC2 호출
SELECT FUNC2(100)
  FROM EMPLOYEES
 WHERE EMPLOYEE_ID = 100; 

--사용자 함수 FUNC3 정의
--사원번호를 전달하면 해당 사원의 연봉이 15000이상이면 '고액연봉', 아니면 '보통연봉'을 반환하는 함수

--강사님이 한거
CREATE OR REPLACE FUNCTION FUNC3(EMP_ID EMPLOYEES.EMPLOYEE_ID%TYPE)
RETURN VARCHAR2
IS
    SAL EMPLOYEES.SALARY%TYPE;
    MESSAGE VARCHAR2(12 BYTE);
BEGIN
    
    SELECT SALARY
      INTO SAL
      FROM EMPLOYEES
     WHERE EMPLOYEE_ID = EMP_ID;
    
    IF SAL >= 15000 THEN
        MESSAGE := '고액연봉';
    ELSE
        MESSAGE := '보통연봉';
    END IF;
    
    RETURN MESSAGE;
    
END;
        
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY, FUNC3(EMPLOYEE_ID)
  FROM EMPLOYEES
 ORDER BY EMPLOYEE_ID ASC;
 
/* 내가한거
CREATE OR REPLACE FUNCTION FUNC3(EMP_ID EMPLOYEES.EMPLOYEE_ID%TYPE)
RETURN VARCHAR2
IS 
    SAL EMPLOYEES.SALARY%TYPE;
BEGIN 
    SELECT SALARY
      INTO SAL
      FROM EMPLOYEES
     WHERE EMPLOYEE_ID = EMP_ID;  
     IF SAL >= 15000 THEN
        RETURN '고액연봉';
    ELSE
        RETURN '보통연봉';
    END IF;
    
        
    END;   
*/  

--함수 MY_CEIL 정의
CREATE OR REPLACE FUNCTION MY_CEIL(N NUMBER, DIGIT NUMBER)
RETURN NUMBER
IS
BEGIN
    RETURN CEIL(N* POWER(10, DIGIT)) /  POWER(10, DIGIT);
    END;
    
--함수 MY_CEIL 호출
SELECT
        MY_CEIL(111.111, 2)     --소수2자리 올림
      , MY_CEIL(111.111, 1)     --소수1자리 올림
      , MY_CEIL(111.111, 0)     --정수로 올림
      , MY_CEIL(111.111, -1)    --일의자리 올림
      , MY_CEIL(111.111, -2)    --십의자리 올림
  FROM 
        DUAL;
        
CREATE OR REPLACE FUNCTION MY_FLOOR(N NUMBER, DIGIT NUMBER)
RETURN NUMBER
IS
BEGIN
    RETURN FLOOR(N* POWER(10, DIGIT)) /  POWER(10, DIGIT);
    END;   
         
SELECT
        MY_FLOOR(111.111, 2)     --소수2자리 올림
      , MY_FLOOR(111.111, 1)     --소수1자리 올림
      , MY_FLOOR(111.111, 0)     --정수로 올림
      , MY_FLOOR(111.111, -1)    --일의자리 올림
      , MY_FLOOR(111.111, -2)    --십의자리 올림
  FROM 
        DUAL;            



