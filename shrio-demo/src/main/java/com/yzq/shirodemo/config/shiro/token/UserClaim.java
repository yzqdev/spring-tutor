package com.yzq.shirodemo.config.shiro.token;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author yanni
 * @date time 2022/6/6 13:54
 * @modified By:
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class UserClaim{

    private String username;
    private  String password;
    private  String uid;
}
