# 常见问题
**什么是资源库？**   
&emsp;&emsp;资源库，顾名思义，是存放转换和作业脚本的地方，可以统一对脚本进行管理。当然，我们也可以不使用资源库，将脚本保存在本地硬盘的任意位置，但是在后期管理和运行中会有一些麻烦。另外，创建资源库过程中需要调用操作系统的浏览器内核，在 Windows 平台要求 IE 的版本在IE11及以上，在 Linux 平台要求 Firefox 的版本为最新版。   
————————————————   
版权声明：本文为CSDN博主「杨群」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。   
原文链接：https://blog.csdn.net/u011046671/article/details/115756193   

# webSpoon

**weSpoon报错：** 一个数据库错误发生在从资源库文件读取转换时 Invalid byte 1 of 1-byte UTF-8 sequence.    
**问题描述：** 点击数据整合编辑脚本时，webSpoon打开kettle脚本时报错。   
**问题原因：** Windows下默认的是GBK，但我们程序一般IO流中字符编码一般都设置的是utf-8，这样会导致中文乱码。因此需要修改file.encoding为UTF-8.如果应用容器是tomcat   
**解决办法：**   
1，windows   
修改catalina.bat      
tomcat7以下:

```shell
set JAVA_OPTS=%JAVA_OPTS% %LOGGING_CONFIG%的后面加上 -Dfile.encoding="UTF-8"
```

tomcat7:

```shell
set "JAVA_OPTS=%JAVA_OPTS% %LOGGING_CONFIG% -Dfile.encoding=UTF-8"
```
其他解决办法  [webSpoon UTF-8报错](hhttps://blog.csdn.net/rjbcxhc/article/details/128020807) 

**webSpoon没有connection：** webSpoon页面右上角没有connection按钮   
**问题描述：**  webSpoon页面右上角没有connection按钮   
**问题原因：**  缺少connection插件；客户端字符集问题   
**解决办法：**   
1，第一次运行  
如第一次运行页面上就没有connection按钮，请将客户端plugins，system目录拷贝到startup.bat（tomcat启动脚本）同级目录

2、之前可以连接可以，增加了一个之后就打不开   
请检查当前用户目录下.kettle/目录中repositories.xml文件中是否有中文

**webSpoon保存转圈圈：** webSpoon保存新的脚本的时候一直在转圈圈   
**问题描述：**  
spoon/osgi/cxf/browser/loadFilesAndFolders/%2F?v=1649812390.2454703&cid=93e2fd76   
直接打开可以看到报的是400错误，并报invalid url错误。   
这个错误是由于%2F这个特殊符号的问题，这个符号是/的转义。   
**解决办法：**   
在执行tomcat时，添加转义支持，然后重启webSpoon的tomcat即可

```shell
vim tomcat/conf/catalina.properties
#在最后添加两行配置
tomcat.util.http.parser.HttpParser.requestTargetAllow=|{}
org.apache.tomcat.util.buf.UDecoder.ALLOW_ENCODED_SLASH=true
```

感谢[@欲速则不达提供](https://gitee.com/da_xu) 的解决办法[spoonweb保存400问题解决](https://www.cnblogs.com/xusir/p/16138860.html)

**webSpoon如何屏蔽核心对象中不需要的插件：**   
**问题描述：**  
日常使用中可能大部分插件都不会使用，可通过配置kettle-steps.xml文件的方式，将不需要使用的插件进行屏蔽   
**解决办法：**   
在执行tomcat时，添加转义支持，然后重启webSpoon的tomcat即可

```shell
vim tomcat/conf/catalina.properties
#在最后添加两行配置
tomcat.util.http.parser.HttpParser.requestTargetAllow=|{}
org.apache.tomcat.util.buf.UDecoder.ALLOW_ENCODED_SLASH=true
```

感谢[@欲速则不达提供](https://gitee.com/da_xu) 的解决办法[spoonweb保存400问题解决](https://www.cnblogs.com/xusir/p/16138860.html)



**webSpoon汉化配置：**
```shell
cd /usr/local/tomcat/bin
vim setenv.sh
```
在文件末尾追加这两项配置 保存   
```shell
CATALINA_OPTS="-Dorg.apache.tomcat.util.buf.UDecoder.ALLOW_ENCODED_SLASH=true"
JAVA_OPTS="-Duser.language=zh -Duser.region=CN -Dfile.encoding=UTF-8"
```
————————————————   
版权声明：本文为CSDN博主「ljlao2」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/qq_37349379/article/details/127082840


# oracle

1、下载Oracle驱动包。[download](http://file.35youth.cn/index.php?share/file&user=1&sid=vMB2VDPb)   
2、执行命令，将oracle驱动包打到本地仓库

```shell
mvn install:install-file -DgroupId=com.oracle -DartifactId=ojdbc6 -Dversion=11.2.0 -Dpackaging=jar -Dfile=c:\\ojdbc6-11.2.0.jar
```
