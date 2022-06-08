package com.yzq.shirodemo.dto;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

/**
 * UserLoginDTO
 *
 * @author star
 */
@JsonIgnoreProperties(ignoreUnknown = true)
@Data
public class UserLoginDTO {

    private String username;

    private String password;

    /**
     * 是否记住我，默认 false
     */
    private Boolean rememberMe = false;



}
