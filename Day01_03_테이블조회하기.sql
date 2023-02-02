/*
    DQL
    1. Data Query Language
    2. 데이터 질의(조회) 언어
    3. 테이블의 데이터를 조회하는 언어이다.
    4. 테이블 내용의 변경이 생기지 않는다.
        (트랜잭션(삽입, 수정, 삭제 내용이 바뀌는대상)의 처리대상이 아니고(필요가없다), COMMIT이 필요하지 않다)
    5. 형식([]는 생략 가능다는 뜻)
        SELECT 조회할칼럼, 조회할칼럼, 조회할칼럼, ...   --FROM테이블이름 앞에 까지는 *SELECT절* FROM테이블이름은 *FROM절* 
        FROM 테이블이름  
        [WHERE 조건식]
        [GROUP BY 그룹화할칼럼 [HAVING 그룹조건식]]
        [ORDER BY 정렬할칼럼 정렬방식]
    6. 순서(읽는순서)
        ④ SELECT 조회할칼럼, 조회할칼럼, 조회할칼럼, ...  
        ① FROM 테이블이름  
        ② [WHERE 조건식]
        ③ [GROUP BY 그룹화할칼럼 [HAVING 그룹조건식]]
        ⑤ [ORDER BY 정렬할칼럼 정렬방식]
*/

/*
    트랜잭션
    1. Transaction
    2. 여러 개의 세부 작업으로 구성된 하나의 작업을 의미한다.
    3. 모든 세부 작업이 성공하면 COMMIT(저장)하고, 하나라도 실패하면 모든 세부 작업의 취소를 진행한다.
        (All or Nothing)(=전부하던가 아예 하지 말던가)
        
*/

--조회 실습.
--1. 사원 테이블에서 사원명 조회하기

--1) 기본 방식
SELECT ENAME 
  FROM EMP;

--2) 오너 명시하기(테이블을 가지고 있는 계정)
SELECT ENAME
  FROM SCOTT.EMP;

--3) 테이블 명시하기(칼럼을 가지고 있는 테이블)
SELECT EMP.ENAME
  FROM EMP;

--4) 테이블 별명 지정하기
SELECT E.ENAME -- 2. 그럼 여기서 E.이라고 해도된다
  FROM EMP E; -- 1. EMP 테이블의 별명을 E로 부여한다,AS(ALIAS)를 사용할 수 없다

--5) 칼럼 별명 지정하기
SELECT E.ENAME AS 사원명 -- E.ENAME 칼럼의 별명을 '사원명'으로 부여한다. 가독성을 높이기 위해 AS(ALIAS)를 사용할 수 있다(칼럼에만 가능하다.)
  FROM EMP E;
 
  
--2. 사원 테이블의 모든 칼럼 조회하기 
--1) *(애스터리스크, 라틴어로 별이라는 뜻이다)활용하기(SELECT절에서 *는 모든 칼럼을 의미한다.)
SELECT *        -- 불려 가기 싫으면 사용금지!
  FROM EMP;

--2) 모든 칼럼 직접 작성하기   
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMN, DEPTNO 
  FROM EMP;
  
--3. 동일한 데이터는 한 번만 조회하기.
--      DISTINCT
 SELECT DISTINCT JOB 
   FROM EMP;
  


  


