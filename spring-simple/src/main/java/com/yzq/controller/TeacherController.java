package com.yzq.controller;


import com.yzq.entity.Student;
import com.yzq.entity.Teacher;
import com.yzq.mapper.TeacherMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author yz
 * @since 2022-01-18
 */
@RestController
@RequestMapping("/teacher")
@RequiredArgsConstructor
public class TeacherController {
    private final TeacherMapper teacherMapper;
    @PostMapping("/save")
    public Integer saveTeacher(@RequestBody Teacher teacher) {
        teacher.setCreateTime(LocalDateTime.now());
        teacher.setUpdateTime(LocalDateTime.now());
        return teacherMapper.insert(teacher);
    }
}

