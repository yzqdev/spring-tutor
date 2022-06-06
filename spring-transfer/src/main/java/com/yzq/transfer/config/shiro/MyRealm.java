package com.yzq.transfer.config.shiro;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.yzq.transfer.model.entity.SysUser;
import com.yzq.transfer.service.IUserService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

import javax.annotation.Resource;

public class MyRealm extends AuthorizingRealm {
    @Resource
    private IUserService userService;

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        return null;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        String username = (String) token.getPrincipal();

        SysUser u = userService.getOne(new LambdaQueryWrapper<SysUser>().eq(SysUser::getUsername, username));
        return new SimpleAuthenticationInfo(u, u.getPassword(), getName());
    }
}