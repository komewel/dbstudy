-- 기타 함수

--1. 순위 구하기 
--  1) RANK() OVER(ORDER BY 순위구할칼럼 ASC)  : 오름차순 순위(낮은값이 1등), ASC는 생략
--  2) RANK() OVER(ORDER BY 순위구할칼럼 DESC) : 내림차순 순위(높은값이 1등)
--  3) 동점자는 같은 등수로 처리
--  4) 순위 순으로 정렬된 상태로 조회
SELECT
       EMPLOYEE_ID
     , FIRST_NAME || ' ' || LAST_NAME AS NAME --칼럼과 칼럼을 붙이면 하나의 칼럼처럼 처리
     , SALARY
     , RANK() OVER(ORDER BY SALARY DESC) AS 연봉순위
  FROM
       EMPLOYEES;
       
--2. 분기 처리하기
--1) DECODE(표현식,    --잘쓰면 성능이 높아진다(쓰는 방식이 SWITCH랑 비슷하다)
--      , 값1, 결과1
--      , 값2, 결과2
--      , ...)
--    표현식=값1이면 결과1을 반환, 표현식=값2이면 결과2를 반환, ....
--    표현식과 값의 동등 비교(=)만(크기비교가 필요한 경우 한계가 있다) 가능하다.
SELECT 
        EMPLOYEE_ID
      , FIRST_NAME
      , LAST_NAME
      , DEPARTMENT_ID
      , DECODE(DEPARTMENT_ID
            , 10, 'ADMINISTRATION'
            , 20, 'MARKETING'
            , 30, 'PURCHASING'
            , 40, 'HUMAN RESOURCES'
            , 50, 'SHIPPING'
            , 60, 'IT') AS DEPARTMENT_NAME
  FROM
        EMPLOYEES
 WHERE
        DEPARTMENT_ID IN(10, 20, 30, 40, 50, 60);
   
--2) 분기 표현식(함수는아님, DECODE와 달리 대소비교가 가능하다)
-- CASE
--     WHEN 조건식1 THEN 결과값1
--     WHEN 조건식2 THEN 결과값2
--     ....
--     ELSE 결과값N
-- END
SELECT
        EMPLOYEE_ID
      , FIRST_NAME
      , LAST_NAME
      , SALARY
      , CASE
            WHEN SALARY >= 15000 THEN 'A'
            WHEN SALARY >= 10000 THEN 'B'
            WHEN SALARY >= 5000 THEN 'C'
            ELSE 'D'
        END AS GRADE          
  FROM
        EMPLOYEES;
        
--3. 행 번호 반환하기(RANK와 똑같은데 행번호가 더 유용하다 동점자 처리된 고정된값으로 서치를 할수있는 장점이 있다, 목록에 페이징 처리할때 들어가는 기본 기술이다)
--      ROW_NUMBER() OVER (ORDER BY 칼럼 ASC OR(|) DESC)
--      정렬 결과에 행 번호를 추가해서 반환하는 함수
SELECT
       ROW_NUMBER() OVER(ORDER BY SALARY DESC) AS 행번호 
     , EMPLOYEE_ID
     , FIRST_NAME
     , LAST_NAME
     , SALARY
  FROM
       EMPLOYEES; 
