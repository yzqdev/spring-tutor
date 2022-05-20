package com.yzq.controller;

import com.yzq.entity.Student;
import com.yzq.mapper.StudentMapper;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.time.LocalDateTime;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author y
 * @since 2022-05-17
 */
@RestController
@RequestMapping("/student")
public class StudentController {
@Resource
    StudentMapper studentMapper;
    @GetMapping("/c")
    public String addStudent() {
        Student s=new Student();
        s.setName("yzq");
        s.setCreateTime(LocalDateTime.now());
        s.setUpdateTime(LocalDateTime.now());
        studentMapper.insert(s);
        return "student";
    }
}
