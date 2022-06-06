package com.yzq.transfer.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yzq.transfer.mapper.UserMapper;
import com.yzq.transfer.model.entity.SysUser;
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
public class UserServiceImpl extends ServiceImpl<UserMapper, SysUser> implements IUserService {
    private final UserMapper userMapper;

    @Override
    public SysUser login(String username, String password) {
        SysUser sqlSysUser = userMapper.selectOne(new LambdaQueryWrapper<SysUser>().eq(SysUser::getUsername, username));
        if (sqlSysUser == null) {
            return null;
        } else {
            if (sqlSysUser.getPassword().equals(password)) {
                return sqlSysUser;
            } else {
                return null;
            }
        }

    }
}
