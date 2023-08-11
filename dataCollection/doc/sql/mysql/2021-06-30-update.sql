create table k_user
(
    ID        varchar(70) not null comment '用户ID'
        primary key,
    NICKNAME  varchar(50) null comment '用户昵称',
    EMAIL     varchar(30) null comment '用户邮箱',
    PHONE     varchar(50) null comment '用于电话',
    ACCOUNT   varchar(50) null comment '用户账号',
    PASSWORD  text        null comment '用户密码',
    ADD_TIME  datetime    null comment '添加时间',
    ADD_USER  decimal(11) null comment '添加者',
    EDIT_TIME datetime    null comment '编辑时间',
    EDIT_USER decimal(11) null comment '编辑者',
    DEL_FLAG  decimal(11) null comment '是否删除（0：存在；1：删除）',
    constraint UNIQUE_INDEX_ACCOUNT
        unique (ACCOUNT)
)
    comment '用户表';

