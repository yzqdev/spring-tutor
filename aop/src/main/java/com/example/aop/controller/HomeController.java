package com.example.aop.controller;


import com.example.aop.annotation.AuthMethod;
import com.example.aop.constant.GlobalConst;
import com.example.aop.core.CommonResp;
import com.example.aop.core.Passport;
import com.example.aop.service.DemoService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.HashMap;


/**
 * @author yanni
 */
@RestController
@RequestMapping("/")
public class HomeController {
    @Resource
    private DemoService demoService;

    @GetMapping("/test")
    public CommonResp test(@RequestParam("name") String name) {
        Passport passport = new Passport();
        passport.setUserId(GlobalConst.DEFAULT_USER_ID);
        passport.setToken(GlobalConst.DEFAULT_TOKEN);
        return demoService.action0(passport, "666");
    }


    @GetMapping("/test1")
    public CommonResp test1() {
        Passport passport = new Passport();
        passport.setUserId(101);
        passport.setToken("aaaaaa");
        return demoService.action0(passport, "777");
    }


    @GetMapping("/test3")
    public CommonResp test3() {
        Passport passport = new Passport();
        passport.setUserId(222);
        passport.setToken(String.valueOf(33));
        return CommonResp.success("hhh");
    }

    @GetMapping("/get")
    public HashMap<String,Object> getThings(@RequestParam("name") String name) {
        HashMap<String,Object> res=new HashMap<>(2);
        res.put("name",name);
        res.put("key","key");
        return   res;
    }
    @PostMapping("/post/{name}")
    public HashMap<String,Object> postThings(@PathVariable String name){
        HashMap<String,Object> res=new HashMap<>();
        res.put("name",name);
        return  res;
    }
}
