package com.yzq.transfer.controller;

import com.yzq.transfer.utils.RedisUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.*;

/**
 * @author yanni
 * @date time 2021/11/27 17:05
 * @modified By:
 */
@RestController
@Slf4j
@RequestMapping("/redis")
public class RedisController {
    @Resource
    private RedisUtils redisUtils;

    @PostMapping("/stringSet")
    public HashMap putRedis(String key,String value) {
        HashMap<String, Object> res = new HashMap<>();
       boolean result = redisUtils.set(key,value);
        res.put("res", result);
        return res;
    }

    @GetMapping("/stringGet")
    public HashMap getRedis(@RequestParam("key") String key) {
        HashMap<String, Object> res = new HashMap<>();
        log.info(String.valueOf(redisUtils.get(key)));
        String result = String.valueOf(redisUtils.get(key));
        res.put("res", result);
        return res;
    }


    @PostMapping("/hashSet")
    public HashMap hashSet(String key,@RequestBody Map value) {
        HashMap<String, Object> res = new HashMap<>();
        boolean result = redisUtils.hmset(key,value);
        res.put("res", result);
        res.put("data", value);
        return res;
    }

    @GetMapping("/hashGet")
    public HashMap hashGet(@RequestParam("key") String key) {
        HashMap<String, Object> res = new HashMap<>();

       Map result =  redisUtils.hmget(key );
        res.put("res", result);

        return res;
    }
    @PostMapping("/listSet")
    public HashMap lSet(String key, @RequestBody String[] value) {
        HashMap<String, Object> res = new HashMap<>();
        boolean result = redisUtils.lSet(key,value);
        res.put("res", result);
        return res;
    }

    @GetMapping("/listGet")
    public HashMap lGet(@RequestParam("key") String key) {
        HashMap<String, Object> res = new HashMap<>();

        List result =  redisUtils.lGet(key ,0,-1);
        res.put("res", result);
        return res;
    }
    @PostMapping("/setSet")
    public HashMap sSet(String key, @RequestBody Object value) {
        HashMap<String, Object> res = new HashMap<>();
       long result = redisUtils.sSetAndTime(key,20,value);
        res.put("res", result);
        return res;
    }

    @GetMapping("/setGet")
    public HashMap sGet(@RequestParam("key") String key) {
        HashMap<String, Object> res = new HashMap<>();

        HashSet result = (HashSet) redisUtils.sGet(key );
        res.put("res", result);
        return res;
    }
}
