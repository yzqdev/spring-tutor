package com.yzq.model;

import cn.hutool.core.date.DateTime;
import com.alibaba.fastjson.annotation.JSONField;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * @author yanni
 * @date time 2022/1/17 13:24
 * @modified By:
 */
@Getter
@AllArgsConstructor
public class MyEntity implements Serializable {
    @Serial
    private static final long serialVersionUID = 3704448053616613744L;
    private String name;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private LocalDateTime startTime;

    public String getRole() {
        return "roles";
    }

    @JsonIgnore
    public String getRole1() {
        return "roles2";
    }
}
