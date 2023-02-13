--1. 사원번호가 1001인 사원과 동일한 직급(POSITION)을 가진 사원을 조회하시오.
SELECT *
  FROM EMPLOYEE_TBL
 WHERE POSITION = (SELECT POSITION
                     FROM EMPLOYEE_TBL
                    WHERE EMP_NO = 1001); 

--2. 부서번호가 2인 부서와 동일한 지역에 있는 부서를 조회하시오.
SELECT *
  FROM DEPARTMENT_TBL
 WHERE LOCATION IN (SELECT LOCATION
                    FROM DEPARTMENT_TBL 
                   WHERE DEPT_NO = 2); 

--3. 가장 높은 급여를 받는 사원을 조회하시오
SELECT *
  FROM EMPLOYEE_TBL
 WHERE SALARY = (SELECT MAX(SALARY)
                   FROM EMPLOYEE_TBL); 

--4. 평균 급여 이상을 받는 사원을 조회하시오.
SELECT *
  FROM EMPLOYEE_TBL
 WHERE SALARY > (SELECT AVG(SALARY)
                   FROM EMPLOYEE_TBL);

--5. 평균 근속 개월 수 이상을 근무한 사원을 조회하시오.
SELECT *
  FROM EMPLOYEE_TBL
 WHERE MONTHS_BETWEEN(SYSDATE, HIRE_DATE) >= (SELECT AVG(MONTHS_BETWEEN(SYSDATE, HIRE_DATE))
                                                FROM EMPLOYEE_TBL);

--6. 부서번호가 2인 부서에 근무하는 사원들의 직급과 일치하는 사원을 조회하시오.
SELECT *
  FROM EMPLOYEE_TBL
 WHERE POSITION IN (SELECT POSITION
                   FROM EMPLOYEE_TBL
                  WHERE DEPART = 2); 

--7. 부서명이 '영업부'인 부서에 근무하는 사원을 조회하시오.
SELECT *
  FROM EMPLOYEE_TBL
 WHERE DEPART IN (SELECT DEPT_NO
                   FROM DEPARTMENT_TBL
                  WHERE DEPT_NAME = '영업부'); 
 
--8. 직급이 '과장'인 사원들이 근무하는 부서 정보를 조회하시오.
SELECT *
  FROM DEPARTMENT_TBL
 WHERE DEPT_NO IN (SELECT DEPART
                    FROM EMPLOYEE_TBL
                   WHERE POSITION = '과장'); 


--9. '영업부'에서 가장 높은 급여보다 더 높은 급여를 받는 사원을 조회하시오.
SELECT *
  FROM EMPLOYRR_TBL
 WHERE SALARY = (SELECT  

--1. ROWNUM 칼럼 사용하기
   
--1-2. ROW_NUMBER() 함수 사용하기

--2. 3 ~ 4 번째로 입사한 사원을 조회하시오.
    
--2-2 ROW_NUMBER() 함수 사용하기 

 

  





    




