package com.yzq.transfer.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.yzq.transfer.model.entity.User;
import com.yzq.transfer.model.entity.UserDelDto;
import com.yzq.transfer.service.IUserService;
import com.yzq.transfer.utils.RequestHelper;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;

/**
 * @author yanni
 * @date time 2021/11/17 22:02
 * @modified By:
 */
@RestController
@RequestMapping("/user")
@RequiredArgsConstructor
public class UserController {
    private final IUserService userService;

    /**
     * 获取用户
     * api使用: http://localhost:9400/user/getUser
     * @return {@link User}
     */
    @GetMapping("user")
    public User getUser() {
        return null;
    }

    /**
     * 使用pathvariable
     * api使用: http://localhost:9400/userByPath/abcdde
     *
     * @param id id
     * @return {@link String}
     */
    @GetMapping("userByPath/{id}")
    public String getUserByPath(@PathVariable("id") String id) {
        return id;
    }
    /**
     * 添加用户
     * api使用: http://localhost:9400/user/addUserstr?username=aa&password=bb
     * @return {@link User}
     */
    @PostMapping("/addUser")
    public User addUser(User user) {
        return user;
    }

    /**
     * 添加用户
     * api使用: http://localhost:9400/user/addUserbody
     *<pre>
     *     <code>
     * {
     *             "username": "aa",
     *             "password": "bb"
     *         }
     *     </code>
     *</pre>
     * @param user 用户
     * @return {@link User}
     */
    @PostMapping("/addUserBody")
    public User addUserBody(@RequestBody User user) {
        return user;
    }


    /**
     * 添加用户
     *api使用: http://localhost:9400/user/addUserstr?username=aa&password=bb
     * @param username 用户名
     * @param password 密码
     * @return {@link User}
     */
    @PostMapping("/addUserstr")
    public User addUserString(String username, String password) {
        User user = User.builder().username(username).password(password).build();
        return user;
    }

    /**
     * 删除多个用户
     * api使用: http://localhost:9400/user/deleteUsers
     * <pre>
     *     <code>
     *         {
     *   "userIds": [
     *     "string"
     *   ]
     * }
     *     </code>
     * </pre>
     * @param userDelDto 用户del dto
     * @return {@link HashMap}<{@link String}, {@link Object}>
     */
    @DeleteMapping("/deleteUsers")
    public HashMap<String, Object> deleteUsers(@RequestBody UserDelDto userDelDto) {
        HashMap<String, Object> res = new HashMap<>();
        res.put("obj", userDelDto);

        return res;
    }

    /**
     * 删除users1
     * api使用: http://localhost:9400/user/deleteUsers1
     *[
     *   "string"
     * ]
     * @param ids id
     * @return {@link HashMap}<{@link String}, {@link Object}>
     */
    @DeleteMapping("/deleteUsers1")
    public HashMap<String, Object> deleteUsers1(@RequestBody String[] ids) {
        HashMap<String, Object> res = new HashMap<>();
        res.put("obj", ids);

        return res;
    }

    /**
     * 获取请求头信息
     *
     * @return {@link HashMap}<{@link String}, {@link Object}>
     */
    @GetMapping("/users")
    public HashMap<String, Object> getUsers() {
        HashMap<String, Object> res = new HashMap<>();
        String token = RequestHelper.getRequestHeader("token");
        String auth = RequestHelper.getRequestHeader("Authorization");
        res.put("token", token);
        res.put("auth", auth);
        return res;
    }

    /**
     * 检索
     *api使用: http://localhost:9400/user/retrieve?username=aa
     * @param username 用户名
     * @return {@link User}
     */
    @GetMapping("/retrieve")
    public User retrieve(@RequestParam("username") String username) {
        return userService.getOne(new LambdaQueryWrapper<User>().eq(User::getUsername, username));
    }

}
