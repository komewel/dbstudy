-- 전달된 부서번호의 부서를 삭제하는 프로시저를 작성하시오.
-- 전달된 부서에 근무하는 모든 사원을 함께 삭제하시오.
DROP PROCEDURE DELETE_PROC;
CREATE OR REPLACE PROCEDURE DELETE_PROC(DEPTNO IN DEPARTMENT_TBL.DEPT_NO%TYPE) -- IN : 입력파라미터 함수나 메소드의 파라미터와 똑같아 지는것 
IS      -- 변수가 필요하면 추가로 선언하고 사용한다
BEGIN 
    DELETE  --1대다관계에선 다쪽을 먼저 지워야 함
      FROM EMPLOYEE_TBL
     WHERE DEPART = DEPTNO;
    DELETE
      FROM DEPARTMENT_TBL
     WHERE DEPT_NO = DEPTNO;
    COMMIT;  -- COMMIT을 꼭 해줘야 한다.
EXCEPTION
     WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
        DBMS_OUTPUT.PUT_LINE(SQLERRM);  --SQL에러 메시지
        ROLLBACK; -- 예외가 발생할때는 롤백을 해줘야한다
END; 

EXECUTE DELETE_PROC(1); --부서번호가 1인 부서를 지워라
        