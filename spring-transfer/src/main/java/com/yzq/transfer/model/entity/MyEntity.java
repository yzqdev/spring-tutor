package com.yzq.transfer.model.entity;

import com.alibaba.fastjson.annotation.JSONField;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
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
    @JsonFormat(pattern= "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime startTime;

    public String getRole() {
        return "roles";
    }

    @JsonIgnore
    public String getRole1() {
        return "roles2";
    }
}
