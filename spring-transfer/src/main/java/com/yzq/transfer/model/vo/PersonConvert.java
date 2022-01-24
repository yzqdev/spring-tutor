package com.yzq.transfer.model.vo;

import com.yzq.transfer.model.entity.Person;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

/**
 * 人转换
 *
 * @author yanni
 * @date 2022/01/17
 */
@Mapper(componentModel = "spring")
public interface PersonConvert {
    PersonConvert INSTANCE = Mappers.getMapper(PersonConvert.class);

    /**
     * 字段数量类型数量相同，利用工具BeanUtils也可以实现类似效果
     * @param source
     * @return
     */
    PersonVo1 toConvertVO1(Person source);
    Person fromConvertEntity1(PersonVo1 userVO1);

    /**
     * 字段数量类型相同,数量少：仅能让多的转换成少的，故没有fromConvertEntity2
     * @param source
     * @return
     */
    SamePeople toConvertSame(Person source);
}
