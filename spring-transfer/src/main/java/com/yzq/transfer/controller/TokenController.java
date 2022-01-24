package com.yzq.transfer.controller;

import com.yzq.transfer.utils.RequestHelper;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
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
    @PostMapping("/token/{id}")
    public HashMap<String,String> token(@PathVariable("id") String id){
        HashMap<String,String> res=new HashMap<>();
        res.put("hhh", id);
        return res;
    }
}
