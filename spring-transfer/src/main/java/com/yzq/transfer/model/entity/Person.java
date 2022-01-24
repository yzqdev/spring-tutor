package com.yzq.transfer.model.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

// 实体类
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Person {
    private Integer id;
    private String name;
    private String createTime;
    private LocalDateTime updateTime;
}