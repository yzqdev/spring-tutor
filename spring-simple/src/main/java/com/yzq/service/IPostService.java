package com.yzq.service;

import com.yzq.entity.Post;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author y
 * @since 2022-05-17
 */
public interface IPostService extends IService<Post> {
List<Post> getAllPage(int pageNum,int pageSize);
}
