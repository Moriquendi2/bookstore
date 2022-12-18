package com.mori.entity;

import java.util.List;

import com.mori.entity.UserInfo;

public class Find<T> {
    // 用于分页查询
    private int totalCount;   // 总记录数
    // 虚拟泛型，list可以是用户、商品、订单
    private List<T> rows;   // 当前页数据

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public List<T> getRows() {
        return rows;
    }

    public void setRows(List<T> rows) {
        this.rows = rows;
    }
}


