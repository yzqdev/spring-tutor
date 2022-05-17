package com.yzq.service.impl;

import com.yzq.entity.Tag;
import com.yzq.mapper.TagMapper;
import com.yzq.service.ITagService;
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
public class TagServiceImpl extends ServiceImpl<TagMapper, Tag> implements ITagService {

}
