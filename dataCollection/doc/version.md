# 版本记录列表
功能更新列表按提交记录每次更新内容，重要更新前面会增加★标识（重要更新可能设计数据库变更）

### V0.0.7
发布日期：2022-04-17   
部署包：[version 0.0.7 download](https://pan.baidu.com/s/19aVUtLNEUOao_FthAc-x2w) 提取码：f62u            
版本说明：   
1、增加执行实时日志      
2、增加webHook功能，感谢[@张占刚](https://gitee.com/gleen_zzg_admin)   
3、重构数据整合功能，直接调用kettle底层API实现   
4、增加数据库资源库连接池功能，感谢[@Leslie](https://gitee.com/LeslieHwang)    
5、通过数据库连接池,解决数据库超时短线问题   
6、增加动态加载驱动包功能   
7、增加失败重试功能   


### V0.0.6
发布日期：2021-08-30   
部署包：[version 0.0.6 download](https://pan.baidu.com/s/1Z6zvny-xRs9I48ZLX-SX2Q) 提取码：otwv            
版本说明：   
1、修复若干BUG   
2、增加采集任务立即执行（临时）一次功能   
2、增加发送失败邮件提醒（需配置文件添加收发件配置）   

### V0.0.5
发布日期：2021-07-29   
部署包：[version 0.0.5 download](https://pan.baidu.com/s/16CKlUFdYMImpZm9nNH42tA) 提取码：jm8h      
版本说明：   
1、升级kettle版本至9.1.0.0-324   
2、解决资源库创建时BUG   
3、解决数据整合初始化时没有脚本报错的bug   
4、解决监控页面不显示统计数，执行时间等信息   
5、解决系统重启后，需要手动重启任务   


### V0.0.4
发布日期：2021-07-13   
部署包：[version 0.0.4 download](https://pan.baidu.com/s/1cFpOFbZt3aaQSys-nScGcA) 提取码：7ev8      
版本说明：增加登录配置功能，application.yml文件中，shouldLogin 属性控制是否需要登录


### V0.0.3   
发布日期：2021-06-30   
部署包：[version 0.0.3 download](https://pan.baidu.com/s/1AD_1ouLN0U3YsNkTnDOS9A) 提取码：wxm3   
版本说明：增加用户管理模块，解决kettle连接mysql资源库驱动版本过高问题   
**★ 重要更新说明**   
库中需增加k_user表，建表语句：   
[MySQL 脚本](./sql/mysql/2021-06-30-update.sql)   
[Oracle 脚本](./sql/oracle/2021-06-30-update.sql)   


### V0.0.2
发布日期：2021-06-28   
部署包：[version 0.0.2 download](https://pan.baidu.com/s/1w5gV_5rCHXKXfPwQRtJajw) 提取码：w2l7   
版本说明：优化mybatis-plus分页，设置成自动获取数据库类型。


### V0.0.1
发布日期：2021-06-28   
部署包： [version 0.0.1 download](https://pan.baidu.com/s/1qBuGDyScIM2qMtRB56Woyg) 提取码：sg2h   
版本说明：第一个正式版本的包，暂未在生产环境跑过。   
**★ 重要更新说明**   
1、去除监控语句中mysql函数IFNULL()；修改表结构，将MONITOR_STATUS，MONITOR_FAIL改为数值类型，默认为0（运行/doc/sql/dbType/2021-06-28-update.sql文件更新库表结构）   
2、修复资源库编辑BUG