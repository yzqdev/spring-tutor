package com.example.springtransfer.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author yanni
 * @date time 2021/11/17 22:05
 * @modified By:
 */
@Controller
@RequestMapping
public class PageController {
    @GetMapping("/" )
    public String index() {
        return "index";
    }
}
