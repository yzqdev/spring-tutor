package com.yzq.service.impl;

import com.yzq.entity.User;
import com.yzq.mapper.UserMapper;
import com.yzq.service.IUserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author y
 * @since 2022-05-17
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements IUserService {

}
