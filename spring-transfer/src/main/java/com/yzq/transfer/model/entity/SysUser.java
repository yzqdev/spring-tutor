package com.yzq.transfer.model.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author yanni
 * @date time 2021/11/17 22:02
 * @modified By:
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class SysUser {
    @TableId(type = IdType.ASSIGN_ID)
    private  String id;
    private String username;
    private String password;
    private Integer age;
    private String email;
  
}
