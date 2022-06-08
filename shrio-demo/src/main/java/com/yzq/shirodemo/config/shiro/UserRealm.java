package com.yzq.shirodemo.config.shiro;

import com.yzq.shirodemo.constant.SecurityConstants;
import com.yzq.shirodemo.constant.UserRoleConstants;
import com.yzq.shirodemo.entity.SysUser;
import com.yzq.shirodemo.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;

/**
 * @author Hellohao
 * @version 1.0
 * @date  2021/6/3 10:39
 * 自定义UserRealm

 */
public class UserRealm extends AuthorizingRealm {

    @Autowired
    private UserService userService;

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        Subject subject = SecurityUtils.getSubject();
        SysUser sysUser = (SysUser) subject.getPrincipal();
        ArrayList<String> roleList = new ArrayList();

            roleList.add(UserRoleConstants.ROLE_ADMIN);

        info.addRoles(roleList);
        return info;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken tokenOBJ) throws AuthenticationException {
        UsernamePasswordToken userToken  ;
        userToken = (UsernamePasswordToken)tokenOBJ;
        SysUser sysUser = new SysUser();
        sysUser.setUsername(userToken.getUsername());
        SysUser u = userService.getUserByName(sysUser.getUsername());
        if(u==null){
            return null;
        }
        //密码认证（防止泄露，不需要我们做）
        return new SimpleAuthenticationInfo(u,u.getPassword(),"");
    }
}
