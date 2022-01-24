package com.yzq.transfer.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.yzq.transfer.model.entity.User;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author yanni
 * @date time 2022/1/24 15:15
 * @modified By:
 */
@Mapper
public interface UserMapper extends BaseMapper<User> {
}
