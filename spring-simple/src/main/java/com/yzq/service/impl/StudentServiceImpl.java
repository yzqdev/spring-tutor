package com.yzq.service.impl;

import com.yzq.entity.Student;
import com.yzq.mapper.StudentMapper;
import com.yzq.service.IStudentService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author y
 * @since 2022-05-17
 */
@Service
public class StudentServiceImpl extends ServiceImpl<StudentMapper, Student> implements IStudentService {

}
