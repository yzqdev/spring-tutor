package com.yzq.transfer.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

/**
 * @author yanni
 * @date time 2022/1/17 20:44
 * @modified By:
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SamePeople {
    private Integer id;
    private String name;
    private String createTime;
    private LocalDateTime updateTime;
}
