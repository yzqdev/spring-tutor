package com.yzq.controller;


import com.yzq.entity.Student;
import com.yzq.mapper.StudentMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author yz
 * @since 2022-01-18
 */
@RestController
@RequestMapping("/student")
@RequiredArgsConstructor
public class StudentController {
    private final StudentMapper studentMapper;

    @PostMapping("/save")
    public Integer saveStudent(@RequestBody Student student) {
        return studentMapper.saveStudent(student);
    }
}

