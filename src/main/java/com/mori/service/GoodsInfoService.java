package com.mori.service;


import com.mori.entity.*;

import java.util.List;


public interface GoodsInfoService {

    /**
     * 分页查询、条件查询
     *
     * @param  queryinfo
     */
    Find selectByPage(QueryInfo queryinfo);

    /**
     * 加入购物车
     *
     * @param  user_id, goods_id, num
     */
    void addCart(int user_id, int goods_id, int num);

    /**
     * 展示购物车
     *
     * @param  user_id
     */
    List<Order> orderInfoList(int user_id);

    /**
     * 计算未结算的总金额
     *
     * @param  user_id
     */
    double calculateUnpay(int user_id);

    /**
     * 从购物车删除订单
     *
     * @param  user_id, goods_id
     */
    void orderInfoDelete(int user_id, int goods_id);

    /**
     * 结算订单
     *
     * @param  user_id, goods_id
     */
    void orderSettlement(int user_id);

    /**
     * 商户的——分页查询、条件查询
     *
     * @param  queryinfo
     */
    Find selectByPage_shop(QueryInfo queryinfo, int shop_id);

    /**
     * 商户的——添加商品
     *
     * @param  goodsInfo shop_id
     */
    void goodsInfoSave(GoodsInfo goodsInfo, int shop_id);

    /**
     * 商户的——删除商品
     *
     * @param  goods_id shop_id
     */
    void goodsInfoDelete(int shop_id, int goods_id);

    /**
     * 根据Id查询商品
     *
     * @param goods_id
     */
    GoodsInfo getGoodsInfoById(int goods_id);

    /**
     * 更新商品
     *
     * @param goodsInfo
     */
    void goodsInfoUpdate(GoodsInfo goodsInfo);

    /**
     * 展示用户购买日志
     *
     * @param  shop_id
     */
    List<Order> goodsLogInfo(int shop_id);







}