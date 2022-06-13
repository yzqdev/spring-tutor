package com.yzq.jpa.controller;

import com.yzq.jpa.model.entity.Student;
import com.yzq.jpa.service.IStudentService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.time.LocalDateTime;
import java.util.List;

/**
 * @author yanni
 * @date time 2022/6/13 21:56
 * @modified By:
 */
@RestController
public class StudentController {
    @Resource
    IStudentService studentService;
    @GetMapping("/c")
    public String addStudent() {
        Student s=new Student();
        s.setName("yzq");
        s.setCreateTime( LocalDateTime.now());
        s.setUpdateTime( LocalDateTime.now());
        studentService.saveStudent(s);
        return "student";
    }
    @GetMapping("/all")
    public List<Student> getAllStudent(){
        return  studentService.getAllStudent();
    }
}
