package com.mori.service_impl;

import java.util.List;

import com.mori.dao.UserInfoDao;
import com.mori.entity.Find;
import com.mori.entity.QueryInfo;
import com.mori.entity.UserInfo;
import com.mori.service.UserInfoService;

import javax.sound.midi.SysexMessage;


/**
 * 用户接口实现类
 *
 * @author Mori
 *
 */
public class UserInfoServiceImpl implements UserInfoService {

    @Override
    public List<UserInfo> userInfoList() {
        return UserInfoDao.userInfoList();
    }

    @Override
    public void saveUserInfo(UserInfo entity) {
        UserInfoDao.saveUserInfo(entity);
    }

    @Override
    public UserInfo getUserInfoById(int id) {
        return UserInfoDao.getUserInfoById(id);
    }

    @Override
    public UserInfo getUserInfoByName(String username) {
        return UserInfoDao.getUserInfoByName(username);
    }

    @Override
    public void updateUserInfoById(UserInfo entity) {
        UserInfoDao.updateUserInfoById(entity);
    }

    @Override
    public void deleteUserInfoById(int id) {
        UserInfoDao.deleteUserInfoById(id);
    }

    @Override
    public Find selectByPage(QueryInfo queryinfo) {
        int currentPage = queryinfo.getCurrentPage();
        int pageSize = queryinfo.getPageSize();
        String username = queryinfo.getUsername();
        String type = queryinfo.getType();
        // 分页查询和条件查询的进一步处理
        int begin = (currentPage - 1) * pageSize;
        int size = pageSize;
        // 给username两端加上匹配符
        if (username.equals("0")) {
            username = "%";
        }
        else
        {
            //System.out.println(username);
            username = "%" + username + "%";
        }
        if (type.equals("0")) {
            type = "%";
        }

//        System.out.println("implement中");
//        System.out.println(currentPage);
//        System.out.println(pageSize);
//        System.out.println(username);
//        System.out.println(type);

        List<UserInfo> rows = UserInfoDao.selectByPage(begin, size, username, type);
        int totalCount = UserInfoDao.selectTotalCount(username, type);
        Find find = new Find();
        find.setTotalCount(totalCount);
        find.setRows(rows);
        return find;

    }

//    @Override
//    public int selectTotalCount()  { return UserInfoDao.selectTotalCount(); }

}
