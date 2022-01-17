package com.example.springtransfer.controller;

import com.example.springtransfer.utils.RedisUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.HashMap;

/**
 * @author yanni
 * @date time 2021/11/27 17:05
 * @modified By:
 */
@RestController
@Slf4j
public class RedisController {
    @Resource
    private RedisUtils redisUtils;

    @PostMapping("/putRedis")
    public HashMap putRedis(String key,String value) {
        HashMap<String, Object> res = new HashMap<>();
       boolean result = redisUtils.set(key,value);
        res.put("res", result);
        return res;
    }

    @GetMapping("/getRedis")
    public HashMap getRedis(@RequestParam("key") String key) {
        HashMap<String, Object> res = new HashMap<>();
        log.info(String.valueOf(redisUtils.get(key)));
        String result = String.valueOf(redisUtils.get(key));
        res.put("res", result);
        return res;
    }
}
