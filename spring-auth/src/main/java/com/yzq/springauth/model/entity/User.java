package com.yzq.springauth.model.entity;

import java.io.Serializable;
import java.time.LocalDateTime;
import lombok.Getter;
import lombok.Setter;

/**
 * <p>
 * 
 * </p>
 *
 * @author y
 * @since 2022-05-17
 */
@Getter
@Setter
public class User implements Serializable {

    private static final long serialVersionUID = 1L;

    private String id;

    private String username;

    private String password;

    private Integer age;

    private String email;

    private String num;

    private String phone;

    /**
     * 错误次数
     */
    private String ecount;

    /**
     * 上次登录
     */
    private LocalDateTime ltime;

    /**
     * 创建时间
     */
    private LocalDateTime ctime;
    private String role;

}
