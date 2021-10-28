package com.example.aop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author yanni
 * @date time 2021/10/28 7:54
 * @modified By:
 */
@Controller
@RequestMapping("/index")
public class PageController {
    @GetMapping("")
    public String index(){
        return  "index";
    }
}
