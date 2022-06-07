package spring.security.jwt.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import spring.security.jwt.dto.UserDTO;
import spring.security.jwt.dto.UserRegisterDTO;
import spring.security.jwt.entity.SysUser;
import spring.security.jwt.service.UserService;

import javax.validation.Valid;

/**
 * UserResource
 *
 * @author star
 */
@RestController
@RequestMapping("/api/user")
public class UserResource {

    @Autowired
    private UserService userService;

    @GetMapping("/{username}")
    public ResponseEntity<UserDTO> getUser(@PathVariable String username) {
        UserDTO userDTO = userService.getUserInfoByName(username);
        return ResponseEntity.ok(userDTO);
    }

    @PostMapping("/reg")
    public ResponseEntity<SysUser> register(@RequestBody @Valid UserRegisterDTO userRegister) {

        return ResponseEntity.ok( userService.register(userRegister));
    }

    @DeleteMapping("/{username}")
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public ResponseEntity<Void> deleteByUserName(@PathVariable("username") String userName) {
        userService.delete(userName);
        return ResponseEntity.ok().build();
    }

}
