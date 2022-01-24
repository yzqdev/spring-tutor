package com.yzq.transfer.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.yzq.transfer.model.entity.User;

/**
 * @author yanni
 * @date time 2022/1/24 15:13
 * @modified By:
 */
public interface IUserService extends IService<User> {
    User login(String username, String password);
}
