-- 사원번호를 전달하면 해당 사원의 이름을 반환하는 함수 만들기
DROP FUNCTION GET_NAME;
CREATE OR REPLACE FUNCTION GET_NAME(EMPNO EMPLOYEE_TBL.EMP_NO%TYPE)
RETURN VARCHAR2
IS
    EMPNAME EMPLOYEE_TBL.NAME%TYPE;            --엠플로이 테이블의 NAME과 같은 타입이다
BEGIN
    SELECT NAME
      INTO EMPNAME  
      FROM EMPLOYEE_TBL
     WHERE EMP_NO = EMPNO;                     --SELECT절에서 받은인수가 위에 EMPNO가 받아서 WHERE절에 EMP_NO로 들어가서 데이터값과 관계있는 데이터값을 알려준다 
    RETURN EMPNAME; 
END;

-- 사원명
-- 구창민
SELECT GET_NAME(1001) AS 사원명                --방법1, 한명만 나오게 해달라  
  FROM EMPLOYEE_TBL
 WHERE EMP_NO = 1001;
 
SELECT DISTINCT GET_NAME(EMP_NO) AS 사원명     --방법2, 한명만 나오게 해달라 
  FROM EMPLOYEE_TBL;

SELECT GET_NAME(EMP_NO) AS 사원명
  FROM EMPLOYEE_TBL;
  
  