package com.yzq.transfer.controller;

import com.yzq.transfer.model.entity.MyEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;

/**
 * @author yanni
 * @date time 2022/1/17 13:22
 * @modified By:
 */
@RestController
@RequestMapping("/entity")
public class EntityController {
    @GetMapping("/info")
    public MyEntity getMyEntity() {
        MyEntity myEntity = new MyEntity("hhh", LocalDateTime.now());
        return myEntity;
    }
}
