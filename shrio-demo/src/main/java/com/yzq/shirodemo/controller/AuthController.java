package com.yzq.shirodemo.controller;

import com.yzq.shirodemo.config.shiro.token.JwtUser;
import com.yzq.shirodemo.constant.SecurityConstants;
import com.yzq.shirodemo.dto.UserDTO;
import com.yzq.shirodemo.dto.UserLoginDTO;
import com.yzq.shirodemo.service.AuthService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


/**
 * AuthController
 *
 * @author star
 */
@RestController
@RequestMapping("/api/auth")
public class AuthController {

    @Autowired
    private AuthService authService;

    @PostMapping("/login")
    public ResponseEntity<UserDTO> login(@RequestBody UserLoginDTO userLogin) throws Exception {
        // 用户登录认证
        JwtUser jwtUser = authService.authLogin(userLogin);
        // 认证成功后，将 token 存入响应头中返回
        HttpHeaders httpHeaders = new HttpHeaders();

        // 添加 token 前缀 "Bearer "
        httpHeaders.set(SecurityConstants.TOKEN_HEADER, SecurityConstants.TOKEN_PREFIX + jwtUser.getToken());
        Subject su = SecurityUtils.getSubject();
        System.out.println("当前用户角色：admin:"+su.hasRole("admin"));
        return new ResponseEntity<>(jwtUser.getUser(), httpHeaders, HttpStatus.OK);

    }

    @PostMapping("/logout")
    public ResponseEntity<Void> logout() {
        authService.logout();
        return ResponseEntity.ok().build();
    }
}
