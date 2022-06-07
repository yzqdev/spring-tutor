package com.yzq.shirodemo.service;

import com.yzq.shirodemo.dto.UserRegisterDTO;
import com.yzq.shirodemo.entity.SysUser;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

/**
 * UserConverter
 *
 * @author star
 */
@Service
public class UserConverter {

    public SysUser convertOfUserRegisterDTO(UserRegisterDTO dto) {
        SysUser sysUser = new SysUser();
        BeanUtils.copyProperties(dto, sysUser);

        return sysUser;
    }
}
