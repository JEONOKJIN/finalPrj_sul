----아래는 system 계정에서 실행한 내용
--CREATE USER C##SUL IDENTIFIED BY 1234;
--GRANT CONNECT , RESOURCE TO C##SUL;
--ALTER USER C##SUL DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS;
------------------------------------------------------------------------
--------------------테이블 삭제---------------------------------------
DROP TABLE ADMIN CASCADE CONSTRAINTS;
DROP TABLE NOTICE CASCADE CONSTRAINTS;
DROP TABLE CUSTOMER_CENTER CASCADE CONSTRAINTS;
DROP TABLE DELIVERY CASCADE CONSTRAINTS;
DROP TABLE DELIVERY_STATUS CASCADE CONSTRAINTS;

DROP TABLE PRODUCT CASCADE CONSTRAINTS;
DROP TABLE ORDERS CASCADE CONSTRAINTS;
DROP TABLE ORDERS_LIST CASCADE CONSTRAINTS;
DROP TABLE CART CASCADE CONSTRAINTS;
DROP TABLE TYPE CASCADE CONSTRAINTS;

DROP TABLE MEMBER CASCADE CONSTRAINTS;
DROP TABLE ADDRESS CASCADE CONSTRAINTS;
DROP TABLE REVIEW CASCADE CONSTRAINTS;
DROP TABLE COMMUNITY CASCADE CONSTRAINTS;
DROP TABLE COMMUNITY_COMMT CASCADE CONSTRAINTS;
DROP TABLE COMMUNITY_CATEGORY CASCADE CONSTRAINTS;

------------------------시퀀스 삭제----------------------------------
DROP SEQUENCE SEQ_ADMIN_NO;
DROP SEQUENCE SEQ_NOTICE_NO;
DROP SEQUENCE SEQ_Q_NO;
DROP SEQUENCE SEQ_DELIVERY_NO;
DROP SEQUENCE SEQ_DELIVERY_STATUS_NO;

DROP SEQUENCE SEQ_PRODUCT_NO;
DROP SEQUENCE SEQ_ORDER_NO;
DROP SEQUENCE SEQ_ORDER_LIST_NO;
DROP SEQUENCE SEQ_CART_NO;
DROP SEQUENCE SEQ_TYPE_NO;

DROP SEQUENCE SEQ_MEMBER_NO;
DROP SEQUENCE SEQ_ADDRESS_NO;
DROP SEQUENCE SEQ_REVIEW_NO;
DROP SEQUENCE SEQ_COMMUNITY_NO;
DROP SEQUENCE SEQ_COMMUNITY_COMMT_NO;
DROP SEQUENCE SEQ_COMMUNITY_CATEGORY_NO;




------------------------시퀀스 생성----------------------------------
--옥진
CREATE SEQUENCE SEQ_ADMIN_NO MINVALUE 1 NOCYCLE NOCACHE;
CREATE SEQUENCE SEQ_NOTICE_NO MINVALUE 1 NOCYCLE NOCACHE;
CREATE SEQUENCE SEQ_Q_NO MINVALUE 1 NOCYCLE NOCACHE;
CREATE SEQUENCE SEQ_DELIVERY_NO MINVALUE 1 NOCYCLE NOCACHE;
CREATE SEQUENCE SEQ_DELIVERY_STATUS_NO MINVALUE 1 NOCYCLE NOCACHE;

--광포
CREATE SEQUENCE SEQ_PRODUCT_NO MINVALUE 1 NOCYCLE NOCACHE;
CREATE SEQUENCE SEQ_ORDER_NO MINVALUE 1 NOCYCLE NOCACHE;
CREATE SEQUENCE SEQ_ORDER_LIST_NO MINVALUE 1 NOCYCLE NOCACHE;
CREATE SEQUENCE SEQ_CART_NO MINVALUE 1 NOCYCLE NOCACHE;
CREATE SEQUENCE SEQ_TYPE_NO MINVALUE 1 NOCYCLE NOCACHE;



--지우
CREATE SEQUENCE SEQ_MEMBER_NO MINVALUE 1 NOCYCLE NOCACHE;
CREATE SEQUENCE SEQ_ADDRESS_NO MINVALUE 1 NOCYCLE NOCACHE;
CREATE SEQUENCE SEQ_REVIEW_NO MINVALUE 1 NOCYCLE NOCACHE;
CREATE SEQUENCE SEQ_COMMUNITY_NO MINVALUE 1 NOCYCLE NOCACHE;
CREATE SEQUENCE SEQ_COMMUNITY_COMMT_NO MINVALUE 1 NOCYCLE NOCACHE;
CREATE SEQUENCE SEQ_COMMUNITY_CATEGORY_NO MINVALUE 1 NOCYCLE NOCACHE;


------------------------테이블 생성----------------------------------
--옥진
CREATE TABLE ADMIN (
    ADMIN_NO        NUMBER                           PRIMARY KEY
    , ADMIN_ID       VARCHAR2(20)                    NOT NULL
    , ADMIN_PWD      VARCHAR2(100)                    NOT NULL
    , ADMIN_NAME     VARCHAR2(20)                    NULL
    , DEL_YN         CHAR(1)       DEFAULT 'N'       NULL
    , ENROLL_DATE    TIMESTAMP     DEFAULT SYSDATE   NULL
);

CREATE TABLE NOTICE (
   NOTICE_NO        NUMBER                          NOT NULL
   , ADMIN_NO       NUMBER                          NOT NULL
   , TITLE          VARCHAR2(100)                   NULL
   , CONTENT        VARCHAR2(2000)                   NULL
   , INQUIRY        NUMBER                          NULL
   , ENROLL_DATE    TIMESTAMP     DEFAULT SYSDATE   NULL
   , UPDATE_DATE    VARCHAR2(1000)                  NULL
   , DEL_YN         CHAR(1)       DEFAULT 'N'       NULL        
);

CREATE TABLE CUSTOMER_CENTER (
   Q_NO             NUMBER                              PRIMARY KEY
    , MEMBER_NO     NUMBER                              NOT NULL
    , Q_TITLE       VARCHAR2(100)                       NOT NULL
    , Q_CONTENT     VARCHAR2(2000)                      NOT NULL
    , Q_DATE        TIMESTAMP       DEFAULT SYSDATE     NULL
    , Q_IMG         VARCHAR2(2000)                      NULL
    , ADMIN_NO      NUMBER                              NULL
    , A_CONTENT     VARCHAR2(2000)                      NULL
    , A_DATE        VARCHAR2(1000)                      NULL
    , A_YN          CHAR(1)         DEFAULT 'N'         NULL
);

CREATE TABLE DELIVERY (
   DELIVERY_NO               NUMBER                         PRIMARY KEY
    , DELIVERY_STATUS_NO     NUMBER      DEFAULT 1          NOT NULL
    , ORDER_NO               NUMBER                         NOT NULL
    , DELIVERY_START_DATE    TIMESTAMP   DEFAULT SYSDATE    NULL
    , DELIVERY_FINISH_DATE   VARCHAR2(1000)                 NULL
    , ADDRESS_NO             NUMBER                         NOT NULL
);


CREATE TABLE DELIVERY_STATUS (
   DELIVERY_STATUS_NO   NUMBER            PRIMARY KEY
    , DELIVERY_STATUS   VARCHAR2(20)      NULL
);


--광포
CREATE TABLE PRODUCT (
    PRODUCT_NO       NUMBER              PRIMARY KEY,
    TYPE_NO          NUMBER              NOT NULL,
    NAME             VARCHAR2(100)       NOT NULL,
    PRICE            NUMBER              NOT NULL,
    DEGREE           NUMBER              NOT NULL,
    CAPACITY         NUMBER              NOT NULL,
    EXPIRY_DATE      VARCHAR2(100)       NOT NULL,
    IMAGE            VARCHAR2(1000)      NULL,
    ENROLL_DATE      TIMESTAMP           DEFAULT SYSDATE     NOT NULL,
    DEL_YN           CHAR(1)             DEFAULT 'N'         NULL,
    STORAGE          VARCHAR2(100)       NOT NULL,
    TASTE            VARCHAR2(100)       NOT NULL,
    APPETIZER        VARCHAR2(100)       NOT NULL
);

CREATE TABLE TYPE (
    TYPE_NO          NUMBER              PRIMARY KEY,
    NAME             VARCHAR2(100)       NOT NULL
);

CREATE TABLE ORDERS (
    ORDER_NO        NUMBER              PRIMARY KEY,
    MEMBER_NO       NUMBER              NOT NULL,
    ENROLL_DATE     TIMESTAMP           DEFAULT SYSDATE,
    CANCLE_DATE     TIMESTAMP           NULL
);

CREATE TABLE ORDERS_LIST (
    ORDER_LIST_NO    NUMBER             PRIMARY KEY,
    ORDER_NO         NUMBER             NOT NULL,
    PRODUCT_NO       NUMBER             NOT NULL,
    QUANTITY         NUMBER             NOT NULL
);

CREATE TABLE CART (
    CART_NO         NUMBER              PRIMARY KEY,
    MEMBER_NO       NUMBER              NOT NULL,
    PRODUCT_NO      NUMBER              NOT NULL,
    NAME            VARCHAR2(100)       NOT NULL,
    PRICE           NUMBER              NOT NULL,
    CAPACITY        NUMBER              NOT NULL,
    CNT             NUMBER              NOT NULL
);

--지우
CREATE TABLE MEMBER (
   MEMBER_NO       NUMBER           PRIMARY KEY,
   ADDRESS_NO NUMBER        NULL,
   NAME           VARCHAR2(10)   NULL,
   ID               VARCHAR2(10)   NOT NULL,
   PWD               VARCHAR2(100)   NULL,
   EMAIL           VARCHAR2(100)   NULL,
   NICK           VARCHAR2(100)   NULL,
   TEL               CHAR(13)       NULL,
   AGE              VARCHAR2(8)     NULL,
   ENROLL_DATE       TIMESTAMP       DEFAULT SYSDATE,
   MODIFY_DATE    TIMESTAMP       DEFAULT SYSDATE,
   DEL_YN         CHAR(1)        DEFAULT 'N'       NOT NULL   
);

CREATE TABLE ADDRESS (
   ADDRESS_NO   NUMBER           PRIMARY KEY,
   ADDRESS    VARCHAR2(100)   NULL,
   DEL_YN      CHAR(1)        DEFAULT 'N'  NOT NULL,
   MEMBER_NO   NUMBER          NOT NULL
);

CREATE TABLE REVIEW (
   REVIEW_NO       NUMBER           PRIMARY KEY,
   CONTENT           VARCHAR2(100)   NULL,
   ENROLL_DATE       TIMESTAMP       DEFAULT SYSDATE,
   IMG            VARCHAR2(100)   NULL,
   MEMBER_NO       NUMBER           NOT NULL,
   RATING           NUMBER           NULL,
   ORDER_LIST_NO       NUMBER           NOT NULL,
    DEL_YN         CHAR(1)        DEFAULT 'N'    NOT NULL   
);

CREATE TABLE COMMUNITY (
   COMMUNITY_NO   NUMBER           PRIMARY KEY,
   TITLE           VARCHAR2(100)   NULL,
   CONTENT           VARCHAR2(300)   NULL,
   ENROLL_DATE    TIMESTAMP      DEFAULT SYSDATE,
   DEL_YN         CHAR(1)        DEFAULT 'N'    NOT NULL,   
   IMG               VARCHAR2(100)   NULL,
   MEMBER_NO       NUMBER           NOT NULL,
   MODIFY_DATE       TIMESTAMP       DEFAULT SYSDATE,
  COMMUNITY_CATEGORY_NO     NUMBER          NOT NULL
);

CREATE TABLE COMMUNITY_COMMT (
   COMMUNITY_COMMT_NO       NUMBER           PRIMARY KEY,
   CONTENT           VARCHAR2(100)   NULL,
   DEL_YN         CHAR(1)        DEFAULT 'N'    NOT NULL,
   ENROLL_DATE       TIMESTAMP   DEFAULT SYSDATE,
   COMMUNITY_NO   NUMBER   NOT NULL,
   MEMBER_NO        NUMBER  NOT NULL
);

CREATE TABLE COMMUNITY_CATEGORY (
   COMMUNITY_CATEGORY_NO       NUMBER           PRIMARY KEY,
   NAME           VARCHAR2(100)   NULL,
   DEL_YN         CHAR(1)        DEFAULT 'N'    NOT NULL
);




---------------------------제약조건----------------------------------
--옥진
ALTER TABLE "NOTICE" ADD CONSTRAINT "FK_ADMIN_TO_NOTICE_1" FOREIGN KEY ("ADMIN_NO")
REFERENCES "ADMIN" ("ADMIN_NO");

ALTER TABLE "CUSTOMER_CENTER" ADD CONSTRAINT "FK_MEMBER_TO_CUSTOMER_CENTER_1" FOREIGN KEY ("MEMBER_NO")
REFERENCES "MEMBER" ("MEMBER_NO");

ALTER TABLE "CUSTOMER_CENTER" ADD CONSTRAINT "FK_ADMIN_TO_CUSTOMER_CENTER_1" FOREIGN KEY ("ADMIN_NO")
REFERENCES "ADMIN" ("ADMIN_NO");

ALTER TABLE "DELIVERY" ADD CONSTRAINT "FK_DELIVERY_STATUS_TO_DELIVERY_1" FOREIGN KEY ("DELIVERY_STATUS_NO")
REFERENCES "DELIVERY_STATUS" ("DELIVERY_STATUS_NO");

ALTER TABLE "DELIVERY" ADD CONSTRAINT "FK_ORDERS_TO_DELIVERY_1" FOREIGN KEY ("ORDER_NO")
REFERENCES "ORDERS" ("ORDER_NO");

