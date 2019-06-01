-------------------CLEANUP---------------------
DROP TABLE IF EXISTS USERS CASCADE;
DROP TABLE IF EXISTS SHIP CASCADE;
DROP TABLE IF EXISTS PLANE CASCADE;
DROP TABLE IF EXISTS AUTOMOBILE CASCADE;
DROP TABLE IF EXISTS HOTEL CASCADE;
DROP TABLE IF EXISTS RESTAURANT CASCADE;
DROP TABLE IF EXISTS FLIGHT CASCADE;
DROP TABLE IF EXISTS CRUISE CASCADE;
DROP TABLE IF EXISTS BAGGAGE CASCADE;
DROP TABLE IF EXISTS CLAIM CASCADE;
DROP TABLE IF EXISTS LOCATION CASCADE;
DROP TABLE IF EXISTS STOP CASCADE;
DROP TABLE IF EXISTS RES_CRU CASCADE;
DROP TABLE IF EXISTS RES_FLI CASCADE;
DROP TABLE IF EXISTS RES_REST CASCADE;
DROP TABLE IF EXISTS RES_AUT CASCADE;
DROP TABLE IF EXISTS RES_ROO CASCADE;
DROP TABLE IF EXISTS PAYMENT CASCADE;
DROP TABLE IF EXISTS TRAVEL CASCADE;
DROP TABLE IF EXISTS TRA_RES CASCADE;
DROP TABLE IF EXISTS COMMENT CASCADE;
DROP TABLE IF EXISTS ROLE CASCADE;
DROP TABLE IF EXISTS USER_ROLE CASCADE;
DROP TABLE IF EXISTS TRA_LOC CASCADE;

DROP SEQUENCE IF EXISTS SEQ_USERS;
DROP SEQUENCE IF EXISTS SEQ_USR;
DROP SEQUENCE IF EXISTS SEQ_ROLE;
DROP SEQUENCE IF EXISTS SEQ_SHIP;
DROP SEQUENCE IF EXISTS SEQ_PLANE;
DROP SEQUENCE IF EXISTS SEQ_AUTOMOBILE;
DROP SEQUENCE IF EXISTS SEQ_HOTEL;
DROP SEQUENCE IF EXISTS SEQ_RESTAURANT;
DROP SEQUENCE IF EXISTS SEQ_FLIGHT;
DROP SEQUENCE IF EXISTS SEQ_CRUISE;
DROP SEQUENCE IF EXISTS SEQ_BAGGAGE;
DROP SEQUENCE IF EXISTS SEQ_CLAIM;
DROP SEQUENCE IF EXISTS SEQ_LOCATION;
DROP SEQUENCE IF EXISTS SEQ_RES_CRU;
DROP SEQUENCE IF EXISTS SEQ_RES_FLI;
DROP SEQUENCE IF EXISTS SEQ_RES_REST;
DROP SEQUENCE IF EXISTS SEQ_RES_AUT;
DROP SEQUENCE IF EXISTS SEQ_RES_ROO;
DROP SEQUENCE IF EXISTS SEQ_PAYMENT;
DROP SEQUENCE IF EXISTS SEQ_TRAVEL;
DROP SEQUENCE IF EXISTS SEQ_TRA_RES;
DROP SEQUENCE IF EXISTS SEQ_COMMENT;
DROP SEQUENCE IF EXISTS SEQ_STOP;

-------------------------------------TABLES---------------------------------------------------
CREATE TABLE ROLE(
  ROL_ID SERIAL,
  ROL_NAME VARCHAR(20) NOT NULL,
  CONSTRAINT PRIMARY_ROLE PRIMARY KEY (ROL_ID)
);

CREATE TABLE USERS(
  USE_ID SERIAL,
  USE_NAME VARCHAR(30) NOT NULL,
  USE_LAST_NAME VARCHAR(30) NOT NULL,
  USE_DOB DATE,
  USE_DOCUMENT_ID VARCHAR(20) NOT NULL,
  USE_EMAIL VARCHAR(30) NOT NULL UNIQUE,
  USE_PASSWORD VARCHAR(50) NOT NULL,
  USE_ACTIVE BOOLEAN DEFAULT TRUE NOT NULL,
  CONSTRAINT PRIMARY_USER PRIMARY KEY (USE_ID)
);


