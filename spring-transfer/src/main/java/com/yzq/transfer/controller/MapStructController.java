package com.yzq.transfer.controller;

import com.yzq.transfer.model.entity.Person;
import com.yzq.transfer.model.vo.PersonConvert;
import com.yzq.transfer.model.vo.PersonVo1;
import org.springframework.beans.BeanUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;
import java.util.HashMap;

@RestController
@RequestMapping("/test")
public class MapStructController {

    @GetMapping("/convert")
    public Object convertEntity() {
        Person user = Person.builder()
                .id(1)
                .name("张三")
                .createTime("2020-04-01 11:05:07")
                .updateTime(LocalDateTime.now())
                .build();
        HashMap<String,Object> objectList = new HashMap<>(16);

        objectList.put("user",user);

        // 使用mapstruct
        PersonVo1 beanVo = PersonConvert.INSTANCE.toConvertVO1(user);
        objectList.put("userVO1:" ,PersonConvert.INSTANCE.toConvertVO1(user));
        objectList.put("userVO1转换回实体类user:" , PersonConvert.INSTANCE.fromConvertEntity1(beanVo));
        // 输出转换结果
         objectList.put("samePeople:" ,  PersonConvert.INSTANCE.toConvertSame(user));
        // 使用BeanUtils
        //UserVO2 userVO22 = new UserVO2();
        BeanUtils.copyProperties(user, beanVo);
        objectList.put("BeanCopyUser:" , beanVo);

        return objectList;
    }
}
