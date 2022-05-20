package com.yzq.controller;

import com.yzq.entity.Teacher;
import com.yzq.mapper.TeacherMapper;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.time.LocalDateTime;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author y
 * @since 2022-05-17
 */
@RestController
@RequestMapping("/teacher")
public class TeacherController {
    @Resource
    TeacherMapper teacherMapper;

    @GetMapping("/c")
    public String c() {
        Teacher t = new Teacher(null, "yzq", "123456", LocalDateTime.now(), LocalDateTime.now());
        teacherMapper.insert(t);
        return teacherMapper.selectById(t.getId()).toString();
    }
    @GetMapping("/{id}")
    public String get(@PathVariable("id") String id) {
        Teacher t = teacherMapper.selectById(id);
        return t.toString();
    }
}
