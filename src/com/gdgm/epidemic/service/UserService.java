package com.gdgm.epidemic.service;

import com.gdgm.epidemic.beans.UserInfo;

public interface UserService {

    /**
     * 根据用户账号获取用户信息
     * @param account 账号
     * @return 用户信息
     */
    UserInfo findUserByAccount(String account);

}
