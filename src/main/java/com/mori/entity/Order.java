package com.mori.entity;

/**
 * 商品订单实体类
 *
 * @author Mori
 *
 */
public class Order {
    private int user_id;
    private int goods_id;
    private int num;   // 商品数量
    private String state; // 订单状态——已结算/未结算

    // 以下是要通过数据库查表得到的
    private String user_name;   // 由user_id得来
    private String goods_name;  // 由goods_id得来
    private double price;   // 单价
    private double total_price; // 总价


    @Override
    public String toString() {
        return "Order{" +
                "user_id=" + user_id +
                ", goods_id=" + goods_id +
                ", num=" + num +
                ", state='" + state + '\'' +
                ", user_name='" + user_name + '\'' +
                ", goods_name='" + goods_name + '\'' +
                ", price=" + price +
                ", total_price=" + total_price +
                '}';
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getGoods_name() {
        return goods_name;
    }

    public void setGoods_name(String goods_name) {
        this.goods_name = goods_name;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getTotal_price() {
        return total_price;
    }

    public void setTotal_price(double total_price) {
        this.total_price = total_price;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getGoods_id() {
        return goods_id;
    }

    public void setGoods_id(int goods_id) {
        this.goods_id = goods_id;
    }
}
