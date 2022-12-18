package com.mori.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.mori.entity.UserInfo;
import com.mori.utils.MysqlUtils;


/**
 * 用户数据交互层
 *
 * @author Mori
 *
 */
public class UserInfoDao {


    // 将查到的数据写入UserInfo实体
    public static List<UserInfo> userInfoList() {
        List<UserInfo> list = new ArrayList<>();
        Connection conn = MysqlUtils.getConnection();
        // select * from user_info;
        String sql = "select A.id, A.type, A.name, A.password, A.email, A.address, A.telephone from user_info A;";
        try {
            PreparedStatement pStatement = conn.prepareStatement(sql);
            ResultSet resultSet = pStatement.executeQuery();
            UserInfo entity = null;
            while (resultSet.next()) {
                entity = new UserInfo();
                entity.setId(resultSet.getInt("id"));
                entity.setType(resultSet.getString("type"));
                entity.setName(resultSet.getString("name"));
                entity.setPassword(resultSet.getString("password"));
                entity.setEmail(resultSet.getString("email"));
                entity.setAddress(resultSet.getString("address"));
                entity.setTelephone(resultSet.getString("telephone"));
                list.add(entity);
            }
            // System.out.println(list.size());
            resultSet.close();
            pStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
//        for (Iterator<UserInfo> it = list.iterator(); it.hasNext();) {
//            System.out.println(it.next().getPassword());
//            System.out.println(it.next().getEmail());
//            System.out.println(it.next().getAddress());
//        }
        return list;
    }

    // 添加新用户
    public static void saveUserInfo(UserInfo entity) {
        String sql = "INSERT INTO user_info (name, password, email, address, telephone, type) VALUES (?, ?, ?, ?, ?, ?);";
        Connection conn = MysqlUtils.getConnection();
        try {
            PreparedStatement pStatement = conn.prepareStatement(sql);
            pStatement.setString(1, entity.getName());
            pStatement.setString(2, entity.getPassword());
            pStatement.setString(3, entity.getEmail());
            pStatement.setString(4, entity.getAddress());
            pStatement.setString(5, entity.getTelephone());
            pStatement.setString(6, entity.getType());
            int count = pStatement.executeUpdate();   // 执行完DML语句后，受影响的行数，>0表示修改成功，否则失败
            pStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // 通过id得到用户实体
    public static UserInfo getUserInfoById(int id) {
        String sql = "select A.id, A.name, A.password, A.email, A.address, A.telephone, A.type from user_info A where A.id = " + id;
        Connection conn = MysqlUtils.getConnection();
        UserInfo entity = null;
        try {
            PreparedStatement pStatement = conn.prepareStatement(sql);
            ResultSet resultSet = pStatement.executeQuery();
            while (resultSet.next()) {
                entity = new UserInfo();
                entity.setId(resultSet.getInt("id"));
                entity.setName(resultSet.getString("name"));
                entity.setPassword(resultSet.getString("password"));
                entity.setEmail(resultSet.getString("email"));
                entity.setAddress(resultSet.getString("address"));
                entity.setTelephone(resultSet.getString("telephone"));
                entity.setType(resultSet.getString("type"));
            }
            resultSet.close();
            pStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return entity;
    }

    // 通过用户名username得到用户实体
    public static UserInfo getUserInfoByName(String username) {
        String sql = "select A.id, A.type, A.name, A.password, A.email, A.address, A.telephone from user_info A where A.name = ?;";
        Connection conn = MysqlUtils.getConnection();
        UserInfo entity = null;
        try {
            PreparedStatement pStatement = conn.prepareStatement(sql);
            pStatement.setString(1, username);
            ResultSet resultSet = pStatement.executeQuery();
            while (resultSet.next()) {
                entity = new UserInfo();
                entity.setId(resultSet.getInt("id"));
                entity.setType(resultSet.getString("type"));
                entity.setName(resultSet.getString("name"));
                entity.setPassword(resultSet.getString("password"));
                entity.setEmail(resultSet.getString("email"));
                entity.setAddress(resultSet.getString("address"));
                entity.setTelephone(resultSet.getString("telephone"));
            }
            resultSet.close();
            pStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return entity;
    }

    // 更新用户信息
    public static void updateUserInfoById(UserInfo entity) {
        String sql = "UPDATE user_info SET name=?, password=?, email=?, address=?, telephone=? WHERE (id=?);";
        Connection conn = MysqlUtils.getConnection();
        try {
            PreparedStatement pStatement = conn.prepareStatement(sql);
            pStatement.setString(1, entity.getName());
            pStatement.setString(2, entity.getPassword());
            pStatement.setString(3, entity.getEmail());
            pStatement.setString(4, entity.getAddress());
            pStatement.setString(5, entity.getTelephone());
            pStatement.setInt(6, entity.getId());
            pStatement.executeUpdate();
            pStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // 删除用户信息
    public static void deleteUserInfoById(int id) {
        String sql = "delete from user_info where id = " + id;
        Connection conn = MysqlUtils.getConnection();
        try {
            PreparedStatement pStatement = conn.prepareStatement(sql);
            pStatement.executeUpdate();
            pStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    // 分页查询
    public static List<UserInfo> selectByPage(int begin, int size, String username, String type) {
        List<UserInfo> list = new ArrayList<>();
        Connection conn = MysqlUtils.getConnection();
        // select * from user_info;
        String sql = "select A.id, A.type, A.name, A.password, A.email, A.address, A.telephone " +
                "from user_info A where name like ? and type like ? limit ? , ?;" ;
        try {
            PreparedStatement pStatement = conn.prepareStatement(sql);
            pStatement.setString(1, username);
            pStatement.setString(2, type);
            pStatement.setInt(3, begin);
            pStatement.setInt(4, size);

            ResultSet resultSet = pStatement.executeQuery();
            UserInfo entity = null;
            while (resultSet.next()) {
                entity = new UserInfo();
                entity.setId(resultSet.getInt("id"));
                entity.setType(resultSet.getString("type"));
                entity.setName(resultSet.getString("name"));
                entity.setPassword(resultSet.getString("password"));
                entity.setEmail(resultSet.getString("email"));
                entity.setAddress(resultSet.getString("address"));
                entity.setTelephone(resultSet.getString("telephone"));
                list.add(entity);
            }
            // System.out.println(list.size());
            resultSet.close();
            pStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
//        for (Iterator<UserInfo> it = list.iterator(); it.hasNext();) {
//            System.out.println(it.next().getPassword());
//            System.out.println(it.next().getEmail());
//            System.out.println(it.next().getAddress());
//        }
        return list;
    }

    // 查询总记录数（即：总共查出了多少个？）
    public static int selectTotalCount(String username, String type) {
        String sql = "select count(*) total from user_info where name like ? and type like ?;";
        Connection conn = MysqlUtils.getConnection();
        int num = 0;
        try {
            PreparedStatement pStatement = conn.prepareStatement(sql);
            pStatement.setString(1, username);
            pStatement.setString(2, type);
            ResultSet resultSet = pStatement.executeQuery();
            while (resultSet.next()) {
                num = resultSet.getInt("total");
            }
            resultSet.close();
            pStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return num;
    }






    }