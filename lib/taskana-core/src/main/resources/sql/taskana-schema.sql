CREATE TABLE TASKANA_SCHEMA_VERSION(
        ID CHAR(40) NOT NULL,
        VERSION VARCHAR(255) NOT NULL,
        PRIMARY KEY (ID)
);
INSERT INTO TASKANA_SCHEMA_VERSION VALUES ('1', '0.0.1');

CREATE TABLE CLASSIFICATION(
    ID CHAR(40) NOT NULL,
    KEY VARCHAR(32) NOT NULL,
    PARENT_ID VARCHAR(40) NOT NULL,
    CATEGORY VARCHAR(32),
    TYPE VARCHAR(32),
    DOMAIN VARCHAR(255) NOT NULL,
    VALID_IN_DOMAIN SMALLINT NOT NULL,
    CREATED TIMESTAMP NULL,
    NAME VARCHAR(255) NULL,
    DESCRIPTION VARCHAR(255) NULL,
    PRIORITY INT NULL,
    SERVICE_LEVEL VARCHAR(255) NULL,
    APPLICATION_ENTRY_POINT VARCHAR(255) NULL,
    CUSTOM_1 VARCHAR(255) NULL,
    CUSTOM_2 VARCHAR(255) NULL,
    CUSTOM_3 VARCHAR(255) NULL,
    CUSTOM_4 VARCHAR(255) NULL,
    CUSTOM_5 VARCHAR(255) NULL,
    CUSTOM_6 VARCHAR(255) NULL,
    CUSTOM_7 VARCHAR(255) NULL,
    CUSTOM_8 VARCHAR(255) NULL,
    PRIMARY KEY (ID),
    CONSTRAINT UC_CLASS_KEY_DOMAIN UNIQUE (KEY, DOMAIN)
);

CREATE TABLE WORKBASKET(
    ID CHAR(40) NOT NULL,
    KEY VARCHAR(64) NOT NULL,
    CREATED TIMESTAMP NULL,
    MODIFIED TIMESTAMP NULL,
    NAME VARCHAR(255) NOT NULL,
    DOMAIN VARCHAR(32) NOT NULL,
    TYPE VARCHAR(16) NOT NULL,
    DESCRIPTION VARCHAR(255) NULL,
    OWNER VARCHAR(32) NULL,
    CUSTOM_1 VARCHAR(255) NULL,
    CUSTOM_2 VARCHAR(255) NULL,
    CUSTOM_3 VARCHAR(255) NULL,
    CUSTOM_4 VARCHAR(255) NULL,
    ORG_LEVEL_1 VARCHAR(255) NULL,
    ORG_LEVEL_2 VARCHAR(255) NULL,
    ORG_LEVEL_3 VARCHAR(255) NULL,
    ORG_LEVEL_4 VARCHAR(255) NULL,
    PRIMARY KEY (ID),
    CONSTRAINT WB_KEY_DOMAIN UNIQUE (KEY, DOMAIN)
);

CREATE TABLE TASK (
        ID CHAR(40) NOT NULL,
        CREATED TIMESTAMP NULL,
        CLAIMED TIMESTAMP NULL,
        COMPLETED TIMESTAMP NULL,
        MODIFIED TIMESTAMP NULL,
        PLANNED TIMESTAMP NULL,
        DUE TIMESTAMP NULL,
        NAME VARCHAR(255) NULL,
        CREATOR VARCHAR(32) NULL,
        DESCRIPTION VARCHAR(1024) NULL,
        NOTE VARCHAR(4096) NULL,
        PRIORITY INT NULL,
        STATE VARCHAR(20) NULL,
        CLASSIFICATION_CATEGORY VARCHAR(32) NULL,
        CLASSIFICATION_KEY VARCHAR(32) NULL,
        CLASSIFICATION_ID CHAR(40) NULL,
        WORKBASKET_ID CHAR(40) NULL,
        WORKBASKET_KEY VARCHAR(64) NULL,
        DOMAIN VARCHAR(32) NULL,
        BUSINESS_PROCESS_ID VARCHAR(128) NULL,
        PARENT_BUSINESS_PROCESS_ID VARCHAR(128) NULL,
        OWNER VARCHAR(32) NULL,
        POR_COMPANY VARCHAR(32) NOT NULL,
        POR_SYSTEM VARCHAR(32) NOT NULL,
        POR_INSTANCE VARCHAR(32) NOT NULL,
        POR_TYPE VARCHAR(32) NOT NULL,
        POR_VALUE VARCHAR(128) NOT NULL,
        IS_READ SMALLINT NOT NULL,
        IS_TRANSFERRED SMALLINT NOT NULL,
        CUSTOM_ATTRIBUTES CLOB NULL,
        CUSTOM_1 VARCHAR(255) NULL,
        CUSTOM_2 VARCHAR(255) NULL,
        CUSTOM_3 VARCHAR(255) NULL,
        CUSTOM_4 VARCHAR(255) NULL,
        CUSTOM_5 VARCHAR(255) NULL,
        CUSTOM_6 VARCHAR(255) NULL,
        CUSTOM_7 VARCHAR(255) NULL,
        CUSTOM_8 VARCHAR(255) NULL,
        CUSTOM_9 VARCHAR(255) NULL,
        CUSTOM_10 VARCHAR(255) NULL,
        PRIMARY KEY (ID),
        CONSTRAINT TASK_WB FOREIGN KEY  (WORKBASKET_ID) REFERENCES WORKBASKET ON DELETE NO ACTION,
        CONSTRAINT TASK_CLASS FOREIGN KEY (CLASSIFICATION_ID) REFERENCES CLASSIFICATION ON DELETE NO ACTION
);

