package com.yzq.controller;

import com.yzq.entity.Post;
import com.yzq.service.IPostService;
import com.yzq.service.impl.PostServiceImpl;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author y
 * @since 2022-05-17
 */
@RestController
@RequestMapping("/post")
public class PostController {
@Resource
private IPostService postService;
    @GetMapping("/all")
    public List<Post> getAll(@RequestParam("pageNum") int pageNum, @RequestParam("pageSize") int pageSize){

        return  postService.getAllPage(pageNum,pageSize);
    }
}
