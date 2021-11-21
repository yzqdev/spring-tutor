package com.example.springtransfer.controller;

import com.example.springtransfer.entity.User;
import com.example.springtransfer.entity.UserDelDto;
import com.example.springtransfer.utils.RequestHelper;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

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
        res.put("token",token);
        res.put("auth", auth);
        return res;
    }

}
