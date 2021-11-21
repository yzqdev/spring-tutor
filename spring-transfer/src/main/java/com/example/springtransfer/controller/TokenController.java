package com.example.springtransfer.controller;

import com.example.springtransfer.utils.RequestHelper;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;

/**
 * @author yanni
 * @date time 2021/11/21 14:09
 * @modified By:
 */
@RestController
public class TokenController {
    @GetMapping("/token")
    public HashMap<String, Object> getToken(){
        HashMap<String, Object> res = new HashMap<>();
        String token = RequestHelper.getRequestHeader("token");
        String auth = RequestHelper.getRequestHeader("Authorization");
        res.put("token",token);
        res.put("auth", auth);
        return res;
    }
}
