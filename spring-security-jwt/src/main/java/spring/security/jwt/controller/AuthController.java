package spring.security.jwt.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import spring.security.jwt.constant.SecurityConstants;
import spring.security.jwt.dto.UserDTO;
import spring.security.jwt.dto.UserLoginDTO;
import spring.security.jwt.config.security.JwtUser;
import spring.security.jwt.service.AuthService;

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
    public ResponseEntity<UserDTO> login(@RequestBody UserLoginDTO userLogin) {
        // 用户登录认证
        JwtUser jwtUser = authService.authLogin(userLogin);
        // 认证成功后，将 token 存入响应头中返回
        HttpHeaders httpHeaders = new HttpHeaders();
        // 添加 token 前缀 "Bearer "
        httpHeaders.set(SecurityConstants.TOKEN_HEADER, SecurityConstants.TOKEN_PREFIX + jwtUser.getToken());

        return new ResponseEntity<>(jwtUser.getUser(), httpHeaders, HttpStatus.OK);

    }

    @PostMapping("/logout")
    public ResponseEntity<Void> logout() {
        authService.logout();
        return ResponseEntity.ok().build();
    }
}
