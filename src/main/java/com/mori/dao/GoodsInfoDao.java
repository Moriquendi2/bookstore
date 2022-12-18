package com.mori.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.mori.entity.GoodsInfo;
import com.mori.entity.Order;
import com.mori.entity.UserInfo;
import com.mori.utils.MysqlUtils;

/**
 * 商品数据交互层
 *
 * @author Mori
 *
 */
public class GoodsInfoDao {
    // 将查到的数据写入GoodsInfo实体
    public static List<GoodsInfo> goodsInfoList() {
        List<GoodsInfo> list = new ArrayList<>();
        Connection conn = MysqlUtils.getConnection();

        String sql = "select A.id, A.name, A.description, A.price, A.author, A.score, A.type, A.image_path, B.name 'shop_name' " +
                "from goods_info A, user_info B where A.belong = b.id;";
        try {
            PreparedStatement pStatement = conn.prepareStatement(sql);
            ResultSet resultSet = pStatement.executeQuery();
            GoodsInfo entity = null;
            while (resultSet.next()) {
                entity = new GoodsInfo();
                // 共计9个字段
                entity.setId(resultSet.getInt("id"));
                entity.setName(resultSet.getString("name"));
                entity.setDescription(resultSet.getString("description"));
                entity.setPrice(resultSet.getDouble("price"));
                entity.setAuthor(resultSet.getString("author"));
                entity.setScore(resultSet.getDouble("score"));
                entity.setType(resultSet.getString("type"));
                entity.setImage_path(resultSet.getString("image_path"));
                entity.setShop_name(resultSet.getString("shop_name"));

                list.add(entity);
            }
            // System.out.println(list.size());
            resultSet.close();
            pStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
//        for (Iterator<GoodsInfo> it = list.iterator(); it.hasNext();) {
//            System.out.println(it.next().getPassword());
//            System.out.println(it.next().getEmail());
//            System.out.println(it.next().getAddress());
//        }
        return list;
    }

    // 分页查询
    public static List<GoodsInfo> selectByPage(int begin, int size, String goodsname, String type) {
        List<GoodsInfo> list = new ArrayList<>();
        Connection conn = MysqlUtils.getConnection();
        // select * from user_info;
        String sql = "select A.id, A.name, A.description, A.price, A.author, A.score, A.type, A.image_path, B.name 'shop_name' " +
                "from goods_info A, user_info B where A.belong = B.id and "+
                "A.name like ? and A.type like ? limit ? , ?;" ;
        try {
            PreparedStatement pStatement = conn.prepareStatement(sql);
            pStatement.setString(1, goodsname);
            pStatement.setString(2, type);
            pStatement.setInt(3, begin);
            pStatement.setInt(4, size);

            ResultSet resultSet = pStatement.executeQuery();
            GoodsInfo entity = null;
            while (resultSet.next()) {
                entity = new GoodsInfo();
                entity.setId(resultSet.getInt("id"));
                entity.setName(resultSet.getString("name"));
                entity.setDescription(resultSet.getString("description"));
                entity.setPrice(resultSet.getDouble("price"));
                entity.setAuthor(resultSet.getString("author"));
                entity.setScore(resultSet.getDouble("score"));
                entity.setType(resultSet.getString("type"));
                entity.setImage_path(resultSet.getString("image_path"));
                entity.setShop_name(resultSet.getString("shop_name"));
                list.add(entity);
            }
            // System.out.println(list.size());
            resultSet.close();
            pStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
//        for (Iterator<GoodsInfo> it = list.iterator(); it.hasNext();) {
//            System.out.println(it.next().getName());
//
//        }
        return list;
    }

    // 查询总记录数（即：总共查出了多少个？）
    public static int selectTotalCount(String goodsname, String type) {
        String sql = "select count(*) total from goods_info where name like ? and type like ?;";
        Connection conn = MysqlUtils.getConnection();
        int num = 0;
        try {
            PreparedStatement pStatement = conn.prepareStatement(sql);
            pStatement.setString(1, goodsname);
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

    // 加入购物车
    public static void addCart(int user_id, int goods_id, int num) {
        String sql = "INSERT INTO cart_info (user_id, goods_id, num, state) VALUES (?, ?, ?, ?);";
        Connection conn = MysqlUtils.getConnection();
        try {
            PreparedStatement pStatement = conn.prepareStatement(sql);
            pStatement.setInt(1, user_id);
            pStatement.setInt(2, goods_id);
            pStatement.setInt(3, num);
            pStatement.setString(4, "未结算");
            int count = pStatement.executeUpdate();   // 执行完DML语句后，受影响的行数，>0表示修改成功，否则失败
            pStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // 查询购物车并显示
    public static List<Order> orderInfoList(int user_id) {
        List<Order> list = new ArrayList<>();
        Connection conn = MysqlUtils.getConnection();
        String sql = "select user_info.id user_id, goods_info.id goods_id, user_info.name user_name, "
        + "goods_info.name goods_name, goods_info.price, cart_info.num, goods_info.price*cart_info.num total_price, cart_info.state "
        + "from cart_info, user_info, goods_info where "
        + "cart_info.user_id = user_info.id "
        + "and cart_info.goods_id = goods_info.id "
        + "and user_info.id = ?;" ;
        try {
            PreparedStatement pStatement = conn.prepareStatement(sql);
            pStatement.setInt(1, user_id);
            ResultSet resultSet = pStatement.executeQuery();
            Order entity = null;
            while (resultSet.next()) {
                entity = new Order();
                entity.setUser_id(resultSet.getInt("user_id"));
                entity.setGoods_id(resultSet.getInt("goods_id"));
                entity.setUser_name(resultSet.getString("user_name"));
                entity.setGoods_name(resultSet.getString("goods_name"));
                entity.setPrice(resultSet.getDouble("price"));
                entity.setNum(resultSet.getInt("num"));
                entity.setTotal_price(resultSet.getDouble("total_price"));
                entity.setState(resultSet.getString("state"));
                list.add(entity);
            }
            // System.out.println(list.size());
            resultSet.close();
            pStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    // 计算未结算的总金额
    public static double calculateUnpay(int user_id) {
        String sql = "select sum(price*num) unpay from cart_info, user_info, goods_info where "
        + "cart_info.user_id = user_info.id "
        + "and cart_info.goods_id = goods_info.id "
        + "and cart_info.state = '未结算' "
        + "and user_info.id = ?;";
        Connection conn = MysqlUtils.getConnection();
        double num = 0;
        try {
            PreparedStatement pStatement = conn.prepareStatement(sql);
            pStatement.setInt(1, user_id);
            ResultSet resultSet = pStatement.executeQuery();
            while (resultSet.next()) {
                num = resultSet.getDouble("unpay");
            }
            resultSet.close();
            pStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return num;
    }

    // 从购物车中删除订单
    public static void orderInfoDelete(int user_id, int goods_id) {
        String sql = "delete from cart_info where user_id = ? and goods_id = ?;";
        Connection conn = MysqlUtils.getConnection();
        try {
            PreparedStatement pStatement = conn.prepareStatement(sql);
            pStatement.setInt(1, user_id);
            pStatement.setInt(2, goods_id);
            pStatement.executeUpdate();
            pStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // 结算订单
    public static void orderSettlement(int user_id) {
        String sql = "update cart_info set state='已结算' where " +
                "state='未结算' and user_id=?;";
        Connection conn = MysqlUtils.getConnection();
        try {
            PreparedStatement pStatement = conn.prepareStatement(sql);
            pStatement.setInt(1, user_id);
            pStatement.executeUpdate();
            pStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // 商户的分页查询
    public static List<GoodsInfo> selectByPage_shop(int begin, int size, String goodsname, String type, int shop_id) {
        List<GoodsInfo> list = new ArrayList<>();
        Connection conn = MysqlUtils.getConnection();
        // select * from user_info;
        String sql = "select A.id, A.name, A.description, A.price, A.author, A.score, A.type, A.image_path, B.name 'shop_name' " +
                "from goods_info A, user_info B where A.belong = B.id and "+
                "B.id = ? and A.name like ? and A.type like ? limit ? , ?;" ;
        try {
            PreparedStatement pStatement = conn.prepareStatement(sql);
            pStatement.setInt(1, shop_id);
            pStatement.setString(2, goodsname);
            pStatement.setString(3, type);
            pStatement.setInt(4, begin);
            pStatement.setInt(5, size);

            ResultSet resultSet = pStatement.executeQuery();
            GoodsInfo entity = null;
            while (resultSet.next()) {
                entity = new GoodsInfo();
                entity.setId(resultSet.getInt("id"));
                entity.setName(resultSet.getString("name"));
                entity.setDescription(resultSet.getString("description"));
                entity.setPrice(resultSet.getDouble("price"));
                entity.setAuthor(resultSet.getString("author"));
                entity.setScore(resultSet.getDouble("score"));
                entity.setType(resultSet.getString("type"));
                entity.setImage_path(resultSet.getString("image_path"));
                entity.setShop_name(resultSet.getString("shop_name"));
                list.add(entity);
            }
            resultSet.close();
            pStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // 商户的查询总记录数（即：总共查出了多少个？）
    public static int selectTotalCount_shop(String goodsname, String type, int shop_id) {
        String sql = "select count(*) total from goods_info where name like ? and type like ? and belong = ?;";
        Connection conn = MysqlUtils.getConnection();
        int num = 0;
        try {
            PreparedStatement pStatement = conn.prepareStatement(sql);
            pStatement.setString(1, goodsname);
            pStatement.setString(2, type);
            pStatement.setInt(3, shop_id);
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

    // 商户的——添加商品
    public static void goodsInfoSave(GoodsInfo goodsInfo, int shop_id) {
        String sql = "INSERT INTO goods_info (name, description, price, author, score, type, belong, image_path) "
        + "VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
        Connection conn = MysqlUtils.getConnection();
        try {
            PreparedStatement pStatement = conn.prepareStatement(sql);
            pStatement.setString(1, goodsInfo.getName());
            pStatement.setString(2, goodsInfo.getDescription());
            pStatement.setDouble(3, goodsInfo.getPrice());
            pStatement.setString(4, goodsInfo.getAuthor());
            pStatement.setDouble(5, goodsInfo.getScore());
            pStatement.setString(6, goodsInfo.getType());
            pStatement.setInt(7, shop_id);
            pStatement.setString(8, goodsInfo.getImage_path());
            int count = pStatement.executeUpdate();   // 执行完DML语句后，受影响的行数，>0表示修改成功，否则失败
            pStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // 商户的——删除商品
    public static void goodsInfoDelete(int shop_id, int goods_id) {
        String sql = "delete from goods_info where id = ? and belong = ?;";
        Connection conn = MysqlUtils.getConnection();
        try {
            PreparedStatement pStatement = conn.prepareStatement(sql);
            pStatement.setInt(1, goods_id);
            pStatement.setInt(2, shop_id);
            pStatement.executeUpdate();
            pStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // 商户的——根据id查找商品
    public static GoodsInfo getGoodsInfoById(int goods_id) {
        String sql = "select A.id, A.name, A.description, A.price, A.author, A.score, A.type, A.image_path, B.name shop_name from goods_info A, user_info B " +
                "where A.belong = B.id and A.id = ?;";
        Connection conn = MysqlUtils.getConnection();
        GoodsInfo entity = null;
        try {
            PreparedStatement pStatement = conn.prepareStatement(sql);
            pStatement.setInt(1, goods_id);
            ResultSet resultSet = pStatement.executeQuery();
            while (resultSet.next()) {
                entity = new GoodsInfo();
                entity.setId(resultSet.getInt("id"));
                entity.setName(resultSet.getString("name"));
                entity.setDescription(resultSet.getString("description"));
                entity.setPrice(resultSet.getDouble("price"));
                entity.setAuthor(resultSet.getString("author"));
                entity.setScore(resultSet.getDouble("score"));
                entity.setType(resultSet.getString("type"));
                entity.setShop_name(resultSet.getString("shop_name"));
                entity.setImage_path(resultSet.getString("image_path"));
            }
            resultSet.close();
            pStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return entity;
    }

    // 商户的——修改商品信息
    public static void goodsInfoUpdate(GoodsInfo goodsInfo) {
        String sql = "UPDATE goods_info SET name=?, description=?, price=?, author=?, score=?, type=?, image_path=? WHERE (id=?);";
        Connection conn = MysqlUtils.getConnection();
        try {
            PreparedStatement pStatement = conn.prepareStatement(sql);
            pStatement.setString(1, goodsInfo.getName());
            pStatement.setString(2, goodsInfo.getDescription());
            pStatement.setDouble(3, goodsInfo.getPrice());
            pStatement.setString(4, goodsInfo.getAuthor());
            pStatement.setDouble(5, goodsInfo.getScore());
            pStatement.setString(6, goodsInfo.getType());
            pStatement.setString(7, goodsInfo.getImage_path());
            pStatement.setInt(8, goodsInfo.getId());
            pStatement.executeUpdate();
            pStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // 查询用户购买日志记录并显示
    public static List<Order> goodsLogInfo(int shop_id) {
        List<Order> list = new ArrayList<>();
        Connection conn = MysqlUtils.getConnection();
        String sql = "select user_info.id user_id, goods_info.id goods_id, user_info.name user_name, "
                + "goods_info.name goods_name, goods_info.price, cart_info.num, goods_info.price*cart_info.num total_price, cart_info.state "
                + "from cart_info, user_info, goods_info where "
                + "cart_info.user_id = user_info.id "
                + "and cart_info.goods_id = goods_info.id "
                + "and goods_info.belong = ?;" ;
        try {
            PreparedStatement pStatement = conn.prepareStatement(sql);
            pStatement.setInt(1, shop_id);
            ResultSet resultSet = pStatement.executeQuery();
            Order entity = null;
            while (resultSet.next()) {
                entity = new Order();
                entity.setUser_id(resultSet.getInt("user_id"));
                entity.setGoods_id(resultSet.getInt("goods_id"));
                entity.setUser_name(resultSet.getString("user_name"));
                entity.setGoods_name(resultSet.getString("goods_name"));
                entity.setPrice(resultSet.getDouble("price"));
                entity.setNum(resultSet.getInt("num"));
                entity.setTotal_price(resultSet.getDouble("total_price"));
                entity.setState(resultSet.getString("state"));
                list.add(entity);
            }
            // System.out.println(list.size());
            resultSet.close();
            pStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

}
