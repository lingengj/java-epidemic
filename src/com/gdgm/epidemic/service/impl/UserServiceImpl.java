package com.gdgm.epidemic.service.impl;

import com.gdgm.epidemic.beans.UserInfo;
import com.gdgm.epidemic.mapper.UserMapper;
import com.gdgm.epidemic.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper mapper;

    @Override
    public UserInfo findUserByAccount(String account) {
        return mapper.findUserByAccount(account);
    }
}
