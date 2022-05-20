package com.yzq.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author y
 * @since 2022-05-17
 */
@RestController
@RequestMapping("/user")
public class UserController {
    @GetMapping("/hello")
    String hello() {
        return "hello world";
    }

    @GetMapping("/user")
    String user() {
        return "user";
    }
        //return SecurityContextHolder.getContext().getAuthentication().getName();

}
