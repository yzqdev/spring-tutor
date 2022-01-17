package com.yzq.controller;

import cn.hutool.core.date.DateTime;
import com.yzq.model.MyEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;

/**
 * @author yanni
 * @date time 2022/1/17 14:16
 * @modified By:
 */
@RestController
@RequestMapping("/entity")
public class EntityController {
    @GetMapping("/info")
    public MyEntity getEntity(){
        return new MyEntity("entity",  LocalDateTime.now() );
    }
}
