-- 생성자 Oracle SQL Developer Data Modeler 21.2.0.165.1515
--   위치:        2021-10-12 17:17:05 KST
--   사이트:      Oracle Database 11g
--   유형:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE board (
    bno      NUMBER NOT NULL,
    id       VARCHAR2(30 BYTE) NOT NULL,
    nickname VARCHAR2(50 BYTE) NOT NULL,
    trade    NUMBER(1) NOT NULL,
    title    VARCHAR2(100) NOT NULL,
    content  VARCHAR2(500 BYTE) NOT NULL,
    pick     CHAR(1)
);

ALTER TABLE board ADD CONSTRAINT board_pk PRIMARY KEY ( bno );

CREATE TABLE board_file_list (
    fno            NUMBER NOT NULL,
    bno            NUMBER NOT NULL,
    nickname       VARCHAR2(30),
    path           VARCHAR2(300 BYTE),
    originfilename VARCHAR2(100 BYTE)
);

ALTER TABLE board_file_list ADD CONSTRAINT board_file_list_pk PRIMARY KEY ( fno );

CREATE TABLE buy_list (
    id       VARCHAR2(30 BYTE) NOT NULL,
    nickname VARCHAR2(50) NOT NULL,
    buyno    NUMBER NOT NULL,
    bno      NUMBER NOT NULL
);

ALTER TABLE buy_list ADD CONSTRAINT buy_list_pk PRIMARY KEY ( buyno );

CREATE TABLE member (
    id       VARCHAR2(30 BYTE) NOT NULL,
    password VARCHAR2(50 BYTE),
    email    VARCHAR2(100 BYTE),
    tell     VARCHAR2(12 BYTE),
    grade    NUMBER(2),
    nickname VARCHAR2(50 BYTE) NOT NULL,
    point    NUMBER(4)
);

ALTER TABLE member ADD CONSTRAINT member_pk PRIMARY KEY ( id,
                                                          nickname );

CREATE TABLE review (
    rno            NUMBER,
    id             VARCHAR2(30) NOT NULL,
    nickname       VARCHAR2(50) NOT NULL,
    review_content VARCHAR2(100),
    review_point   NUMBER(1)
);

CREATE TABLE sell_list (
    id       VARCHAR2(30 BYTE) NOT NULL,
    nickname VARCHAR2(50 BYTE) NOT NULL,
    sellno   NUMBER NOT NULL,
    bno      NUMBER NOT NULL
);

ALTER TABLE sell_list ADD CONSTRAINT sell_list_pk PRIMARY KEY ( sellno );

ALTER TABLE board_file_list
    ADD CONSTRAINT board_file_list_board_fk FOREIGN KEY ( bno )
        REFERENCES board ( bno )
            ON DELETE CASCADE;

ALTER TABLE board
    ADD CONSTRAINT board_member_fk FOREIGN KEY ( id,
                                                 nickname )
        REFERENCES member ( id,
                            nickname )
            ON DELETE CASCADE;

ALTER TABLE buy_list
    ADD CONSTRAINT buy_list_board_fk FOREIGN KEY ( bno )
        REFERENCES board ( bno )
            ON DELETE CASCADE;

ALTER TABLE buy_list
    ADD CONSTRAINT buy_list_member_fk FOREIGN KEY ( id,
                                                    nickname )
        REFERENCES member ( id,
                            nickname )
            ON DELETE CASCADE;

ALTER TABLE review
    ADD CONSTRAINT review_member_fk FOREIGN KEY ( id,
                                                  nickname )
        REFERENCES member ( id,
                            nickname )
            ON DELETE CASCADE;

ALTER TABLE sell_list
    ADD CONSTRAINT sell_list_board_fk FOREIGN KEY ( bno )
        REFERENCES board ( bno )
            ON DELETE CASCADE;

ALTER TABLE sell_list
    ADD CONSTRAINT sell_list_member_fk FOREIGN KEY ( id,
                                                     nickname )
        REFERENCES member ( id,
                            nickname )
            ON DELETE CASCADE;



-- Oracle SQL Developer Data Modeler 요약 보고서: 
-- 
-- CREATE TABLE                             6
-- CREATE INDEX                             0
-- ALTER TABLE                             12
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
