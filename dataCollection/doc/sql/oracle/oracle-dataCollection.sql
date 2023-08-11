create table DI_CATEGORY
(
    ID           NVARCHAR2(32) not null
        constraint SYS_C0071490
            primary key
        constraint SYS_C0071480
            check (ID IS NOT NULL),
    NAME         NVARCHAR2(255),
    CATEGORY_PID NVARCHAR2(32),
    IS_DEFAULT   NUMBER,
    REP_ID       NVARCHAR2(32),
    PATH         NVARCHAR2(255),
    CATEGORY_ID  NVARCHAR2(255),
    CODE         NVARCHAR2(255)
)
/

comment on column DI_CATEGORY.ID is '主键id'
/

comment on column DI_CATEGORY.NAME is '整合名称'
/

comment on column DI_CATEGORY.CATEGORY_PID is '父级id'
/

comment on column DI_CATEGORY.IS_DEFAULT is '1不允许删除，0允许删除'
/

comment on column DI_CATEGORY.REP_ID is '资源库id'
/

comment on column DI_CATEGORY.PATH is '文件路径'
/

comment on column DI_CATEGORY.CATEGORY_ID is '对应资源库目录id'
/

comment on column DI_CATEGORY.CODE is '树层级编码'
/

create table DI_SCRIPT
(
    ID          NVARCHAR2(32) not null
        constraint SYS_C0071491
            primary key
        constraint SYS_C0071481
            check (ID IS NOT NULL),
    NAME        NVARCHAR2(255),
    TYPE        NVARCHAR2(255),
    PATH        NVARCHAR2(255),
    CATEGORY_ID NVARCHAR2(32),
    SCRIPT_ID   NVARCHAR2(32),
    REP_ID      NVARCHAR2(32),
    CREATE_DATE DATE
)
/

comment on column DI_SCRIPT.ID is '主键id'
/

comment on column DI_SCRIPT.NAME is '名称'
/

comment on column DI_SCRIPT.TYPE is '类型'
/

comment on column DI_SCRIPT.PATH is '脚本路径'
/

comment on column DI_SCRIPT.CATEGORY_ID is '整合分类id'
/

comment on column DI_SCRIPT.SCRIPT_ID is '脚本id'
/

comment on column DI_SCRIPT.REP_ID is '资源库id'
/

comment on column DI_SCRIPT.CREATE_DATE is '创建时间'
/

create table K_CATEGORY
(
    ID             NVARCHAR2(32) not null
        constraint SYS_C0071482
            check (ID IS NOT NULL),
    CATEGORY_NAME  NVARCHAR2(50),
    CATEGORY_LEVEL NUMBER,
    PARENT_ID      NVARCHAR2(32),
    ADD_TIME       DATE,
    ADD_USER       NVARCHAR2(32),
    EDIT_TIME      DATE,
    EDIT_USER      NVARCHAR2(32),
    DEL_FLAG       NUMBER
)
/

comment on table K_CATEGORY is '分类表'
/

comment on column K_CATEGORY.ID is '分类ID'
/

comment on column K_CATEGORY.CATEGORY_NAME is '分类名称'
/

comment on column K_CATEGORY.CATEGORY_LEVEL is '分类级次'
/

comment on column K_CATEGORY.PARENT_ID is '父级ID'
/

comment on column K_CATEGORY.ADD_TIME is '添加时间'
/

comment on column K_CATEGORY.ADD_USER is '添加者'
/

comment on column K_CATEGORY.EDIT_TIME is '编辑时间'
/

comment on column K_CATEGORY.EDIT_USER is '编辑者'
/

comment on column K_CATEGORY.DEL_FLAG is '是否删除（0：存在；1：删除）'
/

create unique index CATEGORY_NAME_UNIQUE_INDEX
    on K_CATEGORY (CATEGORY_NAME)
/

create table K_DATABASE_TYPE
(
    ID          NVARCHAR2(32) not null
        constraint SYS_C0071483
            check (ID IS NOT NULL),
    CODE        NVARCHAR2(255),
    DESCRIPTION NVARCHAR2(255),
    ADD_TIME    DATE,
    ADD_USER    NVARCHAR2(32),
    EDIT_TIME   DATE,
    EDIT_USER   NVARCHAR2(32),
    DEL_FLAG    NUMBER
)
/

comment on table K_DATABASE_TYPE is '数据库连接类型表'
/

comment on column K_DATABASE_TYPE.ID is '主键'
/

comment on column K_DATABASE_TYPE.CODE is '编码'
/

comment on column K_DATABASE_TYPE.DESCRIPTION is '描述'
/

comment on column K_DATABASE_TYPE.ADD_TIME is '添加时间'
/

comment on column K_DATABASE_TYPE.ADD_USER is '添加者'
/

comment on column K_DATABASE_TYPE.EDIT_TIME is '编辑时间'
/

comment on column K_DATABASE_TYPE.EDIT_USER is '编辑者'
/

