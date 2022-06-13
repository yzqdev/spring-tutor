package com.yzq.jpa.service;

import com.yzq.jpa.model.entity.Student;

import java.util.List;

/**
 * @author yanni
 * @date time 2022/6/13 21:58
 * @modified By:
 */
public interface IStudentService {
    Student saveStudent(Student student);
    List<Student> getAllStudent();
}
