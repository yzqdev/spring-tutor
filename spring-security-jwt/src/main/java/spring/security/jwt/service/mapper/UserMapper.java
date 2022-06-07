package spring.security.jwt.service.mapper;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import spring.security.jwt.dto.UserRegisterDTO;
import spring.security.jwt.entity.SysUser;

/**
 * UserMapper
 *
 * @author star
 */
@Service
public class UserMapper {

    public SysUser convertOfUserRegisterDTO(UserRegisterDTO dto) {
        SysUser sysUser = new SysUser();
        BeanUtils.copyProperties(dto, sysUser);

        return sysUser;
    }
}
