package com.yzq.jpa.repository;

import com.yzq.jpa.model.entity.Student;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * @author yanni
 * @date time 2022/6/13 22:00
 * @modified By:
 */
@Repository
public interface StudentRepository extends JpaRepository<Student,Long> {
}
