 package com.yzq.springauth.service.impl;


import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yzq.springauth.mapper.UserMapper;
import com.yzq.springauth.model.entity.User;
import com.yzq.springauth.service.IUserService;
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
