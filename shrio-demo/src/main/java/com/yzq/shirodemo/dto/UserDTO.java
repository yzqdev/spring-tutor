package com.yzq.shirodemo.dto;

import lombok.Data;

import java.util.List;

/**
 * UserDTO
 *
 * @author star
 */
@Data
public class UserDTO {

    private String username;

    private String nickname;

    private String email;

    private List<String> roles;

}
