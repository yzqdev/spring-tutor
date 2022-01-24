package com.yzq.transfer.controller;

import com.yzq.transfer.model.entity.User;
import com.yzq.transfer.model.entity.UserDelDto;
import com.yzq.transfer.utils.RequestHelper;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;

/**
 * @author yanni
 * @date time 2021/11/17 22:02
 * @modified By:
 */
@RestController
@RequestMapping
public class UserController {
    @GetMapping("user")
    public User getUser() {
        return null;
    }

    @PostMapping("/addUser")
    public User addUser(User user) {
        return user;
    }

    @PostMapping("/addUserBody")
    public User addUserBody(@RequestBody User user) {
        return user;
    }
    @PostMapping("/addUserParam")
    public User addUserParam(@RequestParam User user) {
        return user;
    }

    @PostMapping("/addUserstr")
    public User addUserString(String username,String password) {
        User user =  User.builder().username(username).password(password).build();
        return user;
    }
    @DeleteMapping("/deleteUsers")
    public HashMap<String, Object> deleteUsers(@RequestBody UserDelDto userDelDto) {
        HashMap<String, Object> res = new HashMap<>();
        res.put("obj", userDelDto);

        return res;
    }

    @DeleteMapping("/deleteUsers1")
    public HashMap<String, Object> deleteUsers1(@RequestBody String[] ids) {
        HashMap<String, Object> res = new HashMap<>();
        res.put("obj", ids);

        return res;
    }

    @GetMapping("/users")
    public HashMap<String, Object> getUsers() {
        HashMap<String, Object> res = new HashMap<>();
        String token = RequestHelper.getRequestHeader("token");
        String auth = RequestHelper.getRequestHeader("Authorization");
        res.put("token", token);
        res.put("auth", auth);
        return res;
    }

}
