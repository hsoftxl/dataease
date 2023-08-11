create table di_category
(
    ID           varchar(32)  not null comment '主键id'
        primary key,
    NAME         varchar(255) null comment '整合名称',
    CATEGORY_PID varchar(32)  null comment '父级id',
    IS_DEFAULT   decimal(1)   null comment '1不允许删除，0允许删除',
    REP_ID       varchar(32)  null comment '资源库id',
    PATH         varchar(255) null comment '文件路径',
    CATEGORY_ID  varchar(255) null comment '对应资源库目录id',
    CODE         varchar(255) null comment '树层级编码'
);

create table di_script
(
    ID          varchar(32)  not null comment '主键id'
        primary key,
    NAME        varchar(255) null comment '名称',
    TYPE        varchar(255) null comment '类型',
    PATH        varchar(255) null comment '脚本路径',
    CATEGORY_ID varchar(32)  null comment '整合分类id',
    SCRIPT_ID   varchar(32)  null comment '脚本id',
    REP_ID      varchar(32)  null comment '资源库id',
    CREATE_DATE datetime     null comment '创建时间'
);

create table k_category
(
    ID             varchar(32) not null comment '分类ID',
    CATEGORY_NAME  varchar(50) null comment '分类名称',
    CATEGORY_LEVEL decimal(1)  null comment '分类级次',
    PARENT_ID      varchar(32) null comment '父级ID',
    ADD_TIME       datetime    null comment '添加时间',
    ADD_USER       varchar(32) null comment '添加者',
    EDIT_TIME      datetime    null comment '编辑时间',
    EDIT_USER      varchar(32) null comment '编辑者',
    DEL_FLAG       decimal(11) null comment '是否删除（0：存在；1：删除）',
    constraint CATEGORY_NAME_UNIQUE_INDEX
        unique (CATEGORY_NAME)
)
    comment '分类表';

create table k_database_type
(
    ID          varchar(32)  not null comment '主键',
    CODE        varchar(255) null comment '编码',
    DESCRIPTION varchar(255) null comment '描述',
    ADD_TIME    datetime     null comment '添加时间',
    ADD_USER    varchar(32)  null comment '添加者',
    EDIT_TIME   datetime     null comment '编辑时间',
    EDIT_USER   varchar(32)  null comment '编辑者',
    DEL_FLAG    decimal(11)  null comment '是否删除（0：存在；1：删除）'
)
    comment '数据库连接类型表';

-- ----------------------------
-- Records of k_database_type
-- ----------------------------
INSERT INTO `k_database_type` VALUES ('1', 'DERBY', 'Apache Derby', NULL, NULL, NULL, NULL, 0);
INSERT INTO `k_database_type` VALUES ('2', 'AS/400', 'AS/400', NULL, NULL, NULL, NULL, 0);
INSERT INTO `k_database_type` VALUES ('3', 'INTERBASE', 'Borland Interbase', NULL, NULL, NULL, NULL, 0);
INSERT INTO `k_database_type` VALUES ('4', 'INFINIDB', 'Calpont InfiniDB', NULL, NULL, NULL, NULL, 0);
INSERT INTO `k_database_type` VALUES ('5', 'IMPALASIMBA', 'Cloudera Impala', NULL, NULL, NULL, NULL, 0);
INSERT INTO `k_database_type` VALUES ('6', 'DBASE', 'dBase III, IV or 5', NULL, NULL, NULL, NULL, 0);
INSERT INTO `k_database_type` VALUES ('7', 'EXASOL4', 'Exasol 4', NULL, NULL, NULL, NULL, 0);
INSERT INTO `k_database_type` VALUES ('8', 'EXTENDB', 'ExtenDB', NULL, NULL, NULL, NULL, 0);
INSERT INTO `k_database_type` VALUES ('9', 'FIREBIRD', 'Firebird SQL', NULL, NULL, NULL, NULL, 0);
INSERT INTO `k_database_type` VALUES ('10', 'GENERIC', 'Generic database', NULL, NULL, NULL, NULL, 0);
INSERT INTO `k_database_type` VALUES ('11', 'GOOGLEBIGQUERY', 'Google BigQuery', NULL, NULL, NULL, NULL, 0);
INSERT INTO `k_database_type` VALUES ('12', 'GREENPLUM', 'Greenplum', NULL, NULL, NULL, NULL, 0);
INSERT INTO `k_database_type` VALUES ('13', 'SQLBASE', 'Gupta SQL Base', NULL, NULL, NULL, NULL, 0);
INSERT INTO `k_database_type` VALUES ('14', 'H2', 'H2', NULL, NULL, NULL, NULL, 0);
INSERT INTO `k_database_type` VALUES ('15', 'HIVE', 'Hadoop Hive', NULL, NULL, NULL, NULL, 0);
INSERT INTO `k_database_type` VALUES ('16', 'HIVE2', 'Hadoop Hive 2/3', NULL, NULL, NULL, NULL, 0);
INSERT INTO `k_database_type` VALUES ('17', 'HYPERSONIC', 'Hypersonic', NULL, NULL, NULL, NULL, 0);
INSERT INTO `k_database_type` VALUES ('18', 'DB2', 'IBM DB2', NULL, NULL, NULL, NULL, 0);
INSERT INTO `k_database_type` VALUES ('19', 'IMPALA', 'Impala', NULL, NULL, NULL, NULL, 0);
INSERT INTO `k_database_type` VALUES ('20', 'INFOBRIGHT', 'Infobright', NULL, NULL, NULL, NULL, 0);
INSERT INTO `k_database_type` VALUES ('21', 'INFORMIX', 'Informix', NULL, NULL, NULL, NULL, 0);
INSERT INTO `k_database_type` VALUES ('22', 'INGRES', 'Ingres', NULL, NULL, NULL, NULL, 0);
INSERT INTO `k_database_type` VALUES ('23', 'VECTORWISE', 'Ingres VectorWise', NULL, NULL, NULL, NULL, 0);
INSERT INTO `k_database_type` VALUES ('24', 'CACHE', 'Intersystems Cache', NULL, NULL, NULL, NULL, 0);
INSERT INTO `k_database_type` VALUES ('25', 'KINGBASEES', 'KingbaseES', NULL, NULL, NULL, NULL, 0);
INSERT INTO `k_database_type` VALUES ('26', 'LucidDB', 'LucidDB', NULL, NULL, NULL, NULL, 0);
INSERT INTO `k_database_type` VALUES ('27', 'MARIADB', 'MariaDB', NULL, NULL, NULL, NULL, 0);
INSERT INTO `k_database_type` VALUES ('28', 'SAPDB', 'MaxDB (SAP DB)', NULL, NULL, NULL, NULL, 0);
INSERT INTO `k_database_type` VALUES ('29', 'MONETDB', 'MonetDB', NULL, NULL, NULL, NULL, 0);
INSERT INTO `k_database_type` VALUES ('30', 'MSACCESS', 'MS Access', NULL, NULL, NULL, NULL, 0);
INSERT INTO `k_database_type` VALUES ('31', 'MSSQL', 'MS SQL Server', NULL, NULL, NULL, NULL, 0);
INSERT INTO `k_database_type` VALUES ('32', 'MSSQLNATIVE', 'MS SQL Server (Native)', NULL, NULL, NULL, NULL, 0);
INSERT INTO `k_database_type` VALUES ('33', 'MYSQL', 'MySQL', NULL, NULL, NULL, NULL, 0);
INSERT INTO `k_database_type` VALUES ('34', 'MONDRIAN', 'Native Mondrian', NULL, NULL, NULL, NULL, 0);
INSERT INTO `k_database_type` VALUES ('35', 'NEOVIEW', 'Neoview', NULL, NULL, NULL, NULL, 0);
INSERT INTO `k_database_type` VALUES ('36', 'NETEZZA', 'Netezza', NULL, NULL, NULL, NULL, 0);
INSERT INTO `k_database_type` VALUES ('37', 'ORACLE', 'Oracle', NULL, NULL, NULL, NULL, 0);
INSERT INTO `k_database_type` VALUES ('38', 'ORACLERDB', 'Oracle RDB', NULL, NULL, NULL, NULL, 0);
INSERT INTO `k_database_type` VALUES ('39', 'PALO', 'Palo MOLAP Server', NULL, NULL, NULL, NULL, 0);
INSERT INTO `k_database_type` VALUES ('40', 'KettleThin', 'Pentaho Data Services', NULL, NULL, NULL, NULL, 0);
INSERT INTO `k_database_type` VALUES ('41', 'POSTGRESQL', 'PostgreSQL', NULL, NULL, NULL, NULL, 0);
INSERT INTO `k_database_type` VALUES ('42', 'REDSHIFT', 'Redshift', NULL, NULL, NULL, NULL, 0);
INSERT INTO `k_database_type` VALUES ('43', 'REMEDY-AR-SYSTEM', 'Remedy Action Request System', NULL, NULL, NULL, NULL, 0);
INSERT INTO `k_database_type` VALUES ('44', 'SAPR3', 'SAP ERP System', NULL, NULL, NULL, NULL, 0);
INSERT INTO `k_database_type` VALUES ('45', 'SNOWFLAKEHV', 'Snowflake', NULL, NULL, NULL, NULL, 0);
INSERT INTO `k_database_type` VALUES ('46', 'SPARKSIMBA', 'SparkSQL', NULL, NULL, NULL, NULL, 0);
INSERT INTO `k_database_type` VALUES ('47', 'SQLITE', 'SQLite', NULL, NULL, NULL, NULL, 0);
INSERT INTO `k_database_type` VALUES ('48', 'SYBASE', 'Sybase', NULL, NULL, NULL, NULL, 0);
INSERT INTO `k_database_type` VALUES ('49', 'SYBASEIQ', 'SybaseIQ', NULL, NULL, NULL, NULL, 0);
INSERT INTO `k_database_type` VALUES ('50', 'TERADATA', 'Teradata', NULL, NULL, NULL, NULL, 0);
INSERT INTO `k_database_type` VALUES ('51', 'UNIVERSE', 'UniVerse database', NULL, NULL, NULL, NULL, 0);
INSERT INTO `k_database_type` VALUES ('52', 'VERTICA', 'Vertica', NULL, NULL, NULL, NULL, 0);
INSERT INTO `k_database_type` VALUES ('53', 'VERTICA5', 'Vertica 5+', NULL, NULL, NULL, NULL, 0);

create table k_log
(
    ID          varchar(32)  null comment 'id',
    ADMDIVCODE  varchar(255) null comment '区划code',
    TYPE        varchar(255) null comment '1为读2为写3为其他',
    TRANSNAME   varchar(255) null comment '转换名',
    STEPNAME    varchar(255) null comment '步骤名',
    I           decimal(32)  null comment '当前步骤生成的记录数（从表输出、文件读入）',
    O           decimal(32)  null comment '当前步骤输出的记录数（输出的文件和表） ',
    R           decimal(32)  null comment '当前步骤从前一步骤读取的记录数 ',
    W           decimal(32)  null comment '当前步骤向后面步骤抛出的记录数 ',
    U           decimal(32)  null comment '当前步骤更新过的记录数 ',
    E           decimal(32)  null comment '当前步骤处理的记录数',
    TIME        datetime     null comment '完成时间',
    CATEGORY_ID decimal(32)  null comment '分类id'
);

create table k_quartz
(
    ID                 varchar(32)  not null comment '任务ID',
    QUARTZ_DESCRIPTION text         null comment '任务描述',
    QUARTZ_CRON        varchar(100) null comment '定时策略',
    ADD_TIME           datetime     null comment '添加时间',
    ADD_USER           varchar(32)  null comment '添加者',
    EDIT_TIME          datetime     null comment '编辑时间',
    EDIT_USER          varchar(32)  null comment '编辑者',
    DEL_FLAG           decimal(11)  null comment '是否删除（0：存在；1：删除）'
)
    comment '定时任务表';

create table k_repository
(
    ID            varchar(32) not null comment 'ID',
    REP_NAME      varchar(50) null comment '资源库名称',
    REP_TYPE      varchar(10) null comment '资源库类型: fileRep-文件, dbRep-数据库',
    REP_USERNAME  varchar(50) null comment '登录用户名',
    REP_PASSWORD  varchar(50) null comment '登录密码',
    REP_BASE_PATH text        null comment '文件资源库路径: rep_type=fileRep生效',
    DB_TYPE       varchar(10) null comment '资源库数据库类型（MYSQL、ORACLE）',
    DB_ACCESS     varchar(10) null comment '资源库数据库访问模式（Native, ODBC, OCI, Plugin, JNDI)',
    DB_HOST       varchar(50) null comment '资源库数据库主机名或者IP地址',
    DB_PORT       varchar(10) null comment '资源库数据库端口号',
    DB_NAME       varchar(20) null comment '资源库数据库名称',
    DB_USERNAME   varchar(50) null comment '数据库登录账号',
    DB_PASSWORD   varchar(50) null comment '数据库登录密码',
    ADD_TIME      datetime    null comment '添加时间',
    ADD_USER      varchar(32) null comment '添加者',
    EDIT_TIME     datetime    null comment '编辑时间',
    EDIT_USER     varchar(32) null comment '编辑者',
    DEL_FLAG      decimal(11) null comment '是否删除（0：存在；1：删除）',
    constraint REP_NAME_UNIQUE_INDEX
        unique (REP_NAME)
)
    comment '资源库表';

create table k_script
(
    ID                   varchar(32)  null comment '脚本ID',
    CATEGORY_ID          varchar(32)  null comment '分类ID（外键ID）',
    SCRIPT_NAME          varchar(50)  null comment '脚本名称',
    SCRIPT_DESCRIPTION   text         null comment '任务描述',
    SCRIPT_TYPE          varchar(10)  null comment 'job,trans',
    SCRIPT_PATH          varchar(200) null comment '脚本保存路径（可以是资源库中的路径也可以是服务器中保存作业文件的路径）',
    SCRIPT_REPOSITORY_ID varchar(50)  null comment '作业的资源库ID',
    SCRIPT_QUARTZ        varchar(50)  null comment '定时策略（外键ID）',
    SYNC_STRATEGY        varchar(50)  null comment '同步策略(T+n)',
    SCRIPT_LOG_LEVEL     varchar(50)  null comment '日志级别(Basic，Detailed，Error，Debug，Minimal，Rowlevel）',
    SCRIPT_STATUS        varchar(50)  null comment '状态（1：正在运行；2：已停止）',
    ADD_TIME             datetime     null comment '添加时间',
    ADD_USER             varchar(32)  null comment '添加者',
    EDIT_TIME            datetime     null comment '编辑时间',
    EDIT_USER            varchar(32)  null comment '编辑者',
    DEL_FLAG             decimal(11)  null comment '是否删除（0：存在；1：删除）',
    SCRIPT_PARAMS        text         null comment '参数',
    EXECUTE_TYPE         varchar(10)  null comment '执行类型（rep：资源库；file：文件；ftp：FTP）'
)
    comment '采集脚本表';

create table k_script_monitor
(
    ID                varchar(32) not null comment '监控ID'
        primary key,
    MONITOR_SCRIPT_ID varchar(32) null comment '监控的脚本的ID',
    MONITOR_SUCCESS   varchar(32) null comment '成功次数',
    MONITOR_FAIL      varchar(32) null comment '失败次数',
    MONITOR_STATUS    decimal(11) null comment '监控状态（是否启动，1:启动；2:停止）',
    RUN_STATUS        longtext    null comment '运行状态（起始时间-结束时间,起始时间-结束时间……）',
    LAST_EXECUTE_TIME datetime    null comment '上一次执行时间',
    NEXT_EXECUTE_TIME datetime    null comment '下一次执行时间',
    ADD_TIME          datetime    null comment '添加时间',
    ADD_USER          varchar(32) null comment '添加者',
    EDIT_TIME         datetime    null comment '编辑时间',
    EDIT_USER         varchar(32) null comment '编辑者',
    DEL_FLAG          decimal(11) null comment '是否删除（0：存在；1：删除）'
)
    comment '监控表';

create table k_script_record
(
    ID               varchar(32)  not null comment '记录ID',
    RECORD_SCRIPT_ID varchar(32)  null comment '脚本ID',
    START_TIME       datetime     null comment '启动时间',
    STOP_TIME        datetime     null comment '停止时间',
    RECORD_STATUS    decimal(11)  null comment '任务执行结果（1：成功；0：失败）',
    LOG_FILE_PATH    varchar(200) null comment '转换日志记录文件保存位置',
    ADD_TIME         datetime     null comment '添加时间',
    ADD_USER         varchar(32)  null comment '添加者',
    EDIT_TIME        datetime     null comment '编辑时间',
    EDIT_USER        varchar(32)  null comment '编辑者',
    DEL_FLAG         decimal(11)  null comment '是否删除（0：存在；1：删除）',
    CATEGORY_ID      varchar(32)  null comment '分类ID'
)
    comment '执行记录表';

