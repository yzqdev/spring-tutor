package com.yzq.transfer.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yzq.transfer.mapper.UserMapper;
import com.yzq.transfer.model.entity.User;
import com.yzq.transfer.service.IUserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

/**
 * @author yanni
 * @date time 2022/1/24 15:15
 * @modified By:
 */
@Service
@RequiredArgsConstructor
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements IUserService {
    private final UserMapper userMapper;

    @Override
    public User login(String username, String password) {
        User sqlUser = userMapper.selectOne(new LambdaQueryWrapper<User>().eq(User::getUsername, username));
        if (sqlUser == null) {
            return null;
        } else {
            if (sqlUser.getPassword().equals(password)) {
                return sqlUser;
            } else {
                return null;
            }
        }

    }
}
