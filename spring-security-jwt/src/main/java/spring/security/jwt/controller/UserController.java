package spring.security.jwt.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import spring.security.jwt.dto.UserDTO;
import spring.security.jwt.dto.UserRegisterDTO;
import spring.security.jwt.entity.SysUser;
import spring.security.jwt.service.UserRoleService;
import spring.security.jwt.service.UserService;

import javax.validation.Valid;

/**
 * UserController
 *
 * @author star
 */
@RestController
@RequestMapping("/api/user")
public class UserController {


    private final UserService userService;
    private  final UserRoleService userRoleService;
    public UserController(UserService userService, UserRoleService userRoleService){
        this.userRoleService=userRoleService;
        this.userService=userService;
    }

    @GetMapping("/{username}")
    public ResponseEntity<UserDTO> getUser(@PathVariable String username) {
        UserDTO userDTO = userService.getUserInfoByName(username);
        return ResponseEntity.ok(userDTO);
    }

    @PostMapping("/reg")
    public ResponseEntity<SysUser> register(@RequestBody @Valid UserRegisterDTO userRegister) {
        SysUser regUser=userService.register(userRegister);

        return ResponseEntity.ok( regUser);
    }

    @DeleteMapping("/{username}")
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public ResponseEntity<Void> deleteByUserName(@PathVariable("username") String userName) {
        userService.delete(userName);
        return ResponseEntity.ok().build();
    }

}