CREATE TABLE DISTRIBUTION_TARGETS(
        SOURCE_ID CHAR(40) NOT NULL,
        TARGET_ID CHAR(40) NOT NULL,
        PRIMARY KEY (SOURCE_ID, TARGET_ID)
);

CREATE TABLE WORKBASKET_ACCESS_LIST(
        ID CHAR(40) NOT NULL,
        WORKBASKET_ID CHAR(40) NOT NULL,
        ACCESS_ID VARCHAR(255) NOT NULL,
        PERM_READ SMALLINT NOT NULL,
        PERM_OPEN SMALLINT NOT NULL,
        PERM_APPEND SMALLINT NOT NULL,
        PERM_TRANSFER SMALLINT NOT NULL,
        PERM_DISTRIBUTE SMALLINT NOT NULL,
        PERM_CUSTOM_1 SMALLINT NOT NULL,
        PERM_CUSTOM_2 SMALLINT NOT NULL,
        PERM_CUSTOM_3 SMALLINT NOT NULL,
        PERM_CUSTOM_4 SMALLINT NOT NULL,
        PERM_CUSTOM_5 SMALLINT NOT NULL,
        PERM_CUSTOM_6 SMALLINT NOT NULL,
        PERM_CUSTOM_7 SMALLINT NOT NULL,
        PERM_CUSTOM_8 SMALLINT NOT NULL,
        PERM_CUSTOM_9 SMALLINT NOT NULL,
        PERM_CUSTOM_10 SMALLINT NOT NULL,
        PERM_CUSTOM_11 SMALLINT NOT NULL,
        PERM_CUSTOM_12 SMALLINT NOT NULL,
        PRIMARY KEY (ID)
);

CREATE TABLE OBJECT_REFERENCE(
        ID CHAR(40) NOT NULL,
        COMPANY VARCHAR(32) NOT NULL,
        SYSTEM VARCHAR(32) NOT NULL,
        SYSTEM_INSTANCE VARCHAR(32) NOT NULL,
        TYPE VARCHAR(32) NOT NULL,
        VALUE VARCHAR(128) NOT NULL
);

CREATE TABLE ATTACHMENT(
    ID CHAR(40) NOT NULL,
    TASK_ID CHAR(40) NOT NULL,
    CREATED TIMESTAMP NULL,
    MODIFIED TIMESTAMP NULL,
    CLASSIFICATION_KEY VARCHAR(32) NULL,
    CLASSIFICATION_ID CHAR(40) NULL,
    REF_COMPANY VARCHAR(32) NOT NULL,
    REF_SYSTEM VARCHAR(32) NOT NULL,
    REF_INSTANCE VARCHAR(32) NOT NULL,
    REF_TYPE VARCHAR(32) NOT NULL,
    REF_VALUE VARCHAR(128) NOT NULL,
    CHANNEL VARCHAR(64) NULL,
    RECEIVED TIMESTAMP NULL,
    CUSTOM_ATTRIBUTES CLOB NULL,
    PRIMARY KEY (ID),
    CONSTRAINT ATT_CLASS FOREIGN KEY (CLASSIFICATION_ID) REFERENCES CLASSIFICATION ON DELETE NO ACTION
);
