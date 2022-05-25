package com.yzq.springauth.controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author yanni
 * @date time 2022/5/23 23:36
 * @modified By:
 */
@RestController
@RequestMapping("/auth")
public class AuthController {

    @PostMapping("/login")
    public String login(){
        return  "login";
    }
    @PostMapping("/reg")
    public String register(){
        return  "reg";
    }
}