ALTER TABLE "DELIVERY" ADD CONSTRAINT "FK_ADDRESS_TO_DELIVERY_1" FOREIGN KEY ("ADDRESS_NO")
REFERENCES "ADDRESS" ("ADDRESS_NO");


--광포
ALTER TABLE "PRODUCT" ADD CONSTRAINT "FK_TYPE_TO_PRODUCT_1" FOREIGN KEY ("TYPE_NO")
REFERENCES "TYPE" ("TYPE_NO");

ALTER TABLE "ORDERS" ADD CONSTRAINT "FK_MEMBER_TO_ORDERS_1" FOREIGN KEY ("MEMBER_NO")
REFERENCES "MEMBER" ("MEMBER_NO");

ALTER TABLE "ORDERS_LIST" ADD CONSTRAINT "FK_ORDERS_TO_ORDER_LIST_1" FOREIGN KEY ("ORDER_NO")
REFERENCES "ORDERS" ("ORDER_NO");

ALTER TABLE "ORDERS_LIST" ADD CONSTRAINT "FK_PRODUCT_TO_ORDER_LIST_1" FOREIGN KEY ("PRODUCT_NO")
REFERENCES "PRODUCT" ("PRODUCT_NO");

ALTER TABLE "CART" ADD CONSTRAINT "FK_MEMBER_TO_CART_1" FOREIGN KEY ("MEMBER_NO")
REFERENCES "MEMBER" ("MEMBER_NO");
ALTER TABLE "CART" ADD CONSTRAINT "FK_PRODUCT_TO_CART_1" FOREIGN KEY ("PRODUCT_NO")
REFERENCES "PRODUCT" ("PRODUCT_NO");


--지우
ALTER TABLE "REVIEW" ADD CONSTRAINT "FK_ORDERS_LIST_TO_REVIEW_1" FOREIGN KEY ("ORDER_LIST_NO")
REFERENCES "ORDERS_LIST" ("ORDER_LIST_NO");

ALTER TABLE "REVIEW" ADD CONSTRAINT "FK_MEMBER_TO_REVIEW_1" FOREIGN KEY ("MEMBER_NO")
REFERENCES "MEMBER" ("MEMBER_NO");

ALTER TABLE "ADDRESS" ADD CONSTRAINT "FK_MEMBER_TO_ADDRESS_1" FOREIGN KEY ("MEMBER_NO")
REFERENCES "MEMBER" ("MEMBER_NO");

ALTER TABLE "MEMBER" ADD CONSTRAINT "FK_ADDRESS_TO_MEMBER_1" FOREIGN KEY ("ADDRESS_NO")
REFERENCES "ADDRESS" ("ADDRESS_NO");

ALTER TABLE "COMMUNITY" ADD CONSTRAINT "FK_MEMBER_TO_COMMUNITY_1" FOREIGN KEY ("MEMBER_NO")
REFERENCES "MEMBER" ("MEMBER_NO");


ALTER TABLE "COMMUNITY_COMMT" ADD CONSTRAINT "FK_COMMUNITY_TO_COMMUNITY_COMMT_1" FOREIGN KEY ("COMMUNITY_NO")
REFERENCES "COMMUNITY" ("COMMUNITY_NO");

ALTER TABLE "COMMUNITY_COMMT" ADD CONSTRAINT "FK_MEMBER_TO_COMMUNITY_COMMT_1" FOREIGN KEY ("MEMBER_NO")
REFERENCES "MEMBER" ("MEMBER_NO");


ALTER TABLE "COMMUNITY" ADD CONSTRAINT "FK_COMMUNITY_CATEGORY_TO_COMMUNITY_1" FOREIGN KEY ("COMMUNITY_CATEGORY_NO")
REFERENCES "COMMUNITY_CATEGORY" ("COMMUNITY_CATEGORY_NO");



-----------------더미데이터-----------------------------------------------------------------------------------------
--지우
---MEMBER
INSERT INTO MEMBER (MEMBER_NO, NAME, ID, PWD, EMAIL, NICK, TEL, AGE, DEL_YN) VALUES (SEQ_MEMBER_NO.NEXTVAL, '김철수', 'user01', '1234!', 'aaa1@naver.com', '철수', '010-1111-1111', '19900101', 'N');
INSERT INTO MEMBER (MEMBER_NO, NAME, ID, PWD, EMAIL, NICK, TEL, AGE, DEL_YN) VALUES (SEQ_MEMBER_NO.NEXTVAL, '이영희', 'user02', '1232!', 'aaa2@naver.com', '영희', '010-1111-1112', '19900202', 'N');
INSERT INTO MEMBER (MEMBER_NO, NAME, ID, PWD, EMAIL, NICK, TEL, AGE, DEL_YN) VALUES (SEQ_MEMBER_NO.NEXTVAL, '박민수', 'user03', '1233!', 'aaa3@naver.com', '민수', '010-1111-1113', '19900303', 'N');
INSERT INTO MEMBER (MEMBER_NO, NAME, ID, PWD, EMAIL, NICK, TEL, AGE, DEL_YN) VALUES (SEQ_MEMBER_NO.NEXTVAL, '정지영', 'user04', '1235!', 'aaa4@naver.com', '지영', '010-1111-1114', '19900404', 'N');
INSERT INTO MEMBER (MEMBER_NO, NAME, ID, PWD, EMAIL, NICK, TEL, AGE, DEL_YN) VALUES (SEQ_MEMBER_NO.NEXTVAL, '이현우', 'user05', '1234', 'aaa5@naver.com', '현우', '010-1111-1115', '19900505', 'N');
INSERT INTO MEMBER (MEMBER_NO, NAME, ID, PWD, EMAIL, NICK, TEL, AGE, DEL_YN) VALUES (SEQ_MEMBER_NO.NEXTVAL, '김미정', 'user06', '1234', 'aaa6@naver.com', '김미', '010-1111-1116', '19900606', 'N');
INSERT INTO MEMBER (MEMBER_NO, NAME, ID, PWD, EMAIL, NICK, TEL, AGE, DEL_YN) VALUES (SEQ_MEMBER_NO.NEXTVAL, '이준호', 'user07', '1234', 'aaa7@naver.com', '이신', '010-1111-1117', '19900707', 'N');
INSERT INTO MEMBER (MEMBER_NO, NAME, ID, PWD, EMAIL, NICK, TEL, AGE, DEL_YN) VALUES (SEQ_MEMBER_NO.NEXTVAL, '이순신', 'user08', '1234', 'aaa8@naver.com', '희영', '010-1111-1118', '19900808', 'N');
INSERT INTO MEMBER (MEMBER_NO, NAME, ID, PWD, EMAIL, NICK, TEL, AGE, DEL_YN) VALUES (SEQ_MEMBER_NO.NEXTVAL, '김영희', 'user09', '1234', 'aaa9@naver.com', '호준', '010-1111-1119', '19900909', 'N');
INSERT INTO MEMBER (MEMBER_NO, NAME, ID, PWD, EMAIL, NICK, TEL, AGE, DEL_YN) VALUES (SEQ_MEMBER_NO.NEXTVAL, '박성수', 'user10', '1234', 'aaa10@naver.com', '수성', '010-1111-1120', '19901010', 'N');
INSERT INTO MEMBER (MEMBER_NO, NAME, ID, PWD, EMAIL, NICK, TEL, AGE, DEL_YN) VALUES (SEQ_MEMBER_NO.NEXTVAL, '정하늘', 'user11', '1234', 'aaa11@naver.com', '늘하', '010-1111-1121', '19901111', 'N');
INSERT INTO MEMBER (MEMBER_NO, NAME, ID, PWD, EMAIL, NICK, TEL, AGE, DEL_YN) VALUES (SEQ_MEMBER_NO.NEXTVAL, '김지영', 'user12', '1234', 'aaa12@naver.com', '영지', '010-1111-1122', '19901212', 'N');
INSERT INTO MEMBER (MEMBER_NO, NAME, ID, PWD, EMAIL, NICK, TEL, AGE, DEL_YN) VALUES (SEQ_MEMBER_NO.NEXTVAL, '이현석', 'user13', '1234', 'aaa13@naver.com', '이석', '010-1111-1123', '19910101', 'N');
INSERT INTO MEMBER (MEMBER_NO, NAME, ID, PWD, EMAIL, NICK, TEL, AGE, DEL_YN) VALUES (SEQ_MEMBER_NO.NEXTVAL, '박민지', 'user14', '1234', 'aaa14@naver.com', '지민', '010-1111-1124', '19920202', 'N');
INSERT INTO MEMBER (MEMBER_NO, NAME, ID, PWD, EMAIL, NICK, TEL, AGE, DEL_YN) VALUES (SEQ_MEMBER_NO.NEXTVAL, '최성호', 'user15', '1234', 'aaa15@naver.com', '호성', '010-1111-1125', '19930303', 'N');

--ADDRESS
INSERT INTO ADDRESS (ADDRESS_NO, ADDRESS, DEL_YN, MEMBER_NO) VALUES (SEQ_ADDRESS_NO.NEXTVAL, '서울특별시 강남구 역삼동 123-45', 'N', 1);
INSERT INTO ADDRESS (ADDRESS_NO, ADDRESS, DEL_YN, MEMBER_NO) VALUES (SEQ_ADDRESS_NO.NEXTVAL, '경기도 성남시 분당구 정자동 678-90', 'N', 2);
INSERT INTO ADDRESS (ADDRESS_NO, ADDRESS, DEL_YN, MEMBER_NO) VALUES (SEQ_ADDRESS_NO.NEXTVAL, '인천광역시 남동구 도화동 321-54', 'N', 3);
INSERT INTO ADDRESS (ADDRESS_NO, ADDRESS, DEL_YN, MEMBER_NO) VALUES (SEQ_ADDRESS_NO.NEXTVAL, '부산광역시 해운대구 우동 987-65', 'N', 4);
INSERT INTO ADDRESS (ADDRESS_NO, ADDRESS, DEL_YN, MEMBER_NO) VALUES (SEQ_ADDRESS_NO.NEXTVAL, '대구광역시 수성구 황금동 234-87', 'N', 5);
INSERT INTO ADDRESS (ADDRESS_NO, ADDRESS, DEL_YN, MEMBER_NO) VALUES (SEQ_ADDRESS_NO.NEXTVAL, '광주광역시 서구 화정동 876-32', 'N', 6);
INSERT INTO ADDRESS (ADDRESS_NO, ADDRESS, DEL_YN, MEMBER_NO) VALUES (SEQ_ADDRESS_NO.NEXTVAL, '대전광역시 중구 대흥동 543-21', 'N', 7);
INSERT INTO ADDRESS (ADDRESS_NO, ADDRESS, DEL_YN, MEMBER_NO) VALUES (SEQ_ADDRESS_NO.NEXTVAL, '울산광역시 남구 삼산동 1098-76', 'N', 8);
INSERT INTO ADDRESS (ADDRESS_NO, ADDRESS, DEL_YN, MEMBER_NO) VALUES (SEQ_ADDRESS_NO.NEXTVAL, '세종특별자치시 도담동 456-78', 'N', 9);
INSERT INTO ADDRESS (ADDRESS_NO, ADDRESS, DEL_YN, MEMBER_NO) VALUES (SEQ_ADDRESS_NO.NEXTVAL, '강원도 원주시 일산동 789-01', 'N', 10);
INSERT INTO ADDRESS (ADDRESS_NO, ADDRESS, DEL_YN, MEMBER_NO) VALUES (SEQ_ADDRESS_NO.NEXTVAL, '충청북도 청주시 흥덕구 복대동 234-56', 'N', 11);
INSERT INTO ADDRESS (ADDRESS_NO, ADDRESS, DEL_YN, MEMBER_NO) VALUES (SEQ_ADDRESS_NO.NEXTVAL, '전라북도 전주시 완산구 효자동 789-12', 'N', 12);
INSERT INTO ADDRESS (ADDRESS_NO, ADDRESS, DEL_YN, MEMBER_NO) VALUES (SEQ_ADDRESS_NO.NEXTVAL, '전라남도 목포시 용당동 321-65', 'N', 13);
INSERT INTO ADDRESS (ADDRESS_NO, ADDRESS, DEL_YN, MEMBER_NO) VALUES (SEQ_ADDRESS_NO.NEXTVAL, '경상북도 포항시 북구 오천동 654-23', 'N', 14);
INSERT INTO ADDRESS (ADDRESS_NO, ADDRESS, DEL_YN, MEMBER_NO) VALUES (SEQ_ADDRESS_NO.NEXTVAL, '경상남도 창원시 마산합포구 교방동 987-34', 'N', 15);



INSERT INTO COMMUNITY_CATEGORY (COMMUNITY_CATEGORY_NO, NAME, DEL_YN) VALUES (SEQ_COMMUNITY_CATEGORY_NO.NEXTVAL, '술', 'N');
INSERT INTO COMMUNITY_CATEGORY (COMMUNITY_CATEGORY_NO, NAME, DEL_YN) VALUES (SEQ_COMMUNITY_CATEGORY_NO.NEXTVAL, '안주', 'N');

---COMMUNITY
INSERT INTO COMMUNITY (COMMUNITY_NO, TITLE, CONTENT, DEL_YN, IMG, MEMBER_NO, COMMUNITY_CATEGORY_NO) VALUES (SEQ_COMMUNITY_NO.NEXTVAL, '맥주와 치킨', '맥주 한 잔과 치킨은 최고의 조합이죠! 여러분이 즐겨 마시는 맥주와 치킨을 소개해주세요.', 'N', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\chicken.jpg', 1, 2);
INSERT INTO COMMUNITY (COMMUNITY_NO, TITLE, CONTENT, DEL_YN, IMG, MEMBER_NO, COMMUNITY_CATEGORY_NO) VALUES (SEQ_COMMUNITY_NO.NEXTVAL, '와인 추천', '요즘 와인을 즐겨마시나요? 나만의 와인 추천이 있다면 공유해주세요. 어울리는 안주도 함께 알려주세요!', 'N', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\dhkdls.jpg', 2, 1);
INSERT INTO COMMUNITY (COMMUNITY_NO, TITLE, CONTENT, DEL_YN, IMG, MEMBER_NO, COMMUNITY_CATEGORY_NO) VALUES  (SEQ_COMMUNITY_NO.NEXTVAL, '소주와 간장게장', '소주와 간장게장은 한국의 대표적인 조합 중 하나입니다. 어떤 소주와 어떤 간장게장이 좋은지 나눠보아요.', 'N', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\rkswkd.jpg', 3, 2);
INSERT INTO COMMUNITY (COMMUNITY_NO, TITLE, CONTENT, DEL_YN, IMG, MEMBER_NO, COMMUNITY_CATEGORY_NO) VALUES  (SEQ_COMMUNITY_NO.NEXTVAL, '맥주와 핫도그', '맥주에 어울리는 안주 중 하나인 핫도그를 소개합니다. 집에서 쉽게 만들 수 있는 레시피도 함께 공유해봐요!', 'N', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\rkswkd.jpg', 4, 2);
INSERT INTO COMMUNITY (COMMUNITY_NO, TITLE, CONTENT, DEL_YN, IMG, MEMBER_NO, COMMUNITY_CATEGORY_NO) VALUES  (SEQ_COMMUNITY_NO.NEXTVAL, '칵테일 레시피', '집에서 즐길 수 있는 간단한 칵테일 레시피를 소개합니다. 맛있는 칵테일을 마시며 특별한 시간을 만들어보세요.', 'N', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\zkr.jpg', 5, 1);
INSERT INTO COMMUNITY (COMMUNITY_NO, TITLE, CONTENT, DEL_YN, IMG, MEMBER_NO, COMMUNITY_CATEGORY_NO) VALUES  (SEQ_COMMUNITY_NO.NEXTVAL, '간단한 안주 아이디어', '술과 함께 즐기기 좋은 간단한 안주 아이디어를 나눠보아요. 여러분의 손맛을 자랑해주세요!', 'N', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\simple.jpg', 6, 2);
INSERT INTO COMMUNITY (COMMUNITY_NO, TITLE, CONTENT, DEL_YN, IMG, MEMBER_NO, COMMUNITY_CATEGORY_NO) VALUES  (SEQ_COMMUNITY_NO.NEXTVAL, '맥주와 피자', '맥주와 피자는 언제나 환상적인 조합입니다. 자주 시키는 피자 가게나 특별한 피자 레시피를 소개해주세요.', 'N', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\pizza.jpg', 7, 1);
INSERT INTO COMMUNITY (COMMUNITY_NO, TITLE, CONTENT, DEL_YN, IMG, MEMBER_NO, COMMUNITY_CATEGORY_NO) VALUES  (SEQ_COMMUNITY_NO.NEXTVAL, '와인과 치즈', '와인과 치즈의 조합은 어디서나 사랑받는 조합입니다. 가장 어울리는 와인과 치즈를 알려주세요!', 'N', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\cheese.jpg', 8, 1);
INSERT INTO COMMUNITY (COMMUNITY_NO, TITLE, CONTENT, DEL_YN, IMG, MEMBER_NO, COMMUNITY_CATEGORY_NO) VALUES  (SEQ_COMMUNITY_NO.NEXTVAL, '소주와 전', '한국 전통 안주인 전과 소주의 조합을 즐겨보세요. 전 종류와 맛있게 먹는 법을 나눠보아요.', 'N', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\jeon.jpg', 9, 1);
INSERT INTO COMMUNITY (COMMUNITY_NO, TITLE, CONTENT, DEL_YN, IMG, MEMBER_NO, COMMUNITY_CATEGORY_NO) VALUES  (SEQ_COMMUNITY_NO.NEXTVAL, '맥주와 감자튀김', '맥주에 딱 맞는 감자튀김을 소개합니다. 바삭하고 고소한 감자튀김 레시피를 공유해주세요!', 'N', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\can.jpg', 10, 2);
INSERT INTO COMMUNITY (COMMUNITY_NO, TITLE, CONTENT, DEL_YN, IMG, MEMBER_NO, COMMUNITY_CATEGORY_NO) VALUES  (SEQ_COMMUNITY_NO.NEXTVAL, '와인과 삼겹살', '와인과 삼겹살은 어색하지 않게 어울리는 조합입니다. 어떤 와인과 함께 삼겹살을 즐기는지 알려주세요.', 'N', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\pork.jpg', 11, 1);
INSERT INTO COMMUNITY (COMMUNITY_NO, TITLE, CONTENT, DEL_YN, IMG, MEMBER_NO, COMMUNITY_CATEGORY_NO) VALUES  (SEQ_COMMUNITY_NO.NEXTVAL, '소주와 김치', '한국인의 대표적인 음식인 김치와 소주는 정말 최고의 조합입니다. 김치 종류와 소주 브랜드를 소개해주세요.', 'N', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\soju.jpg', 12, 1);
INSERT INTO COMMUNITY (COMMUNITY_NO, TITLE, CONTENT, DEL_YN, IMG, MEMBER_NO, COMMUNITY_CATEGORY_NO) VALUES  (SEQ_COMMUNITY_NO.NEXTVAL, '맥주와 새우튀김', '맥주 한 잔과 함께 즐기기 좋은 새우튀김을 소개합니다. 집에서 만들기 쉬운 레시피도 함께 공유해봐요.', 'N', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\shrimp.jpg', 13, 1);
INSERT INTO COMMUNITY (COMMUNITY_NO, TITLE, CONTENT, DEL_YN, IMG, MEMBER_NO, COMMUNITY_CATEGORY_NO) VALUES  (SEQ_COMMUNITY_NO.NEXTVAL, '와인과 디저트', '와인과 함께하는 달콤한 디저트는 특별한 날에 어울립니다. 여러분이 좋아하는 와인과 디저트를 나눠주세요.', 'N', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\dhkdls.jpg', 14, 1);
INSERT INTO COMMUNITY (COMMUNITY_NO, TITLE, CONTENT, DEL_YN, IMG, MEMBER_NO, COMMUNITY_CATEGORY_NO) VALUES  (SEQ_COMMUNITY_NO.NEXTVAL, '소주와 떡볶이', '한국인의 소주 안주 중 하나인 떡볶이와 소주의 조합을 소개합니다. 집에서 떡볶이 어떻게 만들어먹는지 알려주세요.', 'N', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\soju.jpg', 15, 1);


INSERT INTO TYPE(TYPE_NO, NAME) VALUES(SEQ_TYPE_NO.NEXTVAL, '탁주');
INSERT INTO TYPE(TYPE_NO, NAME) VALUES(SEQ_TYPE_NO.NEXTVAL, '약.청주');
INSERT INTO TYPE(TYPE_NO, NAME) VALUES(SEQ_TYPE_NO.NEXTVAL, '과실주');
INSERT INTO TYPE(TYPE_NO, NAME) VALUES(SEQ_TYPE_NO.NEXTVAL, '증류주');

--제품
INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 1, '담은', 11000, 6.5, 750, '제조일로부터 3개월', 
'세워서 냉장 보관', '우유같이 부드러운 단맛', '매콤한 음식과 즐겨보세요!', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\Damun.jpg')
;
INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 1, '붉은 원숭이', 9000, 10.8, 375, '제조일로부터 1년', 
'세워서 냉장 보관', '카스테라 같이 부드럽고 달콤한 맛', '가벼운 안주류와 편하게 즐겨보세요!', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\redMonkey.jpg')
;
INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 1, '백련 미스티 살균 막걸리', 4500, 7.0, 375, '제조일로부터 1년', 
'상온 보관 가능', '달콤함, 산미, 고소한 맛이 은은하게 느껴져요', '대부분의 음식과 잘 어울려요', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\misty.jpg')
;
INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 1, '나주 탁주', 15000, 13.0, 500, '제조일로부터 90일', 
'냉장 보관', '묵직하고 달콤한 맛', '풍미가 강한 기름진 음식과 즐겨보세요!', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\Naju.jpg')
;
INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 1, '마실꾸지', 15000, 7.0, 750, '제조일로부터 30일', 
'냉장 보관', '라즈베리 주스와 같은 맛!', '묵직한 풍미의 음식과 드셔보세요', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\masilGoji.jpg')
;
INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 1, '막쿠루트', 6500, 6.0, 450, '제조일로부터 40일', 
'세워서 냉장 보관', '야쿠르트와 막걸리의 절묘한 조화!', '떡볶이와 잘어울려요~', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\makurutee.jpg')
;
INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 1, '구름을 벗삼아', 22000, 6.0, 750, '제조일로부터 45일', 
'세워서 냉장 보관', '부드럽고 시원하게 넘어가는 단맛', '매콤한 음식과 마시기 좋아요', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\cloud.jpg')
;
INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 1, '호호', 15000, 9.0, 375, '병입일로부터 3개월', 
'냉장 보관', '부드러운 질감과 구수함이 마치 호박죽을 떠올리게 해요', '수분감 넘치는 음식과 드셔보세요', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\HOHO.jpg')
;
INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 1, '문희', 27000, 13.0, 500, '제조일로부터 3개월', 
'세워서 냉장 보관', '묵직한 찹쌀의 단맛과 향!', '풍미가 짙은 육류와 잘 어울려요!', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\munHe.jpg')
;
INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 1, '너디 펀치', 9000, 5.0, 700, '제조일로부터 30일', 
'냉장 보관', '오렌지주스처럼 가벼운 새콤달콤함', '어린 시절 우리 입맛을 사로잡았던 음식과 함께', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\nerdyPunch.jpg')
;


INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 2, '고흥 유자주', 13000, 8.0, 500, '제조일로부터 10개월', 
'서늘한 곳 또는 냉장 보관', '유자차처럼 달콤한 맛', '디저트 타임 때 딱!', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\go.jpg')
;
INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 2, '서설', 15000, 13.0, 375, '유통기한 없음', 
'상온 보관', '물처럼 깔끔한 목넘김', '술맛처럼 담백한 음식과 드셔보세요', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\sul.jpg')
;
INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 2, '단상지교', 20000, 16.0, 750, '병입일로부터 6개월', 
'냉장 보관', '묵직한 구수함과 진득하게 달콤한 맛', '풍미가 강한 음식들과 즐겨 보세요', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\dansang.jpg')
;
INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 2, '매화깊은밤', 12000, 8.0, 375, '제조일로부터 2년', 
'상온 보관', '끈적임 없이 깔끔하게 넘어가는 매실의 달콤함', '진한 풍미의 음식과 잘 어울려요', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\mahaw.jpg')
;
INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 2, '동학', 3800, 13.0, 375, '병입일로부터 2년', 
'냉장 보관', '갓 지은 밥의 구수한 풍미를 느낄 수 있어요', '집에 있는 반찬들과 반주로 즐겨보세요', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\dong.jpg')
;
INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 2, '솔송주', 9000, 13.0, 375, '제조일로부터 1년', 
'직사광선을 피하고 서늘한 곳에 보관', '달지않고 시원하게 넘어가는 약주', '바다내음 가득한 해산물요리에 시원한 솔향을 곁들여봐요', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\solsong.jpg')
;
INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 2, '운암 1945', 33000, 12.0, 750, '병입일로부터 2년', 
'상온 보관 가능', '달콤하기보단 톡 쏘는 신맛이 혀를 자극해요', '담백한 생선회나 기름진 음식과 즐겨보세요', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\unam.jpg')
;
INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 2, '니노메', 11000, 11.0, 375, '병입일로부터 2년', 
'상온 보관 가능', '곡물의 고소함과 귤피의 씁쓸함이 돋보이는 약주', '간장 양념이 들어간 음식과 달짝지근하게 즐겨보세요', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\nimoma.jpg')
;
INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER , IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 2, '우포', 10000, 12.0, 500, '제조일로부터 2년', 
'상온 보관 가능', '달콤하면서도 누룽지같이 고소한 끝 맛', '달콤 짭짤한 양념이 배어있는 음식과 즐겨보세요', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\oppo.png')
;
commit;
INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 2, '송이주', 15000, 13.0, 750, '제조일로부터 3년', 
'상온 보관 가능', '산림욕을 하는 듯한 솔 내음을 가득 담았어요', '기름지고 풍미 짙은 요리와 즐겨보세요', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\song.jpg')
;


INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 3, '요새로제', 17900, 6.4, 750, '병입일로부터 2년 이내', 
'상온 보관', '라즈베리의 달짝지근한 향과 새콤한 맛', '담백하거나 살짝 달콤한 음식과 즐겨보세요', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\yoselose.jpg')
;
INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 3, '허니문배', 17900, 4.9, 750, '병입일로부터 2년 이내', 
'냉장 보관', '사과?배?꿀의 복합적인 풍미', '파티 식전주로 가볍게 즐겨보세요', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\honeymoon.jpg')
;
INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 3, '감싸주는 날', 12000, 16, 375, '제조일로부터 1년 이내', 
'냉장 보관', '단맛과 옅은 산미가 진득한 질감으로 입안을 감싸주는 술', '지방에서 비롯되는 고소한 풍미와 감칠맛을 가진 음식', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\gamssaju.jpg')
;
INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 3, '매실 향기 담은 술', 25920, 14.0, 500, '제조일로부터 3개월', 
'냉장 보관', '산뜻한 매실 풍미를 청량감 넘치게 즐겨보세요', '야들 야들한 생선회 한 점에 매향주 한 잔! 얼마나 맛있게요?', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\mesilsul.jpg')
;
INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 3, '만다린 약주', 15900, 12.0, 375, '제조일로부터 6개월', 
'냉장 보관', '계피차에 귤 과즙 한 숟갈 넣은 맛', '지방에서 비롯되는 고소한 풍미와 감칠맛을 가진 음식', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\mandarin.jpg')
;
INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 3, '신애유자', 5900, 5.0, 330, '제조일로부터 6개월', 
'상온 보관 가능', '레모네이드 같이 싱그러운 새콤함', '부담 없이 기름진 음식과 즐겨 보세요', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\sineyuja.jpg')
;
INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 3, '허니비', 29500, 8.0, 500, '유통기한 없음', 
'냉장 보관', '계피차에 귤 과즙 한 숟갈 넣은 맛', '지방에서 비롯되는 고소한 풍미와 감칠맛을 가진 음식', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\honeybee.jpg')
;
INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 3, '스윗마마', 5500, 5.5, 330, '병입일로부터 2년', 
'상온 보관 가능', '사과의 진한 달콤함과 시원한 탄산의 환상적인 콜라보', '달콤한 디저트와 가볍게 즐겨보세요', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\sweetmama.jpg')
;
INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 3, '혼디주', 8000, 12.0, 335, '유통기한 없음', 
'직사광선을 피하고 서늘한 곳에 보관', '감귤 계열의 새콤한 향과 달콤한 맛', '재료 본연의 맛이 느껴지는 음식과 잘 어울려요', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\hondiju.jpg')
;
INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 3, '제주, 유채', 12000, 14.0, 375, '유통기한 없음', 
'상온 보관 가능', '달콤한 화이트 와인을 연상시켜요', '감칠맛이 짙은 음식과 드셔보세요', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\jejuyuchae.jpg')
;


INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 4, '서울의 밤', 7900, 25.0, 375, '유통기한 없음', 
'상온 보관 가능', '깔끔하다라는 표현이 이보다 더 잘 어울리는 술이 있을까요?', '생선회와 함께하여 극강의 깔끔함을 느껴보세요', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\seoulbam.jpg')
;
INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 4, '가평 소주', 6500, 25.0, 360, '유통기한 없음', 
'상온 보관 가능', '청주를 마신 듯한 깔끔한 목 넘김', '가평 여행을 떠올리며 바비큐와 함께 즐겨보세요', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\gapyungsoju.jpg')
;
INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 4, '술샘', 12000, 16.0, 375, '유통기한 없음', 
'상온 보관 가능', '알코올 향 없이 편안하게 오미자의 풍미를 느껴보세요', '다채로운 맛을 내는 오미자처럼 다양하게 즐겨보세요', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\sulsaem.jpg')
;
INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 4, '안동소주 일품', 9600, 40.0, 350, '유통기한 없음', 
'상온 보관 가능', '고소한 국물 풍미가 일품!', '거절하기 힘든 맑은 국물 요리와의 조합', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\andongsoju.jpg')
;
INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 4, '진도 아리랑 홍주', 17900, 40.0, 375, '유통기한 없음', 
'상온 보관 가능', '달콤한 꽃, 과일 향과 코를 찌르는 듯한 짜릿함을 느낄 수 있어요', '기름진 음식을 깔끔하게 즐길 수 있도록 도와줘요', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\jindoarirang.jpg')
;
INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 4, '추사 40%', 67000, 40.0, 500, '유통기한 없음', 
'상온 보관 가능', '스모키한 오크향과 달콤한 사과향을 천천히 음미해보세요', '풍미 짙은 음식과 심플하면서도 화려하게 즐겨보세요', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\chusa.jpg')
;
INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 4, '겨울소주 25%', 10000, 25.0, 360, '유통기한 없음', 
'상온 보관 가능', '역한 맛 없이, 부드럽고 깔끔한 소주!', '취향에 맞게 다양한 음식과 즐겨보세요', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\gyulsoju.jpg')
;
INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 4, '문경바람 오크 40%', 30000, 40.0, 375, '유통기한 없음', 
'상온 보관 가능', '중후한 사과의 풍미를 잔잔하게 느껴보세요', '생선회 한점과 온더락 한 모금의 여유를 만끽해보세요', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\munkyungbaram.jpg')
;
INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 4, '모리', 9800, 19.0, 400, '유통기한 없음', 
'상온 보관 가능', '은은한 바닐라 향이 나면서 자극적이지 않은 맛이에요', '해산물 요리와 함께하기 좋아요', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\mory.jpg')
;
INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 4, '금설', 35000, 35.0, 375, '유통기한 없음', 
'상온 보관 가능', '달짝지근한 풍미에 매운맛이 추가됐어요', '구수하면서도 달짝지근한 요리와 함께 해보세요', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\geumsul.jpg')
;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 1, '담은', 11000, 6.5, 750, '제조일로부터 3개월', 
'세워서 냉장 보관', '우유같이 부드러운 단맛', '매콤한 음식과 즐겨보세요!', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\Damun.jpg')
;
INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 1, '붉은 원숭이', 9000, 10.8, 375, '제조일로부터 1년', 
'세워서 냉장 보관', '카스테라 같이 부드럽고 달콤한 맛', '가벼운 안주류와 편하게 즐겨보세요!', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\redMonkey.jpg')
;
INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 1, '백련 미스티 살균 막걸리', 4500, 7.0, 375, '제조일로부터 1년', 
'상온 보관 가능', '달콤함, 산미, 고소한 맛이 은은하게 느껴져요', '대부분의 음식과 잘 어울려요', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\misty.jpg')
;
INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 1, '나주 탁주', 15000, 13.0, 500, '제조일로부터 90일', 
'냉장 보관', '묵직하고 달콤한 맛', '풍미가 강한 기름진 음식과 즐겨보세요!', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\Naju.jpg')
;
INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 1, '마실꾸지', 15000, 7.0, 750, '제조일로부터 30일', 
'냉장 보관', '라즈베리 주스와 같은 맛!', '묵직한 풍미의 음식과 드셔보세요', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\masilGoji.jpg')
;
INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 1, '막쿠루트', 6500, 6.0, 450, '제조일로부터 40일', 
'세워서 냉장 보관', '야쿠르트와 막걸리의 절묘한 조화!', '떡볶이와 잘어울려요~', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\makurutee.jpg')
;
INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 1, '구름을 벗삼아', 22000, 6.0, 750, '제조일로부터 45일', 
'세워서 냉장 보관', '부드럽고 시원하게 넘어가는 단맛', '매콤한 음식과 마시기 좋아요', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\cloud.jpg')
;
INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 1, '호호', 15000, 9.0, 375, '병입일로부터 3개월', 
'냉장 보관', '부드러운 질감과 구수함이 마치 호박죽을 떠올리게 해요', '수분감 넘치는 음식과 드셔보세요', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\HOHO.jpg')
;
INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 1, '문희', 27000, 13.0, 500, '제조일로부터 3개월', 
'세워서 냉장 보관', '묵직한 찹쌀의 단맛과 향!', '풍미가 짙은 육류와 잘 어울려요!', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\munHe.jpg')
;
INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 1, '너디 펀치', 9000, 5.0, 700, '제조일로부터 30일', 
'냉장 보관', '오렌지주스처럼 가벼운 새콤달콤함', '어린 시절 우리 입맛을 사로잡았던 음식과 함께', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\nerdyPunch.jpg')
;


INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 2, '고흥 유자주', 13000, 8.0, 500, '제조일로부터 10개월', 
'서늘한 곳 또는 냉장 보관', '유자차처럼 달콤한 맛', '디저트 타임 때 딱!', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\go.jpg')
;
INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 2, '서설', 15000, 13.0, 375, '유통기한 없음', 
'상온 보관', '물처럼 깔끔한 목넘김', '술맛처럼 담백한 음식과 드셔보세요', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\sul.jpg')
;
INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 2, '단상지교', 20000, 16.0, 750, '병입일로부터 6개월', 
'냉장 보관', '묵직한 구수함과 진득하게 달콤한 맛', '풍미가 강한 음식들과 즐겨 보세요', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\dansang.jpg')
;
INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 2, '매화깊은밤', 12000, 8.0, 375, '제조일로부터 2년', 
'상온 보관', '끈적임 없이 깔끔하게 넘어가는 매실의 달콤함', '진한 풍미의 음식과 잘 어울려요', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\mahaw.jpg')
;
INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 2, '동학', 3800, 13.0, 375, '병입일로부터 2년', 
'냉장 보관', '갓 지은 밥의 구수한 풍미를 느낄 수 있어요', '집에 있는 반찬들과 반주로 즐겨보세요', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\dong.jpg')
;
INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 2, '솔송주', 9000, 13.0, 375, '제조일로부터 1년', 
'직사광선을 피하고 서늘한 곳에 보관', '달지않고 시원하게 넘어가는 약주', '바다내음 가득한 해산물요리에 시원한 솔향을 곁들여봐요', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\solsong.jpg')
;
INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 2, '운암 1945', 33000, 12.0, 750, '병입일로부터 2년', 
'상온 보관 가능', '달콤하기보단 톡 쏘는 신맛이 혀를 자극해요', '담백한 생선회나 기름진 음식과 즐겨보세요', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\unam.jpg')
;
INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 2, '니노메', 11000, 11.0, 375, '병입일로부터 2년', 
'상온 보관 가능', '곡물의 고소함과 귤피의 씁쓸함이 돋보이는 약주', '간장 양념이 들어간 음식과 달짝지근하게 즐겨보세요', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\nimoma.jpg')
;
INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER , IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 2, '우포', 10000, 12.0, 500, '제조일로부터 2년', 
'상온 보관 가능', '달콤하면서도 누룽지같이 고소한 끝 맛', '달콤 짭짤한 양념이 배어있는 음식과 즐겨보세요', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\oppo.png')
;
commit;
INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 2, '송이주', 15000, 13.0, 750, '제조일로부터 3년', 
'상온 보관 가능', '산림욕을 하는 듯한 솔 내음을 가득 담았어요', '기름지고 풍미 짙은 요리와 즐겨보세요', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\song.jpg')
;


INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 3, '요새로제', 17900, 6.4, 750, '병입일로부터 2년 이내', 
'상온 보관', '라즈베리의 달짝지근한 향과 새콤한 맛', '담백하거나 살짝 달콤한 음식과 즐겨보세요', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\yoselose.jpg')
;
INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 3, '허니문배', 17900, 4.9, 750, '병입일로부터 2년 이내', 
'냉장 보관', '사과?배?꿀의 복합적인 풍미', '파티 식전주로 가볍게 즐겨보세요', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\honeymoon.jpg')
;
INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 3, '감싸주는 날', 12000, 16, 375, '제조일로부터 1년 이내', 
'냉장 보관', '단맛과 옅은 산미가 진득한 질감으로 입안을 감싸주는 술', '지방에서 비롯되는 고소한 풍미와 감칠맛을 가진 음식', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\gamssaju.jpg')
;
INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 3, '매실 향기 담은 술', 25920, 14.0, 500, '제조일로부터 3개월', 
'냉장 보관', '산뜻한 매실 풍미를 청량감 넘치게 즐겨보세요', '야들 야들한 생선회 한 점에 매향주 한 잔! 얼마나 맛있게요?', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\mesilsul.jpg')
;
INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 3, '만다린 약주', 15900, 12.0, 375, '제조일로부터 6개월', 
'냉장 보관', '계피차에 귤 과즙 한 숟갈 넣은 맛', '지방에서 비롯되는 고소한 풍미와 감칠맛을 가진 음식', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\mandarin.jpg')
;
INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 3, '신애유자', 5900, 5.0, 330, '제조일로부터 6개월', 
'상온 보관 가능', '레모네이드 같이 싱그러운 새콤함', '부담 없이 기름진 음식과 즐겨 보세요', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\sineyuja.jpg')
;
INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 3, '허니비', 29500, 8.0, 500, '유통기한 없음', 
'냉장 보관', '계피차에 귤 과즙 한 숟갈 넣은 맛', '지방에서 비롯되는 고소한 풍미와 감칠맛을 가진 음식', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\honeybee.jpg')
;
INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 3, '스윗마마', 5500, 5.5, 330, '병입일로부터 2년', 
'상온 보관 가능', '사과의 진한 달콤함과 시원한 탄산의 환상적인 콜라보', '달콤한 디저트와 가볍게 즐겨보세요', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\sweetmama.jpg')
;
INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 3, '혼디주', 8000, 12.0, 335, '유통기한 없음', 
'직사광선을 피하고 서늘한 곳에 보관', '감귤 계열의 새콤한 향과 달콤한 맛', '재료 본연의 맛이 느껴지는 음식과 잘 어울려요', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\hondiju.jpg')
;
INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 3, '제주, 유채', 12000, 14.0, 375, '유통기한 없음', 
'상온 보관 가능', '달콤한 화이트 와인을 연상시켜요', '감칠맛이 짙은 음식과 드셔보세요', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\jejuyuchae.jpg')
;


INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 4, '서울의 밤', 7900, 25.0, 375, '유통기한 없음', 
'상온 보관 가능', '깔끔하다라는 표현이 이보다 더 잘 어울리는 술이 있을까요?', '생선회와 함께하여 극강의 깔끔함을 느껴보세요', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\seoulbam.jpg')
;
INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 4, '가평 소주', 6500, 25.0, 360, '유통기한 없음', 
'상온 보관 가능', '청주를 마신 듯한 깔끔한 목 넘김', '가평 여행을 떠올리며 바비큐와 함께 즐겨보세요', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\gapyungsoju.jpg')
;
INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 4, '술샘', 12000, 16.0, 375, '유통기한 없음', 
'상온 보관 가능', '알코올 향 없이 편안하게 오미자의 풍미를 느껴보세요', '다채로운 맛을 내는 오미자처럼 다양하게 즐겨보세요', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\sulsaem.jpg')
;
INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 4, '안동소주 일품', 9600, 40.0, 350, '유통기한 없음', 
'상온 보관 가능', '고소한 국물 풍미가 일품!', '거절하기 힘든 맑은 국물 요리와의 조합', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\andongsoju.jpg')
;
INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 4, '진도 아리랑 홍주', 17900, 40.0, 375, '유통기한 없음', 
'상온 보관 가능', '달콤한 꽃, 과일 향과 코를 찌르는 듯한 짜릿함을 느낄 수 있어요', '기름진 음식을 깔끔하게 즐길 수 있도록 도와줘요', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\jindoarirang.jpg')
;
INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 4, '추사 40%', 67000, 40.0, 500, '유통기한 없음', 
'상온 보관 가능', '스모키한 오크향과 달콤한 사과향을 천천히 음미해보세요', '풍미 짙은 음식과 심플하면서도 화려하게 즐겨보세요', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\chusa.jpg')
;
INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 4, '겨울소주 25%', 10000, 25.0, 360, '유통기한 없음', 
'상온 보관 가능', '역한 맛 없이, 부드럽고 깔끔한 소주!', '취향에 맞게 다양한 음식과 즐겨보세요', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\gyulsoju.jpg')
;
INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 4, '문경바람 오크 40%', 30000, 40.0, 375, '유통기한 없음', 
'상온 보관 가능', '중후한 사과의 풍미를 잔잔하게 느껴보세요', '생선회 한점과 온더락 한 모금의 여유를 만끽해보세요', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\munkyungbaram.jpg')
;
INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 4, '모리', 9800, 19.0, 400, '유통기한 없음', 
'상온 보관 가능', '은은한 바닐라 향이 나면서 자극적이지 않은 맛이에요', '해산물 요리와 함께하기 좋아요', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\mory.jpg')
;
INSERT INTO PRODUCT(PRODUCT_NO, TYPE_NO, NAME, PRICE, DEGREE, CAPACITY, 
EXPIRY_DATE, STORAGE, TASTE, APPETIZER, IMAGE) 
VALUES(SEQ_PRODUCT_NO.NEXTVAL, 4, '금설', 35000, 35.0, 375, '유통기한 없음', 
'상온 보관 가능', '달짝지근한 풍미에 매운맛이 추가됐어요', '구수하면서도 달짝지근한 요리와 함께 해보세요', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\geumsul.jpg')
;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------
--주문
INSERT INTO ORDERS(ORDER_NO, MEMBER_NO)
VALUES(SEQ_ORDER_NO.NEXTVAL, 1)
;
INSERT INTO ORDERS(ORDER_NO, MEMBER_NO)
VALUES(SEQ_ORDER_NO.NEXTVAL, 2)
;
INSERT INTO ORDERS(ORDER_NO, MEMBER_NO)
VALUES(SEQ_ORDER_NO.NEXTVAL, 3)
;
INSERT INTO ORDERS(ORDER_NO, MEMBER_NO)
VALUES(SEQ_ORDER_NO.NEXTVAL, 4)
;
INSERT INTO ORDERS(ORDER_NO, MEMBER_NO)
VALUES(SEQ_ORDER_NO.NEXTVAL, 5)
;
INSERT INTO ORDERS(ORDER_NO, MEMBER_NO)
VALUES(SEQ_ORDER_NO.NEXTVAL, 6)
;
INSERT INTO ORDERS(ORDER_NO, MEMBER_NO)
VALUES(SEQ_ORDER_NO.NEXTVAL, 7)
;
INSERT INTO ORDERS(ORDER_NO, MEMBER_NO)
VALUES(SEQ_ORDER_NO.NEXTVAL, 8)
;
INSERT INTO ORDERS(ORDER_NO, MEMBER_NO)
VALUES(SEQ_ORDER_NO.NEXTVAL, 9)
;
INSERT INTO ORDERS(ORDER_NO, MEMBER_NO)
VALUES(SEQ_ORDER_NO.NEXTVAL, 10)
;
INSERT INTO ORDERS(ORDER_NO, MEMBER_NO)
VALUES(SEQ_ORDER_NO.NEXTVAL, 11)
;
INSERT INTO ORDERS(ORDER_NO, MEMBER_NO)
VALUES(SEQ_ORDER_NO.NEXTVAL, 12)
;
INSERT INTO ORDERS(ORDER_NO, MEMBER_NO)
VALUES(SEQ_ORDER_NO.NEXTVAL, 13)
;
INSERT INTO ORDERS(ORDER_NO, MEMBER_NO)
VALUES(SEQ_ORDER_NO.NEXTVAL, 14)
;
INSERT INTO ORDERS(ORDER_NO, MEMBER_NO)
VALUES(SEQ_ORDER_NO.NEXTVAL, 15)
;


--주문내역 
INSERT INTO ORDERS_LIST(ORDER_LIST_NO, ORDER_NO, PRODUCT_NO, QUANTITY)
VALUES(SEQ_ORDER_LIST_NO.NEXTVAL, 1, 1, 1)
;
INSERT INTO ORDERS_LIST(ORDER_LIST_NO, ORDER_NO, PRODUCT_NO, QUANTITY)
VALUES(SEQ_ORDER_LIST_NO.NEXTVAL, 1, 2, 2)
;
INSERT INTO ORDERS_LIST(ORDER_LIST_NO, ORDER_NO, PRODUCT_NO, QUANTITY)
VALUES(SEQ_ORDER_LIST_NO.NEXTVAL, 1, 3, 3)
;
INSERT INTO ORDERS_LIST(ORDER_LIST_NO, ORDER_NO, PRODUCT_NO, QUANTITY)
VALUES(SEQ_ORDER_LIST_NO.NEXTVAL, 1, 4, 4)
;
INSERT INTO ORDERS_LIST(ORDER_LIST_NO, ORDER_NO, PRODUCT_NO, QUANTITY)
VALUES(SEQ_ORDER_LIST_NO.NEXTVAL, 1, 5, 5)
;
INSERT INTO ORDERS_LIST(ORDER_LIST_NO, ORDER_NO, PRODUCT_NO, QUANTITY)
VALUES(SEQ_ORDER_LIST_NO.NEXTVAL, 2, 6, 1)
;
INSERT INTO ORDERS_LIST(ORDER_LIST_NO, ORDER_NO, PRODUCT_NO, QUANTITY)
VALUES(SEQ_ORDER_LIST_NO.NEXTVAL, 2, 7, 2)
;
INSERT INTO ORDERS_LIST(ORDER_LIST_NO, ORDER_NO, PRODUCT_NO, QUANTITY)
VALUES(SEQ_ORDER_LIST_NO.NEXTVAL, 2, 8, 3)
;
INSERT INTO ORDERS_LIST(ORDER_LIST_NO, ORDER_NO, PRODUCT_NO, QUANTITY)
VALUES(SEQ_ORDER_LIST_NO.NEXTVAL, 2, 9, 4)
;
INSERT INTO ORDERS_LIST(ORDER_LIST_NO, ORDER_NO, PRODUCT_NO, QUANTITY)
VALUES(SEQ_ORDER_LIST_NO.NEXTVAL, 2, 10, 5)
;
INSERT INTO ORDERS_LIST(ORDER_LIST_NO, ORDER_NO, PRODUCT_NO, QUANTITY)
VALUES(SEQ_ORDER_LIST_NO.NEXTVAL, 3, 11, 5)
;
INSERT INTO ORDERS_LIST(ORDER_LIST_NO, ORDER_NO, PRODUCT_NO, QUANTITY)
VALUES(SEQ_ORDER_LIST_NO.NEXTVAL, 3, 12, 4)
;
INSERT INTO ORDERS_LIST(ORDER_LIST_NO, ORDER_NO, PRODUCT_NO, QUANTITY)
VALUES(SEQ_ORDER_LIST_NO.NEXTVAL, 3, 13, 3)
;
INSERT INTO ORDERS_LIST(ORDER_LIST_NO, ORDER_NO, PRODUCT_NO, QUANTITY)
VALUES(SEQ_ORDER_LIST_NO.NEXTVAL, 3, 14, 2)
;
INSERT INTO ORDERS_LIST(ORDER_LIST_NO, ORDER_NO, PRODUCT_NO, QUANTITY)
VALUES(SEQ_ORDER_LIST_NO.NEXTVAL, 3, 15, 1)
;
INSERT INTO ORDERS_LIST(ORDER_LIST_NO, ORDER_NO, PRODUCT_NO, QUANTITY)
VALUES(SEQ_ORDER_LIST_NO.NEXTVAL, 4, 16, 1)
;
INSERT INTO ORDERS_LIST(ORDER_LIST_NO, ORDER_NO, PRODUCT_NO, QUANTITY)
VALUES(SEQ_ORDER_LIST_NO.NEXTVAL, 4, 17, 2)
;
INSERT INTO ORDERS_LIST(ORDER_LIST_NO, ORDER_NO, PRODUCT_NO, QUANTITY)
VALUES(SEQ_ORDER_LIST_NO.NEXTVAL, 4, 18, 3)
;
INSERT INTO ORDERS_LIST(ORDER_LIST_NO, ORDER_NO, PRODUCT_NO, QUANTITY)
VALUES(SEQ_ORDER_LIST_NO.NEXTVAL, 5, 19, 2)
;
INSERT INTO ORDERS_LIST(ORDER_LIST_NO, ORDER_NO, PRODUCT_NO, QUANTITY)
VALUES(SEQ_ORDER_LIST_NO.NEXTVAL, 5, 20, 1)
;
INSERT INTO ORDERS_LIST(ORDER_LIST_NO, ORDER_NO, PRODUCT_NO, QUANTITY)
VALUES(SEQ_ORDER_LIST_NO.NEXTVAL, 6, 21, 1)
;
INSERT INTO ORDERS_LIST(ORDER_LIST_NO, ORDER_NO, PRODUCT_NO, QUANTITY)
VALUES(SEQ_ORDER_LIST_NO.NEXTVAL, 6, 22, 2)
;
INSERT INTO ORDERS_LIST(ORDER_LIST_NO, ORDER_NO, PRODUCT_NO, QUANTITY)
VALUES(SEQ_ORDER_LIST_NO.NEXTVAL, 7, 23, 3)
;
INSERT INTO ORDERS_LIST(ORDER_LIST_NO, ORDER_NO, PRODUCT_NO, QUANTITY)
VALUES(SEQ_ORDER_LIST_NO.NEXTVAL, 7, 24, 4)
;
INSERT INTO ORDERS_LIST(ORDER_LIST_NO, ORDER_NO, PRODUCT_NO, QUANTITY)
VALUES(SEQ_ORDER_LIST_NO.NEXTVAL, 8, 25, 5)
;
INSERT INTO ORDERS_LIST(ORDER_LIST_NO, ORDER_NO, PRODUCT_NO, QUANTITY)
VALUES(SEQ_ORDER_LIST_NO.NEXTVAL, 8, 26, 4)
;
INSERT INTO ORDERS_LIST(ORDER_LIST_NO, ORDER_NO, PRODUCT_NO, QUANTITY)
VALUES(SEQ_ORDER_LIST_NO.NEXTVAL, 9, 27, 3)
;
INSERT INTO ORDERS_LIST(ORDER_LIST_NO, ORDER_NO, PRODUCT_NO, QUANTITY)
VALUES(SEQ_ORDER_LIST_NO.NEXTVAL, 9, 28, 2)
;
INSERT INTO ORDERS_LIST(ORDER_LIST_NO, ORDER_NO, PRODUCT_NO, QUANTITY)
VALUES(SEQ_ORDER_LIST_NO.NEXTVAL, 10, 29, 1)
;
INSERT INTO ORDERS_LIST(ORDER_LIST_NO, ORDER_NO, PRODUCT_NO, QUANTITY)
VALUES(SEQ_ORDER_LIST_NO.NEXTVAL, 10, 30, 2)
;
INSERT INTO ORDERS_LIST(ORDER_LIST_NO, ORDER_NO, PRODUCT_NO, QUANTITY)
VALUES(SEQ_ORDER_LIST_NO.NEXTVAL, 11, 31, 3)
;
INSERT INTO ORDERS_LIST(ORDER_LIST_NO, ORDER_NO, PRODUCT_NO, QUANTITY)
VALUES(SEQ_ORDER_LIST_NO.NEXTVAL, 11, 32, 4)
;
INSERT INTO ORDERS_LIST(ORDER_LIST_NO, ORDER_NO, PRODUCT_NO, QUANTITY)
VALUES(SEQ_ORDER_LIST_NO.NEXTVAL, 12, 33, 5)
;
INSERT INTO ORDERS_LIST(ORDER_LIST_NO, ORDER_NO, PRODUCT_NO, QUANTITY)
VALUES(SEQ_ORDER_LIST_NO.NEXTVAL, 12, 34, 4)
;
INSERT INTO ORDERS_LIST(ORDER_LIST_NO, ORDER_NO, PRODUCT_NO, QUANTITY)
VALUES(SEQ_ORDER_LIST_NO.NEXTVAL, 13, 35, 3)
;
INSERT INTO ORDERS_LIST(ORDER_LIST_NO, ORDER_NO, PRODUCT_NO, QUANTITY)
VALUES(SEQ_ORDER_LIST_NO.NEXTVAL, 13, 36, 2)
;
INSERT INTO ORDERS_LIST(ORDER_LIST_NO, ORDER_NO, PRODUCT_NO, QUANTITY)
VALUES(SEQ_ORDER_LIST_NO.NEXTVAL, 14, 37, 1)
;
INSERT INTO ORDERS_LIST(ORDER_LIST_NO, ORDER_NO, PRODUCT_NO, QUANTITY)
VALUES(SEQ_ORDER_LIST_NO.NEXTVAL, 14, 38, 2)
;
INSERT INTO ORDERS_LIST(ORDER_LIST_NO, ORDER_NO, PRODUCT_NO, QUANTITY)
VALUES(SEQ_ORDER_LIST_NO.NEXTVAL, 15, 39, 3)
;
INSERT INTO ORDERS_LIST(ORDER_LIST_NO, ORDER_NO, PRODUCT_NO, QUANTITY)
VALUES(SEQ_ORDER_LIST_NO.NEXTVAL, 15, 40, 4)
;


INSERT INTO REVIEW (REVIEW_NO, CONTENT, ENROLL_DATE, IMG, MEMBER_NO, RATING, DEL_YN, ORDER_LIST_NO) VALUES (SEQ_REVIEW_NO.NEXTVAL, '맛있고 부드럽습니다. 완벽한 선택!', '2023/12/1', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\Damun.jpg', 1, 5, 'N', 1);
INSERT INTO REVIEW (REVIEW_NO, CONTENT, ENROLL_DATE, IMG, MEMBER_NO, RATING, DEL_YN, ORDER_LIST_NO) VALUES (SEQ_REVIEW_NO.NEXTVAL, '맛이 좀 없어요. 풍부한 향이 부족합니다.', '2023/12/1', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\redMonkey.jpg', 2, 1, 'N', 2);
INSERT INTO REVIEW (REVIEW_NO, CONTENT, ENROLL_DATE, IMG, MEMBER_NO, RATING, DEL_YN, ORDER_LIST_NO) VALUES (SEQ_REVIEW_NO.NEXTVAL, '맛이 훌륭하며, 부드럽습니다. 강력 추천!', '2023/12/1', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\misty.jpg', 3, 5, 'N', 3);
INSERT INTO REVIEW (REVIEW_NO, CONTENT, ENROLL_DATE, IMG, MEMBER_NO, RATING, DEL_YN, ORDER_LIST_NO) VALUES (SEQ_REVIEW_NO.NEXTVAL, '맛이 괜찮고, 적당한 향이 나는 편입니다.', '2023/12/1', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\Naju.jpg', 4, 4, 'N', 4);
INSERT INTO REVIEW (REVIEW_NO, CONTENT, ENROLL_DATE, IMG, MEMBER_NO, RATING, DEL_YN, ORDER_LIST_NO) VALUES (SEQ_REVIEW_NO.NEXTVAL, '맛이 좋고, 고소한 맛이 나서 좋아합니다.', '2023/12/1', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\masilGoji.jpg', 5, 5, 'N', 5);
INSERT INTO REVIEW (REVIEW_NO, CONTENT, ENROLL_DATE, IMG, MEMBER_NO, RATING, DEL_YN, ORDER_LIST_NO) VALUES (SEQ_REVIEW_NO.NEXTVAL, '맛있고 부드럽습니다. 완벽한 선택!', '2023/12/1', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\makurutee.jpg', 6, 5, 'N', 6);
INSERT INTO REVIEW (REVIEW_NO, CONTENT, ENROLL_DATE, IMG, MEMBER_NO, RATING, DEL_YN, ORDER_LIST_NO) VALUES (SEQ_REVIEW_NO.NEXTVAL, '맛이 좀 없어요. 풍부한 향이 부족합니다.', '2023/12/1', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\cloud.jpg', 7, 1, 'N', 7);
INSERT INTO REVIEW (REVIEW_NO, CONTENT, ENROLL_DATE, IMG, MEMBER_NO, RATING, DEL_YN, ORDER_LIST_NO) VALUES (SEQ_REVIEW_NO.NEXTVAL, '맛이 훌륭하며, 부드럽습니다. 강력 추천!', '2023/12/1', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\HOHO.jpg', 8, 5, 'N', 8);
INSERT INTO REVIEW (REVIEW_NO, CONTENT, ENROLL_DATE, IMG, MEMBER_NO, RATING, DEL_YN, ORDER_LIST_NO) VALUES (SEQ_REVIEW_NO.NEXTVAL, '맛이 괜찮고, 적당한 향이 나는 편입니다.', '2023/12/1', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\munHe.jpg', 9, 4, 'N', 9);
INSERT INTO REVIEW (REVIEW_NO, CONTENT, ENROLL_DATE, IMG, MEMBER_NO, RATING, DEL_YN, ORDER_LIST_NO) VALUES (SEQ_REVIEW_NO.NEXTVAL, '맛이 좋고, 고소한 맛이 나서 좋아합니다.', '2023/12/1', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\nerdyPunch.jpg', 10, 5, 'N', 10);
INSERT INTO REVIEW (REVIEW_NO, CONTENT, ENROLL_DATE, IMG, MEMBER_NO, RATING, DEL_YN, ORDER_LIST_NO) VALUES (SEQ_REVIEW_NO.NEXTVAL, '맛있고 부드럽습니다. 완벽한 선택!', '2023/12/1', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\go.jpg', 11, 5, 'N', 11);
INSERT INTO REVIEW (REVIEW_NO, CONTENT, ENROLL_DATE, IMG, MEMBER_NO, RATING, DEL_YN, ORDER_LIST_NO) VALUES (SEQ_REVIEW_NO.NEXTVAL, '맛이 좀 없어요. 풍부한 향이 부족합니다.', '2023/12/1', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\sul.jpg', 12, 1, 'N', 12);
INSERT INTO REVIEW (REVIEW_NO, CONTENT, ENROLL_DATE, IMG, MEMBER_NO, RATING, DEL_YN, ORDER_LIST_NO) VALUES (SEQ_REVIEW_NO.NEXTVAL, '맛이 훌륭하며, 부드럽습니다. 강력 추천!', '2023/12/1', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\dansang.jpg', 13, 5, 'N', 13);
INSERT INTO REVIEW (REVIEW_NO, CONTENT, ENROLL_DATE, IMG, MEMBER_NO, RATING, DEL_YN, ORDER_LIST_NO) VALUES (SEQ_REVIEW_NO.NEXTVAL, '맛이 괜찮고, 적당한 향이 나는 편입니다.', '2023/12/1', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\mahaw.jpg', 14, 4, 'N', 14);
INSERT INTO REVIEW (REVIEW_NO, CONTENT, ENROLL_DATE, IMG, MEMBER_NO, RATING, DEL_YN, ORDER_LIST_NO) VALUES (SEQ_REVIEW_NO.NEXTVAL, '맛이 좋고, 고소한 맛이 나서 좋아합니다.', '2023/12/1', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\dong.jpg', 15, 5, 'N', 15);
INSERT INTO REVIEW (REVIEW_NO, CONTENT, ENROLL_DATE, IMG, MEMBER_NO, RATING, DEL_YN, ORDER_LIST_NO) VALUES (SEQ_REVIEW_NO.NEXTVAL, '맛있고 부드럽습니다. 완벽한 선택!', '2023/12/1', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\solsong.jpg', 1, 5, 'N', 16);
INSERT INTO REVIEW (REVIEW_NO, CONTENT, ENROLL_DATE, IMG, MEMBER_NO, RATING, DEL_YN, ORDER_LIST_NO) VALUES (SEQ_REVIEW_NO.NEXTVAL, '맛이 좀 없어요. 풍부한 향이 부족합니다.', '2023/12/1', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\unam.jpg', 2, 1, 'N', 17);
INSERT INTO REVIEW (REVIEW_NO, CONTENT, ENROLL_DATE, IMG, MEMBER_NO, RATING, DEL_YN, ORDER_LIST_NO) VALUES (SEQ_REVIEW_NO.NEXTVAL, '맛이 훌륭하며, 부드럽습니다. 강력 추천!', '2023/12/1', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\nimoma.jpg', 3, 5, 'N', 18);
INSERT INTO REVIEW (REVIEW_NO, CONTENT, ENROLL_DATE, IMG, MEMBER_NO, RATING, DEL_YN, ORDER_LIST_NO) VALUES (SEQ_REVIEW_NO.NEXTVAL, '맛이 괜찮고, 적당한 향이 나는 편입니다.', '2023/12/1', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\oppo.png', 4, 4, 'N', 19);
INSERT INTO REVIEW (REVIEW_NO, CONTENT, ENROLL_DATE, IMG, MEMBER_NO, RATING, DEL_YN, ORDER_LIST_NO) VALUES (SEQ_REVIEW_NO.NEXTVAL, '맛이 좋고, 고소한 맛이 나서 좋아합니다.', '2023/12/1', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\song.jpg', 5, 5, 'N', 20);
INSERT INTO REVIEW (REVIEW_NO, CONTENT, ENROLL_DATE, IMG, MEMBER_NO, RATING, DEL_YN, ORDER_LIST_NO) VALUES (SEQ_REVIEW_NO.NEXTVAL, '맛있고 부드럽습니다. 완벽한 선택!', '2023/12/1', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\yoselose.jpg', 6, 5, 'N', 21);
INSERT INTO REVIEW (REVIEW_NO, CONTENT, ENROLL_DATE, IMG, MEMBER_NO, RATING, DEL_YN, ORDER_LIST_NO) VALUES (SEQ_REVIEW_NO.NEXTVAL, '맛이 좀 없어요. 풍부한 향이 부족합니다.', '2023/12/1', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\honeymoon.jpg', 7, 1, 'N', 22);
INSERT INTO REVIEW (REVIEW_NO, CONTENT, ENROLL_DATE, IMG, MEMBER_NO, RATING, DEL_YN, ORDER_LIST_NO) VALUES (SEQ_REVIEW_NO.NEXTVAL, '맛이 훌륭하며, 부드럽습니다. 강력 추천!', '2023/12/1', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\gamssaju.jpg', 8, 5, 'N', 23);
INSERT INTO REVIEW (REVIEW_NO, CONTENT, ENROLL_DATE, IMG, MEMBER_NO, RATING, DEL_YN, ORDER_LIST_NO) VALUES (SEQ_REVIEW_NO.NEXTVAL, '맛이 괜찮고, 적당한 향이 나는 편입니다.', '2023/12/1', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\mesilsul.jpg', 9, 4, 'N', 24);
INSERT INTO REVIEW (REVIEW_NO, CONTENT, ENROLL_DATE, IMG, MEMBER_NO, RATING, DEL_YN, ORDER_LIST_NO) VALUES (SEQ_REVIEW_NO.NEXTVAL, '맛이 좋고, 고소한 맛이 나서 좋아합니다.', '2023/12/1', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\mandarin.jpg', 10, 5, 'N', 25);
INSERT INTO REVIEW (REVIEW_NO, CONTENT, ENROLL_DATE, IMG, MEMBER_NO, RATING, DEL_YN, ORDER_LIST_NO) VALUES (SEQ_REVIEW_NO.NEXTVAL, '맛있고 부드럽습니다. 완벽한 선택!', '2023/12/1', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\sineyuja.jpg', 11, 5, 'N', 26);
INSERT INTO REVIEW (REVIEW_NO, CONTENT, ENROLL_DATE, IMG, MEMBER_NO, RATING, DEL_YN, ORDER_LIST_NO) VALUES (SEQ_REVIEW_NO.NEXTVAL, '맛이 좀 없어요. 풍부한 향이 부족합니다.', '2023/12/1', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\honeybee.jpg', 12, 1, 'N', 27);
INSERT INTO REVIEW (REVIEW_NO, CONTENT, ENROLL_DATE, IMG, MEMBER_NO, RATING, DEL_YN, ORDER_LIST_NO) VALUES (SEQ_REVIEW_NO.NEXTVAL, '맛이 훌륭하며, 부드럽습니다. 강력 추천!', '2023/12/1', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\sweetmama.jpg', 13, 5, 'N', 28);
INSERT INTO REVIEW (REVIEW_NO, CONTENT, ENROLL_DATE, IMG, MEMBER_NO, RATING, DEL_YN, ORDER_LIST_NO) VALUES (SEQ_REVIEW_NO.NEXTVAL, '맛이 괜찮고, 적당한 향이 나는 편입니다.', '2023/12/1', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\hondiju.jpg', 14, 4, 'N', 29);
INSERT INTO REVIEW (REVIEW_NO, CONTENT, ENROLL_DATE, IMG, MEMBER_NO, RATING, DEL_YN, ORDER_LIST_NO) VALUES (SEQ_REVIEW_NO.NEXTVAL, '맛이 좋고, 고소한 맛이 나서 좋아합니다.', '2023/12/1', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\jejuyuchae.jpg', 15, 5, 'N', 30);
INSERT INTO REVIEW (REVIEW_NO, CONTENT, ENROLL_DATE, IMG, MEMBER_NO, RATING, DEL_YN, ORDER_LIST_NO) VALUES (SEQ_REVIEW_NO.NEXTVAL, '맛있고 부드럽습니다. 완벽한 선택!', '2023/12/1', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\seoulbam.jpg', 1, 5, 'N', 31);
INSERT INTO REVIEW (REVIEW_NO, CONTENT, ENROLL_DATE, IMG, MEMBER_NO, RATING, DEL_YN, ORDER_LIST_NO) VALUES (SEQ_REVIEW_NO.NEXTVAL, '맛이 좀 없어요. 풍부한 향이 부족합니다.', '2023/12/1', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\gapyungsoju.jpg', 2, 1, 'N', 32);
INSERT INTO REVIEW (REVIEW_NO, CONTENT, ENROLL_DATE, IMG, MEMBER_NO, RATING, DEL_YN, ORDER_LIST_NO) VALUES (SEQ_REVIEW_NO.NEXTVAL, '맛이 훌륭하며, 부드럽습니다. 강력 추천!', '2023/12/1', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\sulsaem.jpg', 3, 5, 'N', 33);
INSERT INTO REVIEW (REVIEW_NO, CONTENT, ENROLL_DATE, IMG, MEMBER_NO, RATING, DEL_YN, ORDER_LIST_NO) VALUES (SEQ_REVIEW_NO.NEXTVAL, '맛이 괜찮고, 적당한 향이 나는 편입니다.', '2023/12/1', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\andongsoju.jpg', 4, 4, 'N', 34);
INSERT INTO REVIEW (REVIEW_NO, CONTENT, ENROLL_DATE, IMG, MEMBER_NO, RATING, DEL_YN, ORDER_LIST_NO) VALUES (SEQ_REVIEW_NO.NEXTVAL, '맛이 좋고, 고소한 맛이 나서 좋아합니다.', '2023/12/1', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\jindoarirang.jpg', 5, 5, 'N', 35);
INSERT INTO REVIEW (REVIEW_NO, CONTENT, ENROLL_DATE, IMG, MEMBER_NO, RATING, DEL_YN, ORDER_LIST_NO) VALUES (SEQ_REVIEW_NO.NEXTVAL, '맛있고 부드럽습니다. 완벽한 선택!', '2023/12/1', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\chusa.jpg', 6, 5, 'N', 36);
INSERT INTO REVIEW (REVIEW_NO, CONTENT, ENROLL_DATE, IMG, MEMBER_NO, RATING, DEL_YN, ORDER_LIST_NO) VALUES (SEQ_REVIEW_NO.NEXTVAL, '맛이 좀 없어요. 풍부한 향이 부족합니다.', '2023/12/1', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\gyulsoju.jpg', 7, 1, 'N', 37);
INSERT INTO REVIEW (REVIEW_NO, CONTENT, ENROLL_DATE, IMG, MEMBER_NO, RATING, DEL_YN, ORDER_LIST_NO) VALUES (SEQ_REVIEW_NO.NEXTVAL, '맛이 훌륭하며, 부드럽습니다. 강력 추천!', '2023/12/1', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\munkyungbaram.jpg', 8, 5, 'N', 38);
INSERT INTO REVIEW (REVIEW_NO, CONTENT, ENROLL_DATE, IMG, MEMBER_NO, RATING, DEL_YN, ORDER_LIST_NO) VALUES (SEQ_REVIEW_NO.NEXTVAL, '맛이 괜찮고, 적당한 향이 나는 편입니다.', '2023/12/1', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\mory.jpg', 9, 4, 'N', 39);
INSERT INTO REVIEW (REVIEW_NO, CONTENT, ENROLL_DATE, IMG, MEMBER_NO, RATING, DEL_YN, ORDER_LIST_NO) VALUES (SEQ_REVIEW_NO.NEXTVAL, '맛이 좋고, 고소한 맛이 나서 좋아합니다.', '2023/12/1', 'http://127.0.0.1:8888/app\resources\upload\gallery\img\geumsul.jpg', 10, 5, 'N', 40);





INSERT INTO COMMUNITY_COMMT (COMMUNITY_COMMT_NO, CONTENT, DEL_YN, COMMUNITY_NO, MEMBER_NO) VALUES (SEQ_COMMUNITY_COMMT_NO.NEXTVAL, '좋은 정보 감사합니다!', 'N', 1, 2);
INSERT INTO COMMUNITY_COMMT (COMMUNITY_COMMT_NO, CONTENT, DEL_YN, COMMUNITY_NO, MEMBER_NO) VALUES  (SEQ_COMMUNITY_COMMT_NO.NEXTVAL, '와인과 치즈는 정말 최고죠!', 'N', 2, 3);
INSERT INTO COMMUNITY_COMMT (COMMUNITY_COMMT_NO, CONTENT, DEL_YN, COMMUNITY_NO, MEMBER_NO) VALUES  (SEQ_COMMUNITY_COMMT_NO.NEXTVAL, '맥주와 핫도그 레시피 좀 알려주세요!', 'N', 4, 4);
INSERT INTO COMMUNITY_COMMT (COMMUNITY_COMMT_NO, CONTENT, DEL_YN, COMMUNITY_NO, MEMBER_NO) VALUES  (SEQ_COMMUNITY_COMMT_NO.NEXTVAL, '와인과 치즈 조합은 언제나 성공적입니다.', 'N', 8, 5);
INSERT INTO COMMUNITY_COMMT (COMMUNITY_COMMT_NO, CONTENT, DEL_YN, COMMUNITY_NO, MEMBER_NO) VALUES  (SEQ_COMMUNITY_COMMT_NO.NEXTVAL, '소주와 전 먹으면 최고에요!', 'N', 9, 6);
INSERT INTO COMMUNITY_COMMT (COMMUNITY_COMMT_NO, CONTENT, DEL_YN, COMMUNITY_NO, MEMBER_NO) VALUES  (SEQ_COMMUNITY_COMMT_NO.NEXTVAL, '와인과 삼겹살은 찰떡궁합이죠.', 'N', 11, 7);
INSERT INTO COMMUNITY_COMMT (COMMUNITY_COMMT_NO, CONTENT, DEL_YN, COMMUNITY_NO, MEMBER_NO) VALUES  (SEQ_COMMUNITY_COMMT_NO.NEXTVAL, '맥주와 감자튀김은 어디든지 어울려요.', 'N', 13, 8);
INSERT INTO COMMUNITY_COMMT (COMMUNITY_COMMT_NO, CONTENT, DEL_YN, COMMUNITY_NO, MEMBER_NO) VALUES  (SEQ_COMMUNITY_COMMT_NO.NEXTVAL, '와인과 디저트는 로맨틱한 분위기를 만들어줍니다.', 'N', 14, 9);
INSERT INTO COMMUNITY_COMMT (COMMUNITY_COMMT_NO, CONTENT, DEL_YN, COMMUNITY_NO, MEMBER_NO) VALUES  (SEQ_COMMUNITY_COMMT_NO.NEXTVAL, '소주와 떡볶이는 이국적인 맛이에요.', 'N', 15, 10);
INSERT INTO COMMUNITY_COMMT (COMMUNITY_COMMT_NO, CONTENT, DEL_YN, COMMUNITY_NO, MEMBER_NO) VALUES  (SEQ_COMMUNITY_COMMT_NO.NEXTVAL, '맥주와 치킨은 완벽한 조합입니다!', 'N', 1, 2);
INSERT INTO COMMUNITY_COMMT (COMMUNITY_COMMT_NO, CONTENT, DEL_YN, COMMUNITY_NO, MEMBER_NO) VALUES  (SEQ_COMMUNITY_COMMT_NO.NEXTVAL, '와인과 삼겹살은 절대 빠질 수 없어요.', 'N', 11, 3);
INSERT INTO COMMUNITY_COMMT (COMMUNITY_COMMT_NO, CONTENT, DEL_YN, COMMUNITY_NO, MEMBER_NO) VALUES  (SEQ_COMMUNITY_COMMT_NO.NEXTVAL, '맥주와 피자는 어디서나 맛있어요.', 'N', 7, 4);
INSERT INTO COMMUNITY_COMMT (COMMUNITY_COMMT_NO, CONTENT, DEL_YN, COMMUNITY_NO, MEMBER_NO) VALUES  (SEQ_COMMUNITY_COMMT_NO.NEXTVAL, '와인과 치즈는 최고의 친구!', 'N', 8, 5);
INSERT INTO COMMUNITY_COMMT (COMMUNITY_COMMT_NO, CONTENT, DEL_YN, COMMUNITY_NO, MEMBER_NO) VALUES  (SEQ_COMMUNITY_COMMT_NO.NEXTVAL, '소주와 간장게장은 국민 안주입니다.', 'N', 3, 6);
INSERT INTO COMMUNITY_COMMT (COMMUNITY_COMMT_NO, CONTENT, DEL_YN, COMMUNITY_NO, MEMBER_NO) VALUES  (SEQ_COMMUNITY_COMMT_NO.NEXTVAL, '맥주와 새우튀김은 완벽한 조합!', 'N', 13, 7);



--옥진
INSERT INTO ADMIN (ADMIN_NO, ADMIN_ID, ADMIN_PWD, ADMIN_NAME) VALUES(SEQ_ADMIN_NO.NEXTVAL, 'ADMIN01', '1234', '관리자01');
INSERT INTO ADMIN (ADMIN_NO, ADMIN_ID, ADMIN_PWD, ADMIN_NAME) VALUES(SEQ_ADMIN_NO.NEXTVAL, 'ADMIN02', '1234', '관리자02');
INSERT INTO ADMIN (ADMIN_NO, ADMIN_ID, ADMIN_PWD, ADMIN_NAME) VALUES(SEQ_ADMIN_NO.NEXTVAL, 'ADMIN03', '1234', '관리자03');
INSERT INTO ADMIN (ADMIN_NO, ADMIN_ID, ADMIN_PWD, ADMIN_NAME) VALUES(SEQ_ADMIN_NO.NEXTVAL, 'ADMIN04', '1234', '관리자04');
INSERT INTO ADMIN (ADMIN_NO, ADMIN_ID, ADMIN_PWD, ADMIN_NAME) VALUES(SEQ_ADMIN_NO.NEXTVAL, 'ADMIN05', '1234', '관리자05');

INSERT INTO NOTICE (NOTICE_NO, ADMIN_NO, TITLE, CONTENT, INQUIRY) VALUES(SEQ_NOTICE_NO.NEXTVAL, 1, '새로운 주류 도착!', '소중한 고객 여러분, 저희는 몇 가지 환상적인 신제품 도착 소식을 알립니다. 최신 추가품목을 탐험하고 새로운 즐거움을 찾아보세요.', 1);
INSERT INTO NOTICE (NOTICE_NO, ADMIN_NO, TITLE, CONTENT, INQUIRY) VALUES(SEQ_NOTICE_NO.NEXTVAL, 2, '다가오는 이벤트: 와인 테이스팅 나이트!', '우리와 함께 정성스럽게 선택된 와인의 풍미를 만끽하는 훌륭한 저녁을 즐겨보세요. 이 즐거운 경험을 놓치지 마세요.', 2);
INSERT INTO NOTICE (NOTICE_NO, ADMIN_NO, TITLE, CONTENT, INQUIRY) VALUES(SEQ_NOTICE_NO.NEXTVAL, 3, '축제 분위기와 특별 할인!', '축제 분위기에 맞춰 독점적인 특별 할인으로 기쁨을 나눠보세요. 최고급 주류를 이전보다 저렴한 가격에 만나보세요.', 3);
INSERT INTO NOTICE (NOTICE_NO, ADMIN_NO, TITLE, CONTENT, INQUIRY) VALUES(SEQ_NOTICE_NO.NEXTVAL, 4, '고객 충성도 프로그램 업데이트', '놀라운 소식! 우리의 충성도 프로그램이 더 많은 혜택과 보상을 제공하도록 개선되었습니다. 자세한 내용을 확인하고 오늘부터 혜택을 누리세요.', 4);
INSERT INTO NOTICE (NOTICE_NO, ADMIN_NO, TITLE, CONTENT, INQUIRY) VALUES(SEQ_NOTICE_NO.NEXTVAL, 5, '유지보수 안내 - 웹사이트 업그레이드', '저희는 온라인 쇼핑 경험을 향상시키기 위해 예정된 유지보수를 진행할 예정입니다. 양해해 주셔서 감사하며 향상된 플랫폼으로 제공드릴 것을 기대합니다.', 5);
INSERT INTO NOTICE (NOTICE_NO, ADMIN_NO, TITLE, CONTENT, INQUIRY) VALUES(SEQ_NOTICE_NO.NEXTVAL, 1, '독점 위스키 컬렉션 출시', '위스키 팬 여러분을 호출합니다! 저희의 최신 독점 컬렉션을 탐험하세요. 손에 잡히는 한정 수량의 고급 위스키를 확인하세요.', 6);
INSERT INTO NOTICE (NOTICE_NO, ADMIN_NO, TITLE, CONTENT, INQUIRY) VALUES(SEQ_NOTICE_NO.NEXTVAL, 2, '이달의 칵테일 레시피', '자신의 공간에서 창의적으로 즐겨보세요! 이달의 칵테일 레시피를 시도하여 상쾌하고 독특한 음료로 손님들을 감동시키세요. 건배!', 7);
INSERT INTO NOTICE (NOTICE_NO, ADMIN_NO, TITLE, CONTENT, INQUIRY) VALUES(SEQ_NOTICE_NO.NEXTVAL, 3, '사케 축제 곧 시작!', '미리 훈련시켜 두세요! 곧 다가올 사케 축제에 참여하세요. 다양한 지역에서 온 사케의 풍부한 문화적 맛을 경험하고 즐겨보세요. 행사 세부 사항을 기대해 주세요.', 8);
INSERT INTO NOTICE (NOTICE_NO, ADMIN_NO, TITLE, CONTENT, INQUIRY) VALUES(SEQ_NOTICE_NO.NEXTVAL, 4, '중요 업데이트: 배송 지연', '소중한 고객 여러분, 현재 저희는 배송 서비스에 약간의 지연이 발생하고 있습니다. 불편을 느끼시는 분들께 사과드리며 양해해 주셔서 감사합니다.', 9);
INSERT INTO NOTICE (NOTICE_NO, ADMIN_NO, TITLE, CONTENT, INQUIRY) VALUES(SEQ_NOTICE_NO.NEXTVAL, 5, '가상 위스키 테이스팅 체험', '저희 매장 행사가 그립다면 가상 위스키 테이스팅 체험에 참여하세요. 한정된 자리가 있으니 오늘 자리를 예약하세요.', 10);
INSERT INTO NOTICE (NOTICE_NO, ADMIN_NO, TITLE, CONTENT, INQUIRY) VALUES(SEQ_NOTICE_NO.NEXTVAL, 1, '흥미로운 럼 컬렉션 론칭', '맛의 여행을 떠나세요! 새로운 럼 컬렉션을 탐험하여 손선택한 럼의 다양한 맛과 향을 즐겨보세요.', 11);
INSERT INTO NOTICE (NOTICE_NO, ADMIN_NO, TITLE, CONTENT, INQUIRY) VALUES(SEQ_NOTICE_NO.NEXTVAL, 2, '여름 분위기: 수제 맥주로 시원하게', '더위를 이기고 상쾌한 수제 맥주로 여름을 맞이하세요. 여러 가지 옵션을 탐험하여 화창한 날들에 시원하고 만족스러운 시간을 보내세요. 여름에 건배!', 12);
INSERT INTO NOTICE (NOTICE_NO, ADMIN_NO, TITLE, CONTENT, INQUIRY) VALUES(SEQ_NOTICE_NO.NEXTVAL, 3, '독점 보드카 테이스팅 이벤트', '보드카 팬을 위한 특별한 테이스팅 이벤트에 참여하세요. 한정된 자리가 있으니 지금 자리를 확보하세요.', 13);
INSERT INTO NOTICE (NOTICE_NO, ADMIN_NO, TITLE, CONTENT, INQUIRY) VALUES(SEQ_NOTICE_NO.NEXTVAL, 4, '특별한 날을 위한 와인 페어링 가이드', '완벽한 와인 페어링으로 특별한 날을 더욱 풍성하게 만드세요. 전문가의 추천을 확인하여 기념일을 축하하세요.', 14);
INSERT INTO NOTICE (NOTICE_NO, ADMIN_NO, TITLE, CONTENT, INQUIRY) VALUES(SEQ_NOTICE_NO.NEXTVAL, 5, '고객 의견 콘테스트', '귀하의 의견을 공유하고 흥미로운 상품을 획득하는 기회를 놓치지 마세요! 여러분의 의견은 중요하며 우리는 여러분의 소리를 듣고 싶어합니다. 오늘 의견 콘테스트에 참여하세요.', 15);

INSERT INTO CUSTOMER_CENTER (Q_NO, MEMBER_NO, Q_TITLE, Q_CONTENT, ADMIN_NO, A_CONTENT) VALUES(SEQ_Q_NO.NEXTVAL, 1, '상품에 대한 문의', '안녕하세요, 최근에 주문한 상품에 대해 궁금한 사항이 있습니다. 제품에 대한 자세한 정보를 알고 싶습니다.', 1, '안녕하세요! 상품에 관한 궁금한 점에 대해 자세한 내용을 알려주세요. 최대한 빠르게 도움을 드리겠습니다.');
INSERT INTO CUSTOMER_CENTER (Q_NO, MEMBER_NO, Q_TITLE, Q_CONTENT, ADMIN_NO, A_CONTENT) VALUES(SEQ_Q_NO.NEXTVAL, 2, '배송 문의', '주문한 제품의 배송 진행 상황을 확인하고 싶습니다. 언제쯤 수령할 수 있을까요?', 2, '안녕하세요! 주문하신 제품의 배송 상황을 확인해 드리겠습니다. 주문 번호를 알려주시면 빠르게 도움을 드리겠습니다.');
INSERT INTO CUSTOMER_CENTER (Q_NO, MEMBER_NO, Q_TITLE, Q_CONTENT, ADMIN_NO, A_CONTENT) VALUES(SEQ_Q_NO.NEXTVAL, 3, '환불 및 교환 문의', '상품을 받아보았는데 문제가 발생했습니다. 환불이나 제품 교환이 가능한지 알려주세요.', 3, '안녕하세요! 불편을 끼쳐드려 죄송합니다. 발생한 문제에 대해 자세한 내용을 알려주시면 빠르게 도움을 드리겠습니다.');
INSERT INTO CUSTOMER_CENTER (Q_NO, MEMBER_NO, Q_TITLE, Q_CONTENT, ADMIN_NO, A_CONTENT) VALUES(SEQ_Q_NO.NEXTVAL, 4, '할인 및 이벤트 문의', '현재 진행 중인 할인이나 이벤트에 대해 알고 싶습니다. 어떤 특별 혜택이 있는지 알려주세요.', 4, '안녕하세요! 현재 진행 중인 할인 및 이벤트에 대한 정보를 알려드립니다. 어떤 특별 혜택을 찾고 계신지 알려주시면 도움을 드리겠습니다.');
INSERT INTO CUSTOMER_CENTER (Q_NO, MEMBER_NO, Q_TITLE, Q_CONTENT, ADMIN_NO, A_CONTENT) VALUES(SEQ_Q_NO.NEXTVAL, 5, '웹사이트 이용에 관한 문의', '웹사이트 이용 중에 문제가 발생했습니다. 어떻게 해결할 수 있을까요?', 5, '안녕하세요! 웹사이트 이용 중에 발생한 문제에 대해 어떤 부분에서 어떤 어려움을 겪고 계신지 알려주시면 도움을 드리겠습니다.');
INSERT INTO CUSTOMER_CENTER (Q_NO, MEMBER_NO, Q_TITLE, Q_CONTENT, ADMIN_NO, A_CONTENT) VALUES(SEQ_Q_NO.NEXTVAL, 6, '상품 리뷰 수정 문의', '작성한 상품 리뷰를 수정하고 싶습니다. 어떻게 해야 하나요?', 1, '안녕하세요! 상품 리뷰를 수정하는 방법에 대해 안내해 드리겠습니다. 원하는 수정 사항을 알려주시면 도움을 드리겠습니다.');
INSERT INTO CUSTOMER_CENTER (Q_NO, MEMBER_NO, Q_TITLE, Q_CONTENT, ADMIN_NO, A_CONTENT) VALUES(SEQ_Q_NO.NEXTVAL, 7, '회원 정보 변경 문의', '회원 정보를 업데이트하고 싶습니다. 어떻게 진행되나요?', 2, '안녕하세요! 회원 정보를 업데이트하는 방법에 대해 안내해 드리겠습니다. 변경하고자 하는 내용을 알려주시면 도움을 드리겠습니다.');
INSERT INTO CUSTOMER_CENTER (Q_NO, MEMBER_NO, Q_TITLE, Q_CONTENT, ADMIN_NO, A_CONTENT) VALUES(SEQ_Q_NO.NEXTVAL, 8, '상품 재고 문의', '좋아하는 제품이 품절 상태인데 언제 입고되나요?', 3, '안녕하세요! 품절된 제품에 대한 입고 예정일에 대해 알려드리겠습니다. 제품명이나 코드를 알려주시면 더 정확한 정보를 제공할 수 있습니다.');
INSERT INTO CUSTOMER_CENTER (Q_NO, MEMBER_NO, Q_TITLE, Q_CONTENT, ADMIN_NO, A_CONTENT) VALUES(SEQ_Q_NO.NEXTVAL, 9, '배송비에 관한 문의', '주문한 제품에 대한 배송비가 추가되었습니다. 배송비를 확인하고 싶습니다.', 4, '안녕하세요! 추가된 배송비에 대한 확인을 위해 주문 번호를 알려주시면 빠르게 확인해 드리겠습니다.');
INSERT INTO CUSTOMER_CENTER (Q_NO, MEMBER_NO, Q_TITLE, Q_CONTENT, ADMIN_NO, A_CONTENT) VALUES(SEQ_Q_NO.NEXTVAL, 10, '앱 사용 문의', '모바일 앱을 이용 중인데 문제가 발생했습니다. 도움을 받을 수 있는 방법이 있을까요?', 5, '안녕하세요! 앱 이용 중에 발생한 문제에 대해 어떤 어려움을 겪고 계신지 자세히 알려주시면 도움을 드리겠습니다.');
INSERT INTO CUSTOMER_CENTER (Q_NO, MEMBER_NO, Q_TITLE, Q_CONTENT, ADMIN_NO, A_CONTENT) VALUES(SEQ_Q_NO.NEXTVAL, 11, '상품 추천 문의', '새로운 주류를 찾고 있는데 어떤 제품을 추천해주시겠어요?', 1, '안녕하세요! 새로운 주류를 찾고 계시다니 좋네요. 선호하시는 특정 종류나 맛에 대한 선호사항을 알려주시면 더 나은 추천을 해드릴 수 있을 것 같습니다.');
INSERT INTO CUSTOMER_CENTER (Q_NO, MEMBER_NO, Q_TITLE, Q_CONTENT, ADMIN_NO, A_CONTENT) VALUES(SEQ_Q_NO.NEXTVAL, 12, '회원 탈퇴 문의', '회원 탈퇴를 하려고 하는데 어떤 절차를 따라야 하나요?', 2, '안녕하세요! 회원 탈퇴 절차에 대해 안내해 드리겠습니다. 탈퇴하고자 하는 이유 등을 알려주시면 빠르게 도움을 드리겠습니다.');
INSERT INTO CUSTOMER_CENTER (Q_NO, MEMBER_NO, Q_TITLE, Q_CONTENT, ADMIN_NO, A_CONTENT) VALUES(SEQ_Q_NO.NEXTVAL, 13, '결제 문제', '주문 시 결제 과정에서 문제가 발생했습니다. 어떻게 해결할 수 있을까요?', 3, '안녕하세요! 결제 과정에서 발생한 문제에 대해 어떤 어려움을 겪고 계신지 자세히 알려주시면 도움을 드리겠습니다.');
INSERT INTO CUSTOMER_CENTER (Q_NO, MEMBER_NO, Q_TITLE, Q_CONTENT, ADMIN_NO, A_CONTENT) VALUES(SEQ_Q_NO.NEXTVAL, 14, '이용자 혜택 문의', '회원으로서 어떤 추가 혜택을 받을 수 있나요?', 4, '안녕하세요! 회원 혜택에 대해 궁금하신 점이 있으신가요? 어떤 추가 혜택을 찾고 계신지 알려주시면 자세히 안내해 드리겠습니다.');
INSERT INTO CUSTOMER_CENTER (Q_NO, MEMBER_NO, Q_TITLE, Q_CONTENT, ADMIN_NO, A_CONTENT) VALUES(SEQ_Q_NO.NEXTVAL, 15, '고객 서비스 만족도 조사', '고객 서비스에 대한 만족도를 조사하고 싶습니다. 설문 조사 참여 방법을 알려주세요.', 5, '안녕하세요! 만족도 조사에 참여해 주셔서 감사합니다. 조사에 참여하려면 어떤 단계를 따라야 하는지 알려주시면 도움을 드리겠습니다.');


INSERT INTO DELIVERY_STATUS (DELIVERY_STATUS_NO, DELIVERY_STATUS) VALUES(SEQ_DELIVERY_STATUS_NO.NEXTVAL, '배송전');
INSERT INTO DELIVERY_STATUS (DELIVERY_STATUS_NO, DELIVERY_STATUS) VALUES(SEQ_DELIVERY_STATUS_NO.NEXTVAL, '배송중');
INSERT INTO DELIVERY_STATUS (DELIVERY_STATUS_NO, DELIVERY_STATUS) VALUES(SEQ_DELIVERY_STATUS_NO.NEXTVAL, '배송완료');

INSERT INTO DELIVERY (DELIVERY_NO, ORDER_NO, ADDRESS_NO) VALUES(SEQ_DELIVERY_NO.NEXTVAL, 1, 1);
INSERT INTO DELIVERY (DELIVERY_NO, ORDER_NO, ADDRESS_NO) VALUES(SEQ_DELIVERY_NO.NEXTVAL, 2, 2);
INSERT INTO DELIVERY (DELIVERY_NO, ORDER_NO, ADDRESS_NO) VALUES(SEQ_DELIVERY_NO.NEXTVAL, 3, 3);
INSERT INTO DELIVERY (DELIVERY_NO, ORDER_NO, ADDRESS_NO) VALUES(SEQ_DELIVERY_NO.NEXTVAL, 4, 4);
INSERT INTO DELIVERY (DELIVERY_NO, ORDER_NO, ADDRESS_NO) VALUES(SEQ_DELIVERY_NO.NEXTVAL, 5, 5);



--장바구니
--INSERT INTO CART(CART_NO, MEMBER_NO, PRODUCT_NO, NAME, PRICE, CAPACITY, CNT)
--VALUES(SEQ_CART_NO.NEXTVAL, 1, 31, '서울의밤', 7900, 375, 1)
--;
--INSERT INTO CART(CART_NO, MEMBER_NO, PRODUCT_NO, NAME, PRICE, CAPACITY, CNT)
--VALUES(SEQ_CART_NO.NEXTVAL, 1, 32, '가평소주', 6500, 360, 1)
--;
--INSERT INTO CART(CART_NO, MEMBER_NO, PRODUCT_NO, NAME, PRICE, CAPACITY, CNT)
--VALUES(SEQ_CART_NO.NEXTVAL, 1, 1, '담은', 11000, 750, 1)
--;
--INSERT INTO CART(CART_NO, MEMBER_NO, PRODUCT_NO, NAME, PRICE, CAPACITY, CNT)
--VALUES(SEQ_CART_NO.NEXTVAL, 2, 39, '모리', 9800, 400, 1)
--;
--INSERT INTO CART(CART_NO, MEMBER_NO, PRODUCT_NO, NAME, PRICE, CAPACITY, CNT)
--VALUES(SEQ_CART_NO.NEXTVAL, 2, 22, '허니문배', 17900, 750, 1)
--;

COMMIT;