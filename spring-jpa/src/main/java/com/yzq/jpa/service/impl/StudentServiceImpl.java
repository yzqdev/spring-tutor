package com.yzq.jpa.service.impl;

import com.yzq.jpa.model.entity.Student;
import com.yzq.jpa.repository.StudentRepository;
import com.yzq.jpa.service.IStudentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author yanni
 * @date time 2022/6/13 21:58
 * @modified By:
 */
@Service
public class StudentServiceImpl implements IStudentService {
    @Resource
    StudentRepository studentRepository;
    @Override
    public Student saveStudent(Student student) {
        return studentRepository.save(student);
    }

    @Override
    public List<Student> getAllStudent() {
        return studentRepository.findAll();
    }
}
