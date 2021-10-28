package com.example.aop.controller;

import com.example.aop.annotation.AuthMethod;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author yanni
 * @date time 2021/10/28 6:13
 * @modified By:
 */
@RestController
@RequestMapping("/hello")
public class AnnoController {
    @AuthMethod
    @GetMapping("")
    public String hello(){
        System.out.println("hello controller");
        return  "hello";
    }
    @AuthMethod(value = false)
    @GetMapping("/no")
    public  String noAuth(){
        return  "false";
    }
}
