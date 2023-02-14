CREATE OR REPLACE FUNCTION --PK로 설정할 칼럼,연관지을 테이블과 PK연결짓기
RETURN --반환하는값의 타입을정해준다
IS     --특정 테이블에서 가져오는 칼럼을 타입 그대로 가져와서 별명을 설정한다.
       --이 메소드에서 쓰여질 재료가 모이는 곳같은 느낌
    
BEGIN  --본문에 해당한다 여기는  
    SELECT --복사할 테이블의 칼럼을 적고
      INTO --붙여넣기할 칼럼위에 적힌 칼럼 정보를 여기다 넣어주는 느낌 
      FROM --복사할 칼럼 테이블 출처
     WHERE --복사할 테이블과 붙여넣기할 테이블 PK로 연관짓기
     RETURN --반환할 데이터 종류와 양식
     
     END;
    
