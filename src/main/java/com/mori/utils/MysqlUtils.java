package com.mori.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;

import com.mori.service.UserInfoService;
import com.mori.service_impl.UserInfoServiceImpl;
import com.mori.entity.UserInfo;
/**
 * MySQL连接工具类
 * @author Mori
 *
 */

public class MysqlUtils {

    /**
     * 连接地址
     */
    // useSSL=false禁用SSL   useServerPrepStmts=true开启预编译功能
    private static String url = "jdbc:mysql://localhost:3306/bookstore?useUnicode=true&characterEncoding=utf-8&useSSL=false";
    /**
     * 连接用户名
     */
    private static String userName = "root";
    /**
     * 连接密码
     */
    private static String password = "123456";
    /**
     * 连接驱动
     */
    private static Connection conn = null;

    /**
     * 获得连接驱动
     * @return
     */
    public static Connection getConnection() {
        if (null == conn) {
            try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection(url, userName, password);
            } catch (ClassNotFoundException e) {
                System.out.println("MysqlUtils 类未发现异常");
                e.printStackTrace();
            } catch (SQLException e) {
                System.out.println("MysqlUtils SQL异常");
                e.printStackTrace();
            }
        }
        return conn;
    }

    public static void main(String[] args) {
        System.out.println(getConnection());   // 测试是否连通


        UserInfoService userInfoService = new UserInfoServiceImpl();
        List<UserInfo> list = userInfoService.userInfoList();
        list.forEach(entity -> {
            System.out.println(entity);
        });


    }
}