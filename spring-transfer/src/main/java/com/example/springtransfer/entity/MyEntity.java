package com.example.springtransfer.entity;

import com.alibaba.fastjson.annotation.JSONField;
import lombok.AllArgsConstructor;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * @author yanni
 * @date time 2022/1/17 13:24
 * @modified By:
 */
@Data
@AllArgsConstructor
public class MyEntity {
    private String name;
    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime startTime;

    public String getRole() {
        return "roles";
    }

    @JSONField(serialize = false)
    public String getRole1() {
        return "roles2";
    }
}
