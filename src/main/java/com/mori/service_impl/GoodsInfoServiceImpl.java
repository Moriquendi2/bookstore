package com.mori.service_impl;

import com.mori.dao.GoodsInfoDao;
import com.mori.entity.Find;
import com.mori.entity.GoodsInfo;
import com.mori.entity.Order;
import com.mori.entity.QueryInfo;
import com.mori.service.GoodsInfoService;


import java.util.List;


/**
 * 用户接口实现类
 *
 * @author Mori
 *
 */
public class GoodsInfoServiceImpl implements GoodsInfoService {

//    @Override
//    public List<GoodsInfo> goodsInfoList() {
//        return GoodsInfoDao.goodsInfoList();
//    }

    @Override
    public Find selectByPage(QueryInfo queryinfo) {
        int currentPage = queryinfo.getCurrentPage();
        int pageSize = queryinfo.getPageSize();
        String goodsname = queryinfo.getUsername();
        String type = queryinfo.getType();
        // 分页查询和条件查询的进一步处理
        int begin = (currentPage - 1) * pageSize;
        int size = pageSize;
        // 给goodsname两端加上匹配符
        if (goodsname.equals("0")) {
            goodsname = "%";
        }
        else
        {
            //System.out.println(username);
            goodsname = "%" + goodsname + "%";
        }
        if (type.equals("0")) {
            type = "%";
        }

//        System.out.println("implement中");
//        System.out.println(currentPage);
//        System.out.println(pageSize);
//        System.out.println(username);
//        System.out.println(type);

        List<GoodsInfo> rows = GoodsInfoDao.selectByPage(begin, size, goodsname, type);
        int totalCount = GoodsInfoDao.selectTotalCount(goodsname, type);
        Find find = new Find();
        find.setTotalCount(totalCount);
        find.setRows(rows);
        return find;

    }

    @Override
    public void addCart(int user_id, int goods_id, int num) {
        GoodsInfoDao.addCart(user_id, goods_id, num);
    }

    @Override
    public List<Order> orderInfoList(int user_id) {
        return GoodsInfoDao.orderInfoList(user_id);
    }

    @Override
    public double calculateUnpay(int user_id) {
        return GoodsInfoDao.calculateUnpay(user_id);
    }

    @Override
    public void orderInfoDelete(int user_id, int goods_id) {
        GoodsInfoDao.orderInfoDelete(user_id, goods_id);
    }

    @Override
    public void orderSettlement(int user_id) {
        GoodsInfoDao.orderSettlement(user_id);
    }

    @Override
    public Find selectByPage_shop(QueryInfo queryinfo, int shop_id) {
        int currentPage = queryinfo.getCurrentPage();
        int pageSize = queryinfo.getPageSize();
        String goodsname = queryinfo.getUsername();
        String type = queryinfo.getType();
        // 分页查询和条件查询的进一步处理
        int begin = (currentPage - 1) * pageSize;
        int size = pageSize;
        // 给goodsname两端加上匹配符
        if (goodsname.equals("0")) {
            goodsname = "%";
        }
        else
        {
            //System.out.println(username);
            goodsname = "%" + goodsname + "%";
        }
        if (type.equals("0")) {
            type = "%";
        }

        List<GoodsInfo> rows = GoodsInfoDao.selectByPage_shop(begin, size, goodsname, type, shop_id);
        int totalCount = GoodsInfoDao.selectTotalCount_shop(goodsname, type, shop_id);
        Find find = new Find();
        find.setTotalCount(totalCount);
        find.setRows(rows);
        return find;

    }

    @Override
    public void goodsInfoSave(GoodsInfo goodsInfo, int shop_id) {
        GoodsInfoDao.goodsInfoSave(goodsInfo, shop_id);
    }

    @Override
    public void goodsInfoDelete(int shop_id, int goods_id) {
        GoodsInfoDao.goodsInfoDelete(shop_id, goods_id);
    }

    @Override
    public GoodsInfo getGoodsInfoById(int goods_id) {
        return GoodsInfoDao.getGoodsInfoById(goods_id);
    }

    @Override
    public void goodsInfoUpdate(GoodsInfo goodsInfo) {
        GoodsInfoDao.goodsInfoUpdate(goodsInfo);
    }

    @Override
    public List<Order> goodsLogInfo(int shop_id) {
        return GoodsInfoDao.goodsLogInfo(shop_id);
    }






}