CREATE TABLE USER_ROLE(
  USR_ID SERIAL,
  USR_ROL_ID BIGINT NOT NULL,
  USR_USE_ID BIGINT NOT NULL,
  CONSTRAINT PRIMARY_USER_ROLE PRIMARY KEY (USR_ID),
  CONSTRAINT FOREIGN_USER FOREIGN KEY (USR_USE_ID) REFERENCES USERS(USE_ID) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FOREIGN_ROLE FOREIGN KEY (USR_ROL_ID) REFERENCES ROLE(ROL_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE PAYMENT(
  PAY_ID SERIAL,
  PAY_METHOD VARCHAR(20) NOT NULL CHECK(PAY_METHOD = 'EFECTIVO' OR PAY_METHOD = 'TRANSFERENCIA' OR PAY_METHOD = 'CREDITO' OR PAY_METHOD = 'DEBITO'), 
  PAY_TOTAL DECIMAL NOT NULL,
  PAY_TIMESTAMP TIMESTAMP NOT NULL,
  CONSTRAINT PRIMARY_PAYMENT PRIMARY KEY (PAY_ID)
);

CREATE TABLE LOCATION(
  LOC_ID SERIAL,
  LOC_CITY VARCHAR(30) NOT NULL,
  LOC_COUNTRY VARCHAR(30) NOT NULL,
  CONSTRAINT PRIMARY_LOCATION PRIMARY KEY (LOC_ID)
);

CREATE TABLE SHIP(
  SHI_ID SERIAL,
  SHI_NAME VARCHAR(20) NOT NULL,
  SHI_ISACTIVE BOOLEAN DEFAULT TRUE NOT NULL,
  SHI_CAPACITY INTEGER NOT NULL,
  SHI_LOADINGCAP INTEGER,
  SHI_MODEL VARCHAR(20) NOT NULL,
  SHI_LINE VARCHAR(30),
  SHI_PICTURE VARCHAR,
  CONSTRAINT PRIMARY_SHIP PRIMARY KEY (SHI_ID) 
);

CREATE TABLE CRUISE(
  CRU_ID SERIAL,
  CRU_SHI_FK INTEGER NOT NULL,
  CRU_DEPARTUREDATE TIMESTAMP NOT NULL,
  CRU_ARRIVALDATE TIMESTAMP NOT NULL,
  CRU_PRICE DECIMAL NOT NULL,
  CRU_LOC_ARRIVAL INTEGER NOT NULL,
  CRU_LOC_DEPARTURE INTEGER NOT NULL,
  CONSTRAINT PRIMARY_CRUISE PRIMARY KEY (CRU_ID),
  CONSTRAINT FOREIGN_CRU_SHI FOREIGN KEY (CRU_SHI_FK) REFERENCES SHIP(SHI_ID) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FOREIGN_CRU_ARRIVAL FOREIGN KEY (CRU_LOC_ARRIVAL) REFERENCES LOCATION(LOC_ID) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FOREIGN_CRU_DEPARTURE FOREIGN KEY (CRU_LOC_DEPARTURE) REFERENCES LOCATION(LOC_ID) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE RES_CRU(
  RC_ID SERIAL,
  RC_NUM_PPL INTEGER NOT NULL,
  RC_USE_FK INTEGER NOT NULL,
  RC_CRU_FK INTEGER NOT NULL,
  RC_TIMESTAMP TIMESTAMP NOT NULL,
  RC_PAY_FK INTEGER,
  CONSTRAINT PRIMARY_RES_CRU PRIMARY KEY (RC_ID),
  CONSTRAINT FOREIGN_RC_USE FOREIGN KEY (RC_USE_FK) REFERENCES USERS(USE_ID) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FOREIGN_RC_CRU FOREIGN KEY (RC_CRU_FK) REFERENCES CRUISE(CRU_ID) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FOREIGN_RC_PAY FOREIGN KEY (RC_PAY_FK) REFERENCES PAYMENT(PAY_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE RESTAURANT(
  RES_ID SERIAL,
  RES_NAME VARCHAR(30) NOT NULL,
  RES_CAPACITY INTEGER NOT NULL,
  RES_ISACTIVE BOOLEAN DEFAULT TRUE NOT NULL, 
  RES_QUALIFY DECIMAL NOT NULL,
  RES_SPECIALTY VARCHAR(30),
  RES_PRICE DECIMAL NOT NULL,
  RES_BUSINESSNAME VARCHAR(30) NOT NULL,
  RES_PICTURE VARCHAR,
  RES_DESCR VARCHAR,
  RES_TLF VARCHAR,
  RES_LOC_FK INTEGER NOT NULL,
  RES_ADDRESS_SPECS VARCHAR(200) NOT NULL,
  CONSTRAINT PRIMARY_RESTAURANT PRIMARY KEY (RES_ID),
  CONSTRAINT FOREIGN_RES_LOC FOREIGN KEY (RES_LOC_FK) REFERENCES LOCATION(LOC_ID) ON DELETE CASCADE ON UPDATE CASCADE
);
  
    
CREATE TABLE RES_REST(
  RR_ID SERIAL,
  RR_DATE TIMESTAMP NOT NULL, --Fecha para saber para que dia reservo (fecha futuro)
  RR_NUM_PPL INTEGER NOT NULL, --Cantidad de personas que iran para esa reserva
  RR_TIMESTAMP TIMESTAMP NOT NULL, --Fecha para saber que dia reservo (fecha actual)
  RR_USE_FK INTEGER NOT NULL,
  RR_RES_FK INTEGER NOT NULL,
  RR_PAY_FK INTEGER,
  CONSTRAINT PRIMARY_RES_REST PRIMARY KEY (RR_ID),
  CONSTRAINT FOREIGN_RRES_USER FOREIGN KEY (RR_USE_FK) REFERENCES USERS(USE_ID) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FOREIGN_RRES_RESTAURANT FOREIGN KEY (RR_RES_FK) REFERENCES RESTAURANT(RES_ID) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FOREIGN_RRES_PAYMENT FOREIGN KEY (RR_PAY_FK) REFERENCES PAYMENT(PAY_ID) ON DELETE CASCADE ON UPDATE CASCADE
);
      
CREATE TABLE AUTOMOBILE(
  AUT_ID SERIAL,
  AUT_MAKE VARCHAR(30) NOT NULL,
  AUT_MODEL VARCHAR(30) NOT NULL,
  AUT_CAPACITY INTEGER NOT NULL,
  AUT_ISACTIVE BOOLEAN DEFAULT TRUE NOT NULL,
  AUT_PRICE DECIMAL NOT NULL,
  AUT_LICENSE VARCHAR(10) NOT NULL,
  AUT_PICTURE VARCHAR,
  AUT_LOC_FK INTEGER NOT NULL,
  CONSTRAINT PRIMARY_AUTOMOBILE PRIMARY KEY (AUT_ID),
  CONSTRAINT FOREIGN_AUT_LOCATION FOREIGN KEY (AUT_LOC_FK) REFERENCES LOCATION(LOC_ID) ON DELETE CASCADE ON UPDATE CASCADE
);
        
CREATE TABLE RES_AUT(
  RA_ID SERIAL,
  RA_PICKUPDATE TIMESTAMP NOT NULL,
  RA_RETURNDATE TIMESTAMP NOT NULL,
  RA_TIMESTAMP TIMESTAMP NOT NULL,
  RA_USE_FK INTEGER NOT NULL,
  RA_AUT_FK INTEGER NOT NULL,
  RA_PAY_FK INTEGER,
  CONSTRAINT PRIMARY_RES_AUT PRIMARY KEY (RA_ID),
  CONSTRAINT FOREIGN_RA_USER FOREIGN KEY (RA_USE_FK) REFERENCES USERS(USE_ID) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FOREIGN_AUTOMOBILE FOREIGN KEY (RA_AUT_FK) REFERENCES AUTOMOBILE(AUT_ID) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FOREIGN_RA_PAYMENT FOREIGN KEY (RA_PAY_FK) REFERENCES PAYMENT(PAY_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE HOTEL(
                      HOT_ID            SERIAL,
                      HOT_NAME          VARCHAR(30)          NOT NULL,
                      HOT_ROOM_QTY      INTEGER              NOT NULL,
                      HOT_ROOM_CAPACITY INTEGER              NOT NULL,
                      HOT_IS_ACTIVE     BOOLEAN DEFAULT TRUE NOT NULL,
                      HOT_ADDRESS_SPECS VARCHAR(200)         NOT NULL,
                      HOT_ROOM_PRICE    DECIMAL              NOT NULL,
                      HOT_WEBSITE       VARCHAR,
                      HOT_PHONE         VARCHAR,
                      HOT_PICTURE       VARCHAR,
                      HOT_STARS         INTEGER              NOT NULL CHECK (HOT_STARS BETWEEN 1 AND 5),
                      HOT_LOC_FK        INTEGER              NOT NULL,
                      CONSTRAINT PRIMARY_HOTEL PRIMARY KEY (HOT_ID),
                      CONSTRAINT FOREIGN_HOT_LOCATION FOREIGN KEY (HOT_LOC_FK) REFERENCES LOCATION(LOC_ID) ON DELETE CASCADE ON UPDATE CASCADE
);
  

CREATE TABLE RES_ROO(
  RR_ID SERIAL,
  RR_CHECKINDATE TIMESTAMP NOT NULL,
  RR_CHECKOUTDATE TIMESTAMP NOT NULL,
  RR_TIMESTAMP TIMESTAMP NOT NULL,
  RR_USE_FK INTEGER NOT NULL,
  RR_HOT_FK INTEGER NOT NULL,
  RR_PAY_FK INTEGER,
  CONSTRAINT PRIMARY_RES_ROO PRIMARY KEY (RR_ID),
  CONSTRAINT FOREIGN_RR_USER FOREIGN KEY (RR_USE_FK) REFERENCES USERS(USE_ID) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FOREIGN_HOTEL   FOREIGN KEY (RR_HOT_FK) REFERENCES HOTEL(HOT_ID) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FOREIGN_RR_PAYMENT FOREIGN KEY (RR_PAY_FK) REFERENCES PAYMENT(PAY_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE PLANE(
  PLA_ID SERIAL,
  PLA_AUTONOMY INTEGER,
  PLA_ISACTIVE BOOLEAN DEFAULT TRUE NOT NULL,
  PLA_CAPACITY INTEGER NOT  NULL,
  PLA_LOADINGCAP INTEGER,
  PLA_MODEL VARCHAR(20) NOT NULL,
  PLA_AIRLINE VARCHAR(20),
  CONSTRAINT PRIMARY_PLANE PRIMARY KEY (PLA_ID)
);

CREATE TABLE FLIGHT(
  FLI_ID SERIAL,
  FLI_PRICE DECIMAL NOT NULL,
  FLI_DEPARTUREDATE TIMESTAMP NOT NULL,
  FLI_ARRIVALDATE TIMESTAMP NOT NULL,
  FLI_LOC_DEPARTURE INTEGER NOT NULL,
  FLI_LOC_ARRIVAL INTEGER NOT NULL,
  FLI_PLA_FK INTEGER NOT NULL,
  CONSTRAINT PRIMARY_FLIGHT PRIMARY KEY (FLI_ID),
  CONSTRAINT FOREIGN_PLANE FOREIGN KEY (FLI_PLA_FK) REFERENCES PLANE(PLA_ID) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FOREIGN_ARRIVAL FOREIGN KEY (FLI_LOC_ARRIVAL) REFERENCES LOCATION(LOC_ID) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FOREIGN_DEPARTURE FOREIGN KEY (FLI_LOC_DEPARTURE) REFERENCES LOCATION(LOC_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE RES_FLI(
  RF_ID SERIAL,
  RF_SEATNUM VARCHAR(10) NOT NULL,
  RF_TIMESTAMP TIMESTAMP NOT NULL,
  RF_USE_FK INTEGER NOT NULL,
  RF_PAY_FK INTEGER NOT NULL,
  RF_FLI_FK INTEGER NOT NULL,
  CONSTRAINT PRIMARY_RES_FLI PRIMARY KEY (RF_ID),
  CONSTRAINT FOREIGN_RF_USER FOREIGN KEY (RF_USE_FK) REFERENCES USERS(USE_ID) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FOREIGN_RF_PAYMENT FOREIGN KEY (RF_PAY_FK) REFERENCES PAYMENT(PAY_ID) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FOREIGN_RF_FLIGHT FOREIGN KEY (RF_FLI_FK) REFERENCES FLIGHT(FLI_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE CLAIM(
  CLA_ID SERIAL,
  CLA_TITLE VARCHAR(40) NOT NULL,
  CLA_DESCR VARCHAR NOT NULL,
  CLA_STATUS VARCHAR CHECK (CLA_STATUS = 'ABIERTO' OR CLA_STATUS = 'CERRADO') NOT NULL,
  CONSTRAINT PRIMARY_CLAIM PRIMARY KEY (CLA_ID)
);

CREATE TABLE BAGGAGE(
  BAG_ID SERIAL,
  BAG_STATUS BOOLEAN DEFAULT FALSE NOT NULL,
  BAG_DESCR VARCHAR,
  BAG_RES_FLI_FK INTEGER NOT NULL,
  BAG_RES_CRU_FK INTEGER NOT NULL,
  CONSTRAINT PRIMARY_BAGGAGE PRIMARY KEY (BAG_ID),
  CONSTRAINT FOREIGN_BAG_RES_FLI FOREIGN KEY (BAG_RES_FLI_FK) REFERENCES RES_FLI(RF_ID) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FOREIGN_BAG_RES_CRU FOREIGN KEY (BAG_RES_CRU_FK) REFERENCES RES_CRU(RC_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE TRAVEL(
  TRA_ID SERIAL,
  TRA_NAME VARCHAR(50) NOT NULL,
  TRA_USE_FK INTEGER NOT NULL,
  TRA_INI DATE NOT NULL,
  TRA_END DATE NOT NULL,
  TRA_DESCR VARCHAR(300),
  CONSTRAINT PRIMARY_TRAVEL PRIMARY KEY (TRA_ID),
  CONSTRAINT FOREIGN_T_USER FOREIGN KEY (TRA_USE_FK) REFERENCES USERS(USE_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE TRA_RES(
  TR_ID SERIAL,
  TR_TRAVEL_FK INTEGER NOT NULL,
  TR_RES_CRU_FK INTEGER,
  TR_RES_FLI_FK INTEGER,
  TR_RES_REST_FK INTEGER,
  TR_RES_AUT_FK INTEGER,
  TR_RES_ROO_FK INTEGER,
  TR_TYPE VARCHAR(30) CHECK (TR_TYPE IN ('RESTAURANT','CAR','FLIGHT','HOREL','CRUISE')),
  CONSTRAINT PRIMARY_TRA_RES PRIMARY KEY (TR_ID),
  CONSTRAINT FOREIGN_TR_RES_CRU FOREIGN KEY (TR_RES_CRU_FK) REFERENCES RES_CRU(RC_ID) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FOREIGN_TR_RES_FLI FOREIGN KEY (TR_RES_FLI_FK) REFERENCES RES_FLI(RF_ID) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FOREIGN_RES_REST FOREIGN KEY (TR_RES_REST_FK) REFERENCES RES_REST(RR_ID) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FOREIGN_RES_AUT FOREIGN KEY (TR_RES_AUT_FK) REFERENCES RES_AUT(RA_ID) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FOREIGN_RES_ROO FOREIGN KEY (TR_RES_ROO_FK) REFERENCES RES_ROO(RR_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE COMMENT(
  COM_ID SERIAL,
  COM_DESCR VARCHAR(200) NOT NULL,
  COM_TIMESTAMP TIMESTAMP NOT NULL,
  COM_TRA_RES_FK INTEGER NOT NULL,
  CONSTRAINT PRIMARY_COMMENT PRIMARY KEY (COM_ID),
  CONSTRAINT FOREIGN_TRA_RES FOREIGN KEY (COM_TRA_RES_FK) REFERENCES TRA_RES(TR_ID) ON DELETE CASCADE ON UPDATE CASCADE
);
 
CREATE TABLE TRA_LOC(
	TL_ID SERIAL,
	TL_TRA_FK INTEGER,
	TL_LOC_FK INTEGER,
	CONSTRAINT PRIMARY_TRA_LOC PRIMARY KEY (TL_ID),
	CONSTRAINT FOREIGN_TRA_LOC_TRA FOREIGN KEY (TL_TRA_FK) REFERENCES TRAVEL(TRA_ID) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT FOREIGN_TRA_LOC_LOC FOREIGN KEY (TL_LOC_FK) REFERENCES LOCATION(LOC_ID) ON DELETE CASCADE ON UPDATE CASCADE
);