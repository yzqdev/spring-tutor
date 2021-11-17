package com.example.springtransfer.controller;

import com.example.springtransfer.entity.User;
import com.example.springtransfer.entity.UserDelDto;
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
    public HashMap<String,Object> deleteUsers(@RequestBody UserDelDto userDelDto) {
        HashMap<String,Object> res=new HashMap<>();
        res.put("obj",userDelDto);

        return res;
    }    @DeleteMapping("/deleteUsers1")
    public HashMap<String,Object> deleteUsers1(@RequestBody String[] ids) {
        HashMap<String,Object> res=new HashMap<>();
        res.put("obj",ids);

        return res;
    }

}
