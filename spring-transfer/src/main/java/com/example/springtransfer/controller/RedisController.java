package com.example.springtransfer.controller;

import com.example.springtransfer.dto.KeyValue;
import com.example.springtransfer.utils.RedisUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.HashMap;

/**
 * @author yanni
 * @date time 2021/11/27 17:05
 * @modified By:
 */
@RestController
public class RedisController {
    @Resource
    private RedisUtils redisUtils;

    @PostMapping("/putRedis")
    public HashMap putRedis(String key,String value) {
        HashMap<String, Object> res = new HashMap<>();
        long result = redisUtils.sSet(key,value);
        res.put("res", result);
        return res;
    }

    @GetMapping("/getRedis")
    public HashMap getRedis(String key) {
        HashMap<String, Object> res = new HashMap<>();
        String result = String.valueOf(redisUtils.sGet(key));
        res.put("res", result);
        return res;
    }
}
