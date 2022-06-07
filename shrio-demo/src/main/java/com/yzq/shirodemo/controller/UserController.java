package com.yzq.shirodemo.controller;

import com.yzq.shirodemo.dto.UserDTO;
import com.yzq.shirodemo.dto.UserRegisterDTO;
import com.yzq.shirodemo.entity.SysUser;
import com.yzq.shirodemo.service.UserRoleService;
import com.yzq.shirodemo.service.UserService;
import lombok.RequiredArgsConstructor;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;


import javax.annotation.Resource;
import javax.validation.Valid;

/**
 * UserController
 *
 * @author star
 */
@RestController
@RequestMapping("/api/user")

public class UserController {

@Resource
    private   UserService userService;


    @GetMapping("/{username}")
    public ResponseEntity<UserDTO> getUser(@PathVariable String username) throws Exception {
        UserDTO userDTO = userService.getUserInfoByName(username);
        return ResponseEntity.ok(userDTO);
    }

    @PostMapping("/reg")
    public ResponseEntity<SysUser> register(@RequestBody @Valid UserRegisterDTO userRegister) throws Exception {
        SysUser regUser=userService.register(userRegister);

        return ResponseEntity.ok( regUser);
    }

    @DeleteMapping("/{username}")
    @RequiresPermissions("roles[admin]")
    public ResponseEntity<Void> deleteByUserName(@PathVariable("username") String userName) {
        userService.delete(userName);
        return ResponseEntity.ok().build();
    }

}
