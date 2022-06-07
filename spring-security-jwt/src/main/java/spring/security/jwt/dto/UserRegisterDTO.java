package spring.security.jwt.dto;

import lombok.Data;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

/**
 * UserDTO
 *
 * @author star
 **/
@Data
public class UserRegisterDTO {

    @NotBlank
    @Size(min = 4, max = 30)
    private String username;

    @NotBlank
    @Size(min = 4, max = 30)
    private String nickname;

    @NotBlank
    @Size(min = 6, max = 15)
    private String password;

    @NotBlank
    @Email(message = "邮箱格式不对")
    @Size(max = 40)
    private String email;

}