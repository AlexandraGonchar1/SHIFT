  CREATE TABLE "SYS"."A_ALL_PRODUCTS_CATEGORY" 
   (	"ID_SALE_CATEGORY" NUMBER(*,0) NOT NULL ENABLE, 
	"ID_CATEGORY" NUMBER(*,0) NOT NULL ENABLE, 
	"SIZE_SALE" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	 PRIMARY KEY ("ID_SALE_CATEGORY")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE, 
	 FOREIGN KEY ("ID_CATEGORY")
	  REFERENCES "SYS"."A_CATEGORIES" ("ID_CATEGORY") ENABLE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
  
 CREATE TABLE "SYS"."A_CATEGORIES" 
   (	"ID_CATEGORY" NUMBER(*,0) NOT NULL ENABLE, 
	"NAME_CAT" VARCHAR2(1000 BYTE) NOT NULL ENABLE, 
	"DESCRIPTION_CAT" VARCHAR2(1000 BYTE), 
	 PRIMARY KEY ("ID_CATEGORY")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
  
CREATE TABLE "SYS"."A_CHEQUES" 
   (	"ID_CHEQUE" NUMBER(*,0) NOT NULL ENABLE, 
	"ID_EMP" NUMBER(*,0) NOT NULL ENABLE, 
	"ID_CARD" NUMBER(*,0), 
	"DATE_CH" VARCHAR2(1000 BYTE) NOT NULL ENABLE, 
	 PRIMARY KEY ("ID_CHEQUE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE, 
	 FOREIGN KEY ("ID_EMP")
	  REFERENCES "SYS"."A_EMPLOYEE" ("ID_EMP") ENABLE, 
	 FOREIGN KEY ("ID_CARD")
	  REFERENCES "SYS"."A_DISCOUNT_CARDS" ("ID_CARD") ENABLE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
  
    CREATE TABLE "SYS"."A_CLIENTS" 
   (	"ID_CLIENT" NUMBER(*,0) NOT NULL ENABLE, 
	"FIRST_NAME" VARCHAR2(1000 BYTE) NOT NULL ENABLE, 
	"LAST_NAME" VARCHAR2(1000 BYTE) NOT NULL ENABLE, 
	"MIDDLE_NAME" VARCHAR2(1000 BYTE) NOT NULL ENABLE, 
	"PHONE" VARCHAR2(1000 BYTE) NOT NULL ENABLE, 
	"BIRTHDAY" VARCHAR2(1000 BYTE), 
	 PRIMARY KEY ("ID_CLIENT")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
  
  CREATE TABLE "SYS"."A_DISCOUNT_CARDS" 
   (	"ID_CARD" NUMBER(*,0) NOT NULL ENABLE, 
	"ID_CLIENT" NUMBER(*,0) NOT NULL ENABLE, 
	"DISCOUNT" VARCHAR2(1000 BYTE) NOT NULL ENABLE, 
	 PRIMARY KEY ("ID_CARD")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE, 
	 FOREIGN KEY ("ID_CLIENT")
	  REFERENCES "SYS"."A_CLIENTS" ("ID_CLIENT") ENABLE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

  CREATE TABLE "SYS"."A_EMPLOYEE" 
   (	"ID_EMP" NUMBER(*,0) NOT NULL ENABLE, 
	"ID_SHOP" NUMBER(*,0) NOT NULL ENABLE, 
	"ID_POS" NUMBER(*,0) NOT NULL ENABLE, 
	"FIRST_NAME" VARCHAR2(1000 BYTE) NOT NULL ENABLE, 
	"LAST_NAME" VARCHAR2(1000 BYTE) NOT NULL ENABLE, 
	"MIDDLE_NAME" VARCHAR2(1000 BYTE) NOT NULL ENABLE, 
	"PHONE" VARCHAR2(1000 BYTE) NOT NULL ENABLE, 
	 PRIMARY KEY ("ID_EMP")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE, 
	 FOREIGN KEY ("ID_SHOP")
	  REFERENCES "SYS"."A_SHOPS" ("ID_SHOP") ENABLE, 
	 FOREIGN KEY ("ID_POS")
	  REFERENCES "SYS"."A_POSITIONS" ("ID_POS") ENABLE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

  CREATE TABLE "SYS"."A_MANUFACTURERS" 
   (	"ID_MANUFACTURER" NUMBER(*,0) NOT NULL ENABLE, 
	"NAME_MAN" VARCHAR2(1000 BYTE) NOT NULL ENABLE, 
	"COUNTRY" VARCHAR2(1000 BYTE) NOT NULL ENABLE, 
	"PHONE" VARCHAR2(1000 BYTE) NOT NULL ENABLE, 
	 PRIMARY KEY ("ID_MANUFACTURER")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
  
  CREATE TABLE "SYS"."A_OWNERS" 
   (	"ID_OWNER" NUMBER(*,0) NOT NULL ENABLE, 
	"FIRST_NAME" VARCHAR2(1000 BYTE) NOT NULL ENABLE, 
	"LAST_NAME" VARCHAR2(1000 BYTE) NOT NULL ENABLE, 
	"MIDDLE_NAME" VARCHAR2(1000 BYTE) NOT NULL ENABLE, 
	"PHONE" VARCHAR2(1000 BYTE) NOT NULL ENABLE, 
	 PRIMARY KEY ("ID_OWNER")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

  CREATE TABLE "SYS"."A_POSITIONS" 
   (	"ID_POS" NUMBER(*,0) NOT NULL ENABLE, 
	"NAME_POS" VARCHAR2(1000 BYTE) NOT NULL ENABLE, 
	"DESCRIPTION_POS" VARCHAR2(10000 BYTE), 
	 PRIMARY KEY ("ID_POS")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
  
  CREATE TABLE "SYS"."A_PRODUCT_SHOP_SALES" 
   (	"ID_SALE_PRODUCT" NUMBER(*,0) NOT NULL ENABLE, 
	"ID_PRODUCT_SHOP" NUMBER(*,0) NOT NULL ENABLE, 
	"SALE_SIZE" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	 PRIMARY KEY ("ID_SALE_PRODUCT")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE, 
	 FOREIGN KEY ("ID_PRODUCT_SHOP")
	  REFERENCES "SYS"."A_PRODUCTS_SHOP" ("ID_PRODUCT_SHOP") ENABLE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
  
  CREATE TABLE "SYS"."A_PRODUCTS" 
   (	"ID_PRODUCT" NUMBER(*,0) NOT NULL ENABLE, 
	"ID_MANUFACTURER" NUMBER(*,0) NOT NULL ENABLE, 
	"ID_CATEGORY" NUMBER(*,0) NOT NULL ENABLE, 
	"ARTICUL" VARCHAR2(1000 BYTE) NOT NULL ENABLE, 
	"PRICE" VARCHAR2(1000 BYTE) NOT NULL ENABLE, 
	"SIZE_PR" VARCHAR2(1000 BYTE), 
	"MEASUREMENT_TYPE" VARCHAR2(1000 BYTE) NOT NULL ENABLE, 
	 PRIMARY KEY ("ID_PRODUCT")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE, 
	 FOREIGN KEY ("ID_MANUFACTURER")
	  REFERENCES "SYS"."A_MANUFACTURERS" ("ID_MANUFACTURER") ENABLE, 
	 FOREIGN KEY ("ID_CATEGORY")
	  REFERENCES "SYS"."A_CATEGORIES" ("ID_CATEGORY") ENABLE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

  CREATE TABLE "SYS"."A_PRODUCTS_CHEQUE" 
   (	"ID_PRODUCT_CHEQUE" NUMBER(*,0) NOT NULL ENABLE, 
	"ID_CHEQUE" NUMBER(*,0) NOT NULL ENABLE, 
	"ID_PRODUCT_SHOP" NUMBER(*,0) NOT NULL ENABLE, 
	"VOLUME_PR" VARCHAR2(1000 BYTE) NOT NULL ENABLE, 
	 PRIMARY KEY ("ID_PRODUCT_CHEQUE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE, 
	 FOREIGN KEY ("ID_CHEQUE")
	  REFERENCES "SYS"."A_CHEQUES" ("ID_CHEQUE") ENABLE, 
	 FOREIGN KEY ("ID_PRODUCT_SHOP")
	  REFERENCES "SYS"."A_PRODUCTS_SHOP" ("ID_PRODUCT_SHOP") ENABLE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
  
    CREATE TABLE "SYS"."A_PRODUCTS_SHOP" 
   (	"ID_PRODUCT_SHOP" NUMBER(*,0) NOT NULL ENABLE, 
	"ID_SHOP" NUMBER(*,0) NOT NULL ENABLE, 
	"ID_PRODUCT_STORAGE" NUMBER(*,0) NOT NULL ENABLE, 
	"VOLUME_PR" VARCHAR2(1000 BYTE) NOT NULL ENABLE, 
	 PRIMARY KEY ("ID_PRODUCT_SHOP")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE, 
	 FOREIGN KEY ("ID_SHOP")
	  REFERENCES "SYS"."A_SHOPS" ("ID_SHOP") ENABLE, 
	 FOREIGN KEY ("ID_PRODUCT_STORAGE")
	  REFERENCES "SYS"."A_PRODUCTS_STORAGE" ("ID_PRODUCT_STORAGE") ENABLE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
  
  CREATE TABLE "SYS"."A_PRODUCTS_STORAGE" 
   (	"ID_PRODUCT_STORAGE" NUMBER(*,0) NOT NULL ENABLE, 
	"ID_STORAGE" NUMBER(*,0) NOT NULL ENABLE, 
	"ID_PRODUCT" NUMBER(*,0) NOT NULL ENABLE, 
	"VOLUME_PR" VARCHAR2(1000 BYTE) NOT NULL ENABLE, 
	 PRIMARY KEY ("ID_PRODUCT_STORAGE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE, 
	 FOREIGN KEY ("ID_STORAGE")
	  REFERENCES "SYS"."A_STORAGES" ("ID_STORAGE") ENABLE, 
	 FOREIGN KEY ("ID_PRODUCT")
	  REFERENCES "SYS"."A_PRODUCTS" ("ID_PRODUCT") ENABLE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
  
  CREATE TABLE "SYS"."A_SALES" 
   (	"ID_SALE" NUMBER(*,0) NOT NULL ENABLE, 
	"ID_TYPE" NUMBER(*,0) NOT NULL ENABLE, 
	"ID_SHOP" NUMBER(*,0), 
	"SALE_TIME" VARCHAR2(1000 BYTE) NOT NULL ENABLE, 
	 PRIMARY KEY ("ID_SALE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE, 
	 FOREIGN KEY ("ID_SHOP")
	  REFERENCES "SYS"."A_SHOPS" ("ID_SHOP") ENABLE, 
	 FOREIGN KEY ("ID_TYPE")
	  REFERENCES "SYS"."A_TYPES" ("ID_TYPE") ENABLE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

  CREATE TABLE "SYS"."A_SHOPS" 
   (	"ID_SHOP" NUMBER(*,0) NOT NULL ENABLE, 
	"ID_OWNER" NUMBER(*,0) NOT NULL ENABLE, 
	"NAME_SHOP" VARCHAR2(1000 BYTE) NOT NULL ENABLE, 
	"ADDRESS" VARCHAR2(1000 BYTE) NOT NULL ENABLE, 
	"PHONE" VARCHAR2(1000 BYTE), 
	 PRIMARY KEY ("ID_SHOP")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE, 
	 FOREIGN KEY ("ID_OWNER")
	  REFERENCES "SYS"."A_OWNERS" ("ID_OWNER") ENABLE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
  
  CREATE TABLE "SYS"."A_STORAGES" 
   (	"ID_STORAGE" NUMBER(*,0) NOT NULL ENABLE, 
	"ADDRESS" VARCHAR2(1000 BYTE) NOT NULL ENABLE, 
	"PHONE" VARCHAR2(1000 BYTE) NOT NULL ENABLE, 
	 PRIMARY KEY ("ID_STORAGE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

  CREATE TABLE "SYS"."A_TYPES" 
   (	"ID_TYPE" NUMBER(*,0) NOT NULL ENABLE, 
	"ID_SALE_CATEGORY" NUMBER(*,0), 
	"ID_SALE_PRODUCT" NUMBER(*,0), 
	"ALL_PRODUCTS_SALE" VARCHAR2(1000 BYTE), 
	 PRIMARY KEY ("ID_TYPE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE, 
	 FOREIGN KEY ("ID_SALE_CATEGORY")
	  REFERENCES "SYS"."A_ALL_PRODUCTS_CATEGORY" ("ID_SALE_CATEGORY") ENABLE, 
	 FOREIGN KEY ("ID_SALE_PRODUCT")
	  REFERENCES "SYS"."A_PRODUCT_SHOP_SALES" ("ID_SALE_PRODUCT") ENABLE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
