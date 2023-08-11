create table k_fail_retry_log
(
    ID                   varchar(32) not null
        primary key,
    FAIL_RETRY_SCRIPT_ID varchar(32) null comment '脚本ID',
    FAIL_RETRY_RECORD_ID varchar(32) null comment '任务执行记录ID',
    EXECUTE_TIME         datetime    null comment '执行时间',
    FAIL_RETRY_LOG       blob        null comment '执行日志'
);


alter table k_script
    add FAIL_RETRY_TIME int(4) null comment '重试时间(S)';

alter table k_script
    add FAIL_RETRY_SCRIPT_PATH varchar(255) null comment '重试脚本路径';

alter table k_script
    add FAIL_RETRY_PARAMS varchar(500) null comment '重试参数';

alter table k_script
    add FAIL_RETRY_SCRIPT_ID varchar(20) null comment '重试脚本ID';

alter table k_script
    add FAIL_RETRY_TYPE int(1) null comment '重试类型（1，当前任务，2其他任务）';

alter table k_script
    add FAIL_RETRY_SCRIPT_NAME varchar(255) null comment '重试脚本名称';

