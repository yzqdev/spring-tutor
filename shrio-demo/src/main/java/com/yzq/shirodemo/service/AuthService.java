package com.yzq.shirodemo.service;

import com.yzq.shirodemo.config.shiro.token.JwtUser;
import com.yzq.shirodemo.constant.SecurityConstants;
import com.yzq.shirodemo.constant.UserRoleConstants;
import com.yzq.shirodemo.dto.UserDTO;
import com.yzq.shirodemo.dto.UserLoginDTO;
import com.yzq.shirodemo.entity.SysUser;
import com.yzq.shirodemo.util.JwtUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;


import java.util.Collections;
import java.util.List;
import java.util.Optional;

/**
 * 用户认证服务
 *
 * @author star
 */
@Service
public class AuthService {

    @Autowired
    private UserService userService;



    /**
     * 用户登录认证
     *
     * @param userLogin 用户登录信息
     */
    public JwtUser authLogin(UserLoginDTO userLogin) throws Exception {
        String username = userLogin.getUsername();
        String password = userLogin.getPassword();

        // 根据登录名获取用户信息
        SysUser  userOptional = userService.getUserByName(username);

        SysUser sysUser = userOptional ;
        // 验证登录密码是否正确。如果正确，则赋予用户相应权限并生成用户认证信息
        if (BCrypt.checkpw(password, sysUser.getPassword())) {
            List<String> roles = userService.listUserRoles(username);
            // 如果用户角色为空，则默认赋予 ROLE_USER 角色
            if (CollectionUtils.isEmpty(roles)) {
                roles = Collections.singletonList(UserRoleConstants.ROLE_USER);
            }
            // 生成 token
            String token = JwtUtils.generateToken(username, roles, userLogin.getRememberMe());


            Subject subject = SecurityUtils.getSubject();
            UsernamePasswordToken tokenOBJ = new UsernamePasswordToken(username,BCrypt.hashpw(password, SecurityConstants.SALT));
            tokenOBJ.setRememberMe(true);

            subject.login(tokenOBJ);
            //一小时
            SecurityUtils.getSubject().getSession().setTimeout(3600000);
            // 用户信息
            UserDTO userDTO = new UserDTO();
            userDTO.setUsername(username);
            userDTO.setEmail(sysUser.getEmail());
            userDTO.setRoles(roles);

            return new JwtUser(token, userDTO);
        }
        throw new  Exception("The sysUser name or password error.");
    }

    /**
     * 用户退出登录
     *
     * <p>
     * 清除 Spring Security 上下文中的认证信息
     */
    public void logout() {
        //SecurityContextHolder.clearContext();
    }
}
