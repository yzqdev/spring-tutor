package com.yzq.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yzq.entity.Post;
import com.yzq.mapper.PostMapper;
import com.yzq.service.IPostService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author y
 * @since 2022-05-17
 */
@Service
public class PostServiceImpl extends ServiceImpl<PostMapper, Post> implements IPostService {
@Resource
private  PostMapper postMapper;
    @Override
    public List<Post> getAllPage(int pageNum, int pageSize) {
       Page<Post> page =new Page <>(pageNum,pageSize);
       Page<Post> result=postMapper.selectPage(page,null);
       return  result.getRecords();
    }
}
