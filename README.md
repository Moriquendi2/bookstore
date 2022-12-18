# bookstore
一个JavaWeb电子书城项目，使用基础的Servle/JSP技术

姓名：杨浩       学号：202030443233

------

访问地址：http://39.108.140.223:8889

几个用于测试的账户的用户名和密码：

管理员：root    123456

商家：新华书店     xinhua

用户：张三    zhangsan

------

代码文件结构的简单说明：

```
├──db:数据库文件
  └── bookstore.sql: 包含三张表：cart_info/user_info/goods_info
├──src:数据集
  ├── main
    ├──java/com/mori
      ├── dao:操作数据库
      ├── entity:实体类型
      ├── service:接口
      ├── service_impl:实现
      ├── servlet:servlet
      └── utils:获取数据库连接
    ├──resources
    └──webapp
      ├── css
      ├── static:图片
      ├── WEB-INF
      └── ...jsp文件...
  ├── test
    ├── java
    └── resources
├──pom.xml:maven的配置文件
├──target:maven编译打包后的项目文件
  ├── ......
  └── bookstore-1.0-SNAPSHOT.war: 项目打包后文件
```
