package com.mori.service;

import java.util.List;

import com.mori.dao.UserInfoDao;
import com.mori.entity.Find;
import com.mori.entity.QueryInfo;
import com.mori.entity.UserInfo;


public interface UserInfoService {

    /**
     * 查询所有用户
     *
     * @return
     */
    List<UserInfo> userInfoList();

    /**
     * 新增用户
     *
     * @param entity
     */
    void saveUserInfo(UserInfo entity);

    /**
     * 根据Id查询用户
     *
     * @param id
     */
    UserInfo getUserInfoById(int id);

    /**
     * 根据用户名username查询用户
     *
     * @param username
     */
    UserInfo getUserInfoByName(String username);

    /**
     * 根据Id更新用户
     *
     * @param entity
     */
    void updateUserInfoById(UserInfo entity);

    /**
     * 根据Id删除用户
     *
     * @param id
     */
    void deleteUserInfoById(int id);

    /**
     * 分页查询、条件查询
     *
     * @param  queryinfo
     */
    Find selectByPage(QueryInfo queryinfo);



}