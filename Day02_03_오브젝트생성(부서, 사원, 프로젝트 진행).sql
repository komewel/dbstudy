DROP TABLE PROCEEDING;
DROP TABLE EMPLOYEE;
DROP TABLE DEPARTMENT;
DROP TABLE PROJECT;

CREATE TABLE DEPARTMENT (

    DEPT_NO         VARCHAR2(15 BYTE) NOT NULL,
    DEPT_NAME       VARCHAR2(30 BYTE) NULL,
    DEPT_LOCATION   VARCHAR2(50 BYTE) NULL,
    CONSTRAINT      PK_DEPARTMENT PRIMARY KEY(DEPT_NO)
);    

CREATE TABLE EMPLOYEE (

    EMP_NO          NUMBER            NOT NULL,
    DEPT_NO         VARCHAR2(15 BYTE) NULL,
    POSITION        CHAR(10 BYTE)     NULL,
    NAME            VARCHAR2(15 BYTE) NULL,
    HIRE_DATE       DATE              NULL,
    SALARY          NUMBER            NULL,
    CONSTRAINT      PK_EMPLOYEE PRIMARY KEY(EMP_NO),
    CONSTRAINT      FK_EMPLOYEE_DEPARTMENT FOREIGN KEY(DEPT_NO) REFERENCES DEPARTMENT(DEPT_NO) ON DELETE SET NULL --부서가 없어지면 사원의 부서정보만 NULL 처리가 된다
); 

CREATE TABLE PROJECT (

    PJT_NO         NUMBER            NOT NULL,
    PJT_NAME       VARCHAR2(30 BYTE) NULL,
    BEGIN_DATE     DATE              NULL,
    END_DATE       DATE              NULL,
    CONSTRAINT     PK_PROJECT PRIMARY KEY(PJT_NO)
);

CREATE TABLE PROCEEDING (

    PCD_NO        NUMBER NOT NULL,
    EMP_NO        NUMBER NULL,
    PJT_NO        NUMBER NULL,
    PJT_STATE     NUMBER NOT NULL,
    CONSTRAINT    FK_PROCEEDING_EMPLOYEE FOREIGN KEY(EMP_NO) REFERENCES EMPLOYEE(EMP_NO) ON DELETE SET NULL, --사원이 해고되면 진행하는 진척된 기술개발 에서 사원번호NULL 처리가 된다.
    CONSTRAINT    FK_PROCEEDING_PROJECT FOREIGN KEY(PJT_NO) REFERENCES PROJECT(PJT_NO) ON DELETE SET NULL --프로젝트가 없어지면 진척도(개발되는 기술 진척도)는 남고 프로젝트만 NULL 처리가 된다.
);    

