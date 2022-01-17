package com.yzq;

import com.alibaba.fastjson.serializer.SerializerFeature;
import com.alibaba.fastjson.support.config.FastJsonConfig;
import com.alibaba.fastjson.support.spring.FastJsonHttpMessageConverter;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.http.HttpMessageConverters;
import org.springframework.context.annotation.Bean;
import org.springframework.http.converter.HttpMessageConverter;

/**
 * @author yanni
 * @date time 2022/1/17 14:14
 * @modified By:
 */
@SpringBootApplication
public class SimpleApp {
    public static void main(String[] args) {
       SpringApplication.run(SimpleApp.class,args);
    }

}