comment on column K_DATABASE_TYPE.DEL_FLAG is '是否删除（0：存在；1：删除）'
/

INSERT INTO K_DATABASE_TYPE (ID, CODE, DESCRIPTION, ADD_TIME, ADD_USER, EDIT_TIME, EDIT_USER, DEL_FLAG) VALUES ('1', 'DERBY', 'Apache Derby', null, null, null, null, 0);
INSERT INTO K_DATABASE_TYPE (ID, CODE, DESCRIPTION, ADD_TIME, ADD_USER, EDIT_TIME, EDIT_USER, DEL_FLAG) VALUES ('2', 'AS/400', 'AS/400', null, null, null, null, 0);
INSERT INTO K_DATABASE_TYPE (ID, CODE, DESCRIPTION, ADD_TIME, ADD_USER, EDIT_TIME, EDIT_USER, DEL_FLAG) VALUES ('3', 'INTERBASE', 'Borland Interbase', null, null, null, null, 0);
INSERT INTO K_DATABASE_TYPE (ID, CODE, DESCRIPTION, ADD_TIME, ADD_USER, EDIT_TIME, EDIT_USER, DEL_FLAG) VALUES ('4', 'INFINIDB', 'Calpont InfiniDB', null, null, null, null, 0);
INSERT INTO K_DATABASE_TYPE (ID, CODE, DESCRIPTION, ADD_TIME, ADD_USER, EDIT_TIME, EDIT_USER, DEL_FLAG) VALUES ('5', 'IMPALASIMBA', 'Cloudera Impala', null, null, null, null, 0);
INSERT INTO K_DATABASE_TYPE (ID, CODE, DESCRIPTION, ADD_TIME, ADD_USER, EDIT_TIME, EDIT_USER, DEL_FLAG) VALUES ('6', 'DBASE', 'dBase III, IV or 5', null, null, null, null, 0);
INSERT INTO K_DATABASE_TYPE (ID, CODE, DESCRIPTION, ADD_TIME, ADD_USER, EDIT_TIME, EDIT_USER, DEL_FLAG) VALUES ('7', 'EXASOL4', 'Exasol 4', null, null, null, null, 0);
INSERT INTO K_DATABASE_TYPE (ID, CODE, DESCRIPTION, ADD_TIME, ADD_USER, EDIT_TIME, EDIT_USER, DEL_FLAG) VALUES ('8', 'EXTENDB', 'ExtenDB', null, null, null, null, 0);
INSERT INTO K_DATABASE_TYPE (ID, CODE, DESCRIPTION, ADD_TIME, ADD_USER, EDIT_TIME, EDIT_USER, DEL_FLAG) VALUES ('9', 'FIREBIRD', 'Firebird SQL', null, null, null, null, 0);
INSERT INTO K_DATABASE_TYPE (ID, CODE, DESCRIPTION, ADD_TIME, ADD_USER, EDIT_TIME, EDIT_USER, DEL_FLAG) VALUES ('10', 'GENERIC', 'Generic database', null, null, null, null, 0);
INSERT INTO K_DATABASE_TYPE (ID, CODE, DESCRIPTION, ADD_TIME, ADD_USER, EDIT_TIME, EDIT_USER, DEL_FLAG) VALUES ('11', 'GOOGLEBIGQUERY', 'Google BigQuery', null, null, null, null, 0);
INSERT INTO K_DATABASE_TYPE (ID, CODE, DESCRIPTION, ADD_TIME, ADD_USER, EDIT_TIME, EDIT_USER, DEL_FLAG) VALUES ('12', 'GREENPLUM', 'Greenplum', null, null, null, null, 0);
INSERT INTO K_DATABASE_TYPE (ID, CODE, DESCRIPTION, ADD_TIME, ADD_USER, EDIT_TIME, EDIT_USER, DEL_FLAG) VALUES ('13', 'SQLBASE', 'Gupta SQL Base', null, null, null, null, 0);
INSERT INTO K_DATABASE_TYPE (ID, CODE, DESCRIPTION, ADD_TIME, ADD_USER, EDIT_TIME, EDIT_USER, DEL_FLAG) VALUES ('14', 'H2', 'H2', null, null, null, null, 0);
INSERT INTO K_DATABASE_TYPE (ID, CODE, DESCRIPTION, ADD_TIME, ADD_USER, EDIT_TIME, EDIT_USER, DEL_FLAG) VALUES ('15', 'HIVE', 'Hadoop Hive', null, null, null, null, 0);
INSERT INTO K_DATABASE_TYPE (ID, CODE, DESCRIPTION, ADD_TIME, ADD_USER, EDIT_TIME, EDIT_USER, DEL_FLAG) VALUES ('16', 'HIVE2', 'Hadoop Hive 2/3', null, null, null, null, 0);
INSERT INTO K_DATABASE_TYPE (ID, CODE, DESCRIPTION, ADD_TIME, ADD_USER, EDIT_TIME, EDIT_USER, DEL_FLAG) VALUES ('17', 'HYPERSONIC', 'Hypersonic', null, null, null, null, 0);
INSERT INTO K_DATABASE_TYPE (ID, CODE, DESCRIPTION, ADD_TIME, ADD_USER, EDIT_TIME, EDIT_USER, DEL_FLAG) VALUES ('18', 'DB2', 'IBM DB2', null, null, null, null, 0);
INSERT INTO K_DATABASE_TYPE (ID, CODE, DESCRIPTION, ADD_TIME, ADD_USER, EDIT_TIME, EDIT_USER, DEL_FLAG) VALUES ('19', 'IMPALA', 'Impala', null, null, null, null, 0);
INSERT INTO K_DATABASE_TYPE (ID, CODE, DESCRIPTION, ADD_TIME, ADD_USER, EDIT_TIME, EDIT_USER, DEL_FLAG) VALUES ('20', 'INFOBRIGHT', 'Infobright', null, null, null, null, 0);
INSERT INTO K_DATABASE_TYPE (ID, CODE, DESCRIPTION, ADD_TIME, ADD_USER, EDIT_TIME, EDIT_USER, DEL_FLAG) VALUES ('21', 'INFORMIX', 'Informix', null, null, null, null, 0);
INSERT INTO K_DATABASE_TYPE (ID, CODE, DESCRIPTION, ADD_TIME, ADD_USER, EDIT_TIME, EDIT_USER, DEL_FLAG) VALUES ('22', 'INGRES', 'Ingres', null, null, null, null, 0);
INSERT INTO K_DATABASE_TYPE (ID, CODE, DESCRIPTION, ADD_TIME, ADD_USER, EDIT_TIME, EDIT_USER, DEL_FLAG) VALUES ('23', 'VECTORWISE', 'Ingres VectorWise', null, null, null, null, 0);
INSERT INTO K_DATABASE_TYPE (ID, CODE, DESCRIPTION, ADD_TIME, ADD_USER, EDIT_TIME, EDIT_USER, DEL_FLAG) VALUES ('24', 'CACHE', 'Intersystems Cache', null, null, null, null, 0);
INSERT INTO K_DATABASE_TYPE (ID, CODE, DESCRIPTION, ADD_TIME, ADD_USER, EDIT_TIME, EDIT_USER, DEL_FLAG) VALUES ('25', 'KINGBASEES', 'KingbaseES', null, null, null, null, 0);
INSERT INTO K_DATABASE_TYPE (ID, CODE, DESCRIPTION, ADD_TIME, ADD_USER, EDIT_TIME, EDIT_USER, DEL_FLAG) VALUES ('26', 'LucidDB', 'LucidDB', null, null, null, null, 0);
INSERT INTO K_DATABASE_TYPE (ID, CODE, DESCRIPTION, ADD_TIME, ADD_USER, EDIT_TIME, EDIT_USER, DEL_FLAG) VALUES ('27', 'MARIADB', 'MariaDB', null, null, null, null, 0);
INSERT INTO K_DATABASE_TYPE (ID, CODE, DESCRIPTION, ADD_TIME, ADD_USER, EDIT_TIME, EDIT_USER, DEL_FLAG) VALUES ('28', 'SAPDB', 'MaxDB (SAP DB)', null, null, null, null, 0);
INSERT INTO K_DATABASE_TYPE (ID, CODE, DESCRIPTION, ADD_TIME, ADD_USER, EDIT_TIME, EDIT_USER, DEL_FLAG) VALUES ('29', 'MONETDB', 'MonetDB', null, null, null, null, 0);
INSERT INTO K_DATABASE_TYPE (ID, CODE, DESCRIPTION, ADD_TIME, ADD_USER, EDIT_TIME, EDIT_USER, DEL_FLAG) VALUES ('30', 'MSACCESS', 'MS Access', null, null, null, null, 0);
INSERT INTO K_DATABASE_TYPE (ID, CODE, DESCRIPTION, ADD_TIME, ADD_USER, EDIT_TIME, EDIT_USER, DEL_FLAG) VALUES ('31', 'MSSQL', 'MS SQL Server', null, null, null, null, 0);
INSERT INTO K_DATABASE_TYPE (ID, CODE, DESCRIPTION, ADD_TIME, ADD_USER, EDIT_TIME, EDIT_USER, DEL_FLAG) VALUES ('32', 'MSSQLNATIVE', 'MS SQL Server (Native)', null, null, null, null, 0);
INSERT INTO K_DATABASE_TYPE (ID, CODE, DESCRIPTION, ADD_TIME, ADD_USER, EDIT_TIME, EDIT_USER, DEL_FLAG) VALUES ('33', 'MYSQL', 'MySQL', null, null, null, null, 0);
INSERT INTO K_DATABASE_TYPE (ID, CODE, DESCRIPTION, ADD_TIME, ADD_USER, EDIT_TIME, EDIT_USER, DEL_FLAG) VALUES ('34', 'MONDRIAN', 'Native Mondrian', null, null, null, null, 0);
INSERT INTO K_DATABASE_TYPE (ID, CODE, DESCRIPTION, ADD_TIME, ADD_USER, EDIT_TIME, EDIT_USER, DEL_FLAG) VALUES ('35', 'NEOVIEW', 'Neoview', null, null, null, null, 0);
INSERT INTO K_DATABASE_TYPE (ID, CODE, DESCRIPTION, ADD_TIME, ADD_USER, EDIT_TIME, EDIT_USER, DEL_FLAG) VALUES ('36', 'NETEZZA', 'Netezza', null, null, null, null, 0);
INSERT INTO K_DATABASE_TYPE (ID, CODE, DESCRIPTION, ADD_TIME, ADD_USER, EDIT_TIME, EDIT_USER, DEL_FLAG) VALUES ('37', 'ORACLE', 'Oracle', null, null, null, null, 0);
INSERT INTO K_DATABASE_TYPE (ID, CODE, DESCRIPTION, ADD_TIME, ADD_USER, EDIT_TIME, EDIT_USER, DEL_FLAG) VALUES ('38', 'ORACLERDB', 'Oracle RDB', null, null, null, null, 0);
INSERT INTO K_DATABASE_TYPE (ID, CODE, DESCRIPTION, ADD_TIME, ADD_USER, EDIT_TIME, EDIT_USER, DEL_FLAG) VALUES ('39', 'PALO', 'Palo MOLAP Server', null, null, null, null, 0);
INSERT INTO K_DATABASE_TYPE (ID, CODE, DESCRIPTION, ADD_TIME, ADD_USER, EDIT_TIME, EDIT_USER, DEL_FLAG) VALUES ('40', 'KettleThin', 'Pentaho Data Services', null, null, null, null, 0);
INSERT INTO K_DATABASE_TYPE (ID, CODE, DESCRIPTION, ADD_TIME, ADD_USER, EDIT_TIME, EDIT_USER, DEL_FLAG) VALUES ('41', 'POSTGRESQL', 'PostgreSQL', null, null, null, null, 0);
INSERT INTO K_DATABASE_TYPE (ID, CODE, DESCRIPTION, ADD_TIME, ADD_USER, EDIT_TIME, EDIT_USER, DEL_FLAG) VALUES ('42', 'REDSHIFT', 'Redshift', null, null, null, null, 0);
INSERT INTO K_DATABASE_TYPE (ID, CODE, DESCRIPTION, ADD_TIME, ADD_USER, EDIT_TIME, EDIT_USER, DEL_FLAG) VALUES ('43', 'REMEDY-AR-SYSTEM', 'Remedy Action Request System', null, null, null, null, 0);
INSERT INTO K_DATABASE_TYPE (ID, CODE, DESCRIPTION, ADD_TIME, ADD_USER, EDIT_TIME, EDIT_USER, DEL_FLAG) VALUES ('44', 'SAPR3', 'SAP ERP System', null, null, null, null, 0);
INSERT INTO K_DATABASE_TYPE (ID, CODE, DESCRIPTION, ADD_TIME, ADD_USER, EDIT_TIME, EDIT_USER, DEL_FLAG) VALUES ('45', 'SNOWFLAKEHV', 'Snowflake', null, null, null, null, 0);
INSERT INTO K_DATABASE_TYPE (ID, CODE, DESCRIPTION, ADD_TIME, ADD_USER, EDIT_TIME, EDIT_USER, DEL_FLAG) VALUES ('46', 'SPARKSIMBA', 'SparkSQL', null, null, null, null, 0);
INSERT INTO K_DATABASE_TYPE (ID, CODE, DESCRIPTION, ADD_TIME, ADD_USER, EDIT_TIME, EDIT_USER, DEL_FLAG) VALUES ('47', 'SQLITE', 'SQLite', null, null, null, null, 0);
INSERT INTO K_DATABASE_TYPE (ID, CODE, DESCRIPTION, ADD_TIME, ADD_USER, EDIT_TIME, EDIT_USER, DEL_FLAG) VALUES ('48', 'SYBASE', 'Sybase', null, null, null, null, 0);
INSERT INTO K_DATABASE_TYPE (ID, CODE, DESCRIPTION, ADD_TIME, ADD_USER, EDIT_TIME, EDIT_USER, DEL_FLAG) VALUES ('49', 'SYBASEIQ', 'SybaseIQ', null, null, null, null, 0);
INSERT INTO K_DATABASE_TYPE (ID, CODE, DESCRIPTION, ADD_TIME, ADD_USER, EDIT_TIME, EDIT_USER, DEL_FLAG) VALUES ('50', 'TERADATA', 'Teradata', null, null, null, null, 0);
INSERT INTO K_DATABASE_TYPE (ID, CODE, DESCRIPTION, ADD_TIME, ADD_USER, EDIT_TIME, EDIT_USER, DEL_FLAG) VALUES ('51', 'UNIVERSE', 'UniVerse database', null, null, null, null, 0);
INSERT INTO K_DATABASE_TYPE (ID, CODE, DESCRIPTION, ADD_TIME, ADD_USER, EDIT_TIME, EDIT_USER, DEL_FLAG) VALUES ('52', 'VERTICA', 'Vertica', null, null, null, null, 0);
INSERT INTO K_DATABASE_TYPE (ID, CODE, DESCRIPTION, ADD_TIME, ADD_USER, EDIT_TIME, EDIT_USER, DEL_FLAG) VALUES ('53', 'VERTICA5', 'Vertica 5+', null, null, null, null, 0);


create table K_FAIL_RETRY_LOG
(
    ID                   NVARCHAR2(32) not null
        constraint SYS_C0071492
            primary key
        constraint SYS_C0071484
            check (ID IS NOT NULL),
    FAIL_RETRY_SCRIPT_ID NVARCHAR2(32),
    FAIL_RETRY_RECORD_ID NVARCHAR2(32),
    EXECUTE_TIME         DATE,
    FAIL_RETRY_LOG       BLOB
)
/

comment on column K_FAIL_RETRY_LOG.FAIL_RETRY_SCRIPT_ID is '脚本ID'
/

comment on column K_FAIL_RETRY_LOG.FAIL_RETRY_RECORD_ID is '任务执行记录ID'
/

comment on column K_FAIL_RETRY_LOG.EXECUTE_TIME is '执行时间'
/

comment on column K_FAIL_RETRY_LOG.FAIL_RETRY_LOG is '执行日志'
/

create table K_LOG
(
    ID          NVARCHAR2(32),
    ADMDIVCODE  NVARCHAR2(255),
    TYPE        NVARCHAR2(255),
    TRANSNAME   NVARCHAR2(255),
    STEPNAME    NVARCHAR2(255),
    I           NUMBER,
    O           NUMBER,
    R           NUMBER,
    W           NUMBER,
    U           NUMBER,
    E           NUMBER,
    TIME        DATE,
    CATEGORY_ID NUMBER
)
/

comment on column K_LOG.ID is 'id'
/

comment on column K_LOG.ADMDIVCODE is '区划code'
/

comment on column K_LOG.TYPE is '1为读2为写3为其他'
/

comment on column K_LOG.TRANSNAME is '转换名'
/

comment on column K_LOG.STEPNAME is '步骤名'
/

comment on column K_LOG.I is '当前步骤生成的记录数（从表输出、文件读入）'
/

comment on column K_LOG.O is '当前步骤输出的记录数（输出的文件和表） '
/

comment on column K_LOG.R is '当前步骤从前一步骤读取的记录数 '
/

comment on column K_LOG.W is '当前步骤向后面步骤抛出的记录数 '
/

comment on column K_LOG.U is '当前步骤更新过的记录数 '
/

comment on column K_LOG.E is '当前步骤处理的记录数'
/

comment on column K_LOG.TIME is '完成时间'
/

comment on column K_LOG.CATEGORY_ID is '分类id'
/

create table K_QUARTZ
(
    ID                 NVARCHAR2(32) not null
        constraint SYS_C0071485
            check (ID IS NOT NULL),
    QUARTZ_DESCRIPTION NCLOB,
    QUARTZ_CRON        NVARCHAR2(100),
    ADD_TIME           DATE,
    ADD_USER           NVARCHAR2(32),
    EDIT_TIME          DATE,
    EDIT_USER          NVARCHAR2(32),
    DEL_FLAG           NUMBER
)
/

comment on table K_QUARTZ is '定时任务表'
/

comment on column K_QUARTZ.ID is '任务ID'
/

comment on column K_QUARTZ.QUARTZ_DESCRIPTION is '任务描述'
/

comment on column K_QUARTZ.QUARTZ_CRON is '定时策略'
/

comment on column K_QUARTZ.ADD_TIME is '添加时间'
/

comment on column K_QUARTZ.ADD_USER is '添加者'
/

comment on column K_QUARTZ.EDIT_TIME is '编辑时间'
/

comment on column K_QUARTZ.EDIT_USER is '编辑者'
/

comment on column K_QUARTZ.DEL_FLAG is '是否删除（0：存在；1：删除）'
/

INSERT INTO K_QUARTZ (ID, QUARTZ_DESCRIPTION, QUARTZ_CRON, ADD_TIME, ADD_USER, EDIT_TIME, EDIT_USER, DEL_FLAG) VALUES ('2', '每周一0点执行一次1245', '0 0 0 ? * 2', TO_DATE('2017-05-27 14:56:38', 'YYYY-MM-DD HH24:MI:SS'), '1', TO_DATE('2021-12-14 15:03:46', 'YYYY-MM-DD HH24:MI:SS'), '1', 0);
INSERT INTO K_QUARTZ (ID, QUARTZ_DESCRIPTION, QUARTZ_CRON, ADD_TIME, ADD_USER, EDIT_TIME, EDIT_USER, DEL_FLAG) VALUES ('3', '每月1日0点执行一次', '0 0 0 1 * ?', TO_DATE('2017-05-27 14:56:38', 'YYYY-MM-DD HH24:MI:SS'), '1', TO_DATE('2017-05-27 14:56:38', 'YYYY-MM-DD HH24:MI:SS'), '1', 0);
INSERT INTO K_QUARTZ (ID, QUARTZ_DESCRIPTION, QUARTZ_CRON, ADD_TIME, ADD_USER, EDIT_TIME, EDIT_USER, DEL_FLAG) VALUES ('4', '每日0点执行一次', '0 0 0 * * ?', TO_DATE('2017-05-27 14:44:13', 'YYYY-MM-DD HH24:MI:SS'), '1', TO_DATE('2017-05-27 14:44:15', 'YYYY-MM-DD HH24:MI:SS'), '1', 0);
INSERT INTO K_QUARTZ (ID, QUARTZ_DESCRIPTION, QUARTZ_CRON, ADD_TIME, ADD_USER, EDIT_TIME, EDIT_USER, DEL_FLAG) VALUES ('1', '立即执行一次', null, null, '1', null, '1', 0);
INSERT INTO K_QUARTZ (ID, QUARTZ_DESCRIPTION, QUARTZ_CRON, ADD_TIME, ADD_USER, EDIT_TIME, EDIT_USER, DEL_FLAG) VALUES ('462', '每天一点执行', '0 0 1 * * ?', TO_DATE('2020-05-13 18:09:38', 'YYYY-MM-DD HH24:MI:SS'), null, TO_DATE('2020-05-13 18:09:38', 'YYYY-MM-DD HH24:MI:SS'), null, 0);
INSERT INTO K_QUARTZ (ID, QUARTZ_DESCRIPTION, QUARTZ_CRON, ADD_TIME, ADD_USER, EDIT_TIME, EDIT_USER, DEL_FLAG) VALUES ('6', 'qaz', '0,1 * * * * ?', TO_DATE('2021-12-10 17:05:46', 'YYYY-MM-DD HH24:MI:SS'), '0', TO_DATE('2021-12-10 17:05:46', 'YYYY-MM-DD HH24:MI:SS'), '0', 0);


create table K_REPOSITORY
(
    ID            NVARCHAR2(32) not null
        constraint SYS_C0071486
            check (ID IS NOT NULL),
    REP_NAME      NVARCHAR2(50),
    REP_TYPE      NVARCHAR2(10),
    REP_USERNAME  NVARCHAR2(50),
    REP_PASSWORD  NVARCHAR2(50),
    REP_BASE_PATH NCLOB,
    DB_TYPE       NVARCHAR2(10),
    DB_ACCESS     NVARCHAR2(10),
    DB_HOST       NVARCHAR2(50),
    DB_PORT       NVARCHAR2(10),
    DB_NAME       NVARCHAR2(20),
    DB_USERNAME   NVARCHAR2(50),
    DB_PASSWORD   NVARCHAR2(50),
    ADD_TIME      DATE,
    ADD_USER      NVARCHAR2(32),
    EDIT_TIME     DATE,
    EDIT_USER     NVARCHAR2(32),
    DEL_FLAG      NUMBER
)
/

comment on table K_REPOSITORY is '资源库表'
/

comment on column K_REPOSITORY.ID is 'ID'
/

comment on column K_REPOSITORY.REP_NAME is '资源库名称'
/

comment on column K_REPOSITORY.REP_TYPE is '资源库类型: fileRep-文件, dbRep-数据库'
/

comment on column K_REPOSITORY.REP_USERNAME is '登录用户名'
/

comment on column K_REPOSITORY.REP_PASSWORD is '登录密码'
/

comment on column K_REPOSITORY.REP_BASE_PATH is '文件资源库路径: rep_type=fileRep生效'
/

comment on column K_REPOSITORY.DB_TYPE is '资源库数据库类型（MYSQL、ORACLE）'
/

comment on column K_REPOSITORY.DB_ACCESS is '资源库数据库访问模式（Native, ODBC, OCI, Plugin, JNDI)'
/

comment on column K_REPOSITORY.DB_HOST is '资源库数据库主机名或者IP地址'
/

comment on column K_REPOSITORY.DB_PORT is '资源库数据库端口号'
/

comment on column K_REPOSITORY.DB_NAME is '资源库数据库名称'
/

comment on column K_REPOSITORY.DB_USERNAME is '数据库登录账号'
/

comment on column K_REPOSITORY.DB_PASSWORD is '数据库登录密码'
/

comment on column K_REPOSITORY.ADD_TIME is '添加时间'
/

comment on column K_REPOSITORY.ADD_USER is '添加者'
/

comment on column K_REPOSITORY.EDIT_TIME is '编辑时间'
/

comment on column K_REPOSITORY.EDIT_USER is '编辑者'
/

comment on column K_REPOSITORY.DEL_FLAG is '是否删除（0：存在；1：删除）'
/

create unique index REP_NAME_UNIQUE_INDEX
    on K_REPOSITORY (REP_NAME)
/

create table K_SCRIPT
(
    ID                     NVARCHAR2(32),
    CATEGORY_ID            NVARCHAR2(32),
    SCRIPT_NAME            NVARCHAR2(50),
    SCRIPT_DESCRIPTION     NCLOB,
    SCRIPT_TYPE            NVARCHAR2(10),
    SCRIPT_PATH            NVARCHAR2(200),
    SCRIPT_REPOSITORY_ID   NVARCHAR2(50),
    SCRIPT_QUARTZ          NVARCHAR2(50),
    SYNC_STRATEGY          NVARCHAR2(50),
    SCRIPT_LOG_LEVEL       NVARCHAR2(50),
    SCRIPT_STATUS          NVARCHAR2(50),
    ADD_TIME               DATE,
    ADD_USER               NVARCHAR2(32),
    EDIT_TIME              DATE,
    EDIT_USER              NVARCHAR2(32),
    DEL_FLAG               NUMBER,
    SCRIPT_PARAMS          NCLOB,
    EXECUTE_TYPE           NVARCHAR2(10),
    FAIL_RETRY_TIME        NUMBER(11),
    FAIL_RETRY_SCRIPT_PATH NVARCHAR2(255),
    FAIL_RETRY_PARAMS      NVARCHAR2(500),
    FAIL_RETRY_SCRIPT_ID   NVARCHAR2(20),
    FAIL_RETRY_TYPE        NUMBER(11),
    FAIL_RETRY_SCRIPT_NAME NVARCHAR2(255)
)
/

comment on table K_SCRIPT is '采集脚本表'
/

comment on column K_SCRIPT.ID is '脚本ID'
/

comment on column K_SCRIPT.CATEGORY_ID is '分类ID（外键ID）'
/

comment on column K_SCRIPT.SCRIPT_NAME is '脚本名称'
/

comment on column K_SCRIPT.SCRIPT_DESCRIPTION is '任务描述'
/

comment on column K_SCRIPT.SCRIPT_TYPE is 'job,trans'
/

comment on column K_SCRIPT.SCRIPT_PATH is '脚本保存路径（可以是资源库中的路径也可以是服务器中保存作业文件的路径）'
/

comment on column K_SCRIPT.SCRIPT_REPOSITORY_ID is '作业的资源库ID'
/

comment on column K_SCRIPT.SCRIPT_QUARTZ is '定时策略（外键ID）'
/

comment on column K_SCRIPT.SYNC_STRATEGY is '同步策略(T+n)'
/

comment on column K_SCRIPT.SCRIPT_LOG_LEVEL is '日志级别(Basic，Detailed，Error，Debug，Minimal，Rowlevel）'
/

comment on column K_SCRIPT.SCRIPT_STATUS is '状态（1：正在运行；2：已停止）'
/

comment on column K_SCRIPT.ADD_TIME is '添加时间'
/

comment on column K_SCRIPT.ADD_USER is '添加者'
/

comment on column K_SCRIPT.EDIT_TIME is '编辑时间'
/

comment on column K_SCRIPT.EDIT_USER is '编辑者'
/

comment on column K_SCRIPT.DEL_FLAG is '是否删除（0：存在；1：删除）'
/

comment on column K_SCRIPT.SCRIPT_PARAMS is '参数'
/

comment on column K_SCRIPT.EXECUTE_TYPE is '执行类型（rep：资源库；file：文件；ftp：FTP）'
/

comment on column K_SCRIPT.FAIL_RETRY_TIME is '重试时间(S)'
/

comment on column K_SCRIPT.FAIL_RETRY_SCRIPT_PATH is '重试脚本路径'
/

comment on column K_SCRIPT.FAIL_RETRY_PARAMS is '重试参数'
/

comment on column K_SCRIPT.FAIL_RETRY_SCRIPT_ID is '重试脚本ID'
/

comment on column K_SCRIPT.FAIL_RETRY_TYPE is '重试类型（1，当前任务，2其他任务）'
/

comment on column K_SCRIPT.FAIL_RETRY_SCRIPT_NAME is '重试脚本名称'
/

create table K_SCRIPT_MONITOR
(
    ID                NVARCHAR2(32) not null
        constraint SYS_C0071493
            primary key
        constraint SYS_C0071487
            check (ID IS NOT NULL),
    MONITOR_SCRIPT_ID NVARCHAR2(32),
    MONITOR_SUCCESS   NUMBER,
    MONITOR_FAIL      NUMBER,
    MONITOR_STATUS    NUMBER,
    RUN_STATUS        NCLOB,
    LAST_EXECUTE_TIME DATE,
    NEXT_EXECUTE_TIME DATE,
    ADD_TIME          DATE,
    ADD_USER          NVARCHAR2(32),
    EDIT_TIME         DATE,
    EDIT_USER         NVARCHAR2(32),
    DEL_FLAG          NUMBER
)
/

comment on table K_SCRIPT_MONITOR is '监控表'
/

comment on column K_SCRIPT_MONITOR.ID is '监控ID'
/

comment on column K_SCRIPT_MONITOR.MONITOR_SCRIPT_ID is '监控的脚本的ID'
/

comment on column K_SCRIPT_MONITOR.MONITOR_SUCCESS is '成功次数'
/

comment on column K_SCRIPT_MONITOR.MONITOR_FAIL is '失败次数'
/

comment on column K_SCRIPT_MONITOR.MONITOR_STATUS is '监控状态（是否启动，1:启动；2:停止）'
/

comment on column K_SCRIPT_MONITOR.RUN_STATUS is '运行状态（起始时间-结束时间,起始时间-结束时间……）'
/

comment on column K_SCRIPT_MONITOR.LAST_EXECUTE_TIME is '上一次执行时间'
/

comment on column K_SCRIPT_MONITOR.NEXT_EXECUTE_TIME is '下一次执行时间'
/

comment on column K_SCRIPT_MONITOR.ADD_TIME is '添加时间'
/

comment on column K_SCRIPT_MONITOR.ADD_USER is '添加者'
/

comment on column K_SCRIPT_MONITOR.EDIT_TIME is '编辑时间'
/

comment on column K_SCRIPT_MONITOR.EDIT_USER is '编辑者'
/

comment on column K_SCRIPT_MONITOR.DEL_FLAG is '是否删除（0：存在；1：删除）'
/

create table K_SCRIPT_RECORD
(
    ID               NVARCHAR2(32) not null
        constraint SYS_C0071488
            check (ID IS NOT NULL),
    RECORD_SCRIPT_ID NVARCHAR2(32),
    START_TIME       DATE,
    STOP_TIME        DATE,
    RECORD_STATUS    NUMBER,
    LOG_FILE_PATH    NVARCHAR2(100),
    ADD_TIME         DATE,
    ADD_USER         NVARCHAR2(32),
    EDIT_TIME        DATE,
    EDIT_USER        NVARCHAR2(32),
    DEL_FLAG         NUMBER,
    CATEGORY_ID      NVARCHAR2(32)
)
/

comment on table K_SCRIPT_RECORD is '执行记录表'
/

comment on column K_SCRIPT_RECORD.ID is '记录ID'
/

comment on column K_SCRIPT_RECORD.RECORD_SCRIPT_ID is '脚本ID'
/

comment on column K_SCRIPT_RECORD.START_TIME is '启动时间'
/

comment on column K_SCRIPT_RECORD.STOP_TIME is '停止时间'
/

comment on column K_SCRIPT_RECORD.RECORD_STATUS is '任务执行结果（1：成功；0：失败）'
/

comment on column K_SCRIPT_RECORD.LOG_FILE_PATH is '转换日志记录文件保存位置'
/

comment on column K_SCRIPT_RECORD.ADD_TIME is '添加时间'
/

comment on column K_SCRIPT_RECORD.ADD_USER is '添加者'
/

comment on column K_SCRIPT_RECORD.EDIT_TIME is '编辑时间'
/

comment on column K_SCRIPT_RECORD.EDIT_USER is '编辑者'
/

comment on column K_SCRIPT_RECORD.DEL_FLAG is '是否删除（0：存在；1：删除）'
/

comment on column K_SCRIPT_RECORD.CATEGORY_ID is '分类ID'
/

create table K_USER
(
    ID        NVARCHAR2(70) not null
        constraint SYS_C0071494
            primary key
        constraint SYS_C0071489
            check (ID IS NOT NULL),
    NICKNAME  NVARCHAR2(50),
    EMAIL     NVARCHAR2(30),
    PHONE     NVARCHAR2(50),
    ACCOUNT   NVARCHAR2(50),
    PASSWORD  NCLOB,
    ADD_TIME  DATE,
    ADD_USER  NUMBER,
    EDIT_TIME DATE,
    EDIT_USER NUMBER,
    DEL_FLAG  NUMBER
)
/

comment on table K_USER is '用户表'
/

comment on column K_USER.ID is '用户ID'
/

comment on column K_USER.NICKNAME is '用户昵称'
/

comment on column K_USER.EMAIL is '用户邮箱'
/

comment on column K_USER.PHONE is '用于电话'
/

comment on column K_USER.ACCOUNT is '用户账号'
/

comment on column K_USER.PASSWORD is '用户密码'
/

comment on column K_USER.ADD_TIME is '添加时间'
/

comment on column K_USER.ADD_USER is '添加者'
/

comment on column K_USER.EDIT_TIME is '编辑时间'
/

comment on column K_USER.EDIT_USER is '编辑者'
/

comment on column K_USER.DEL_FLAG is '是否删除（0：存在；1：删除）'
/

create unique index UNIQUE_INDEX_ACCOUNT
    on K_USER (ACCOUNT)
/

