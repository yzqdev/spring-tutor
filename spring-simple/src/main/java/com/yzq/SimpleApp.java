package com.yzq;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * @author yanni
 * @date time 2022/1/17 14:14
 * @modified By:
 */
@SpringBootApplication
@MapperScan("com.yzq.mapper")
public class SimpleApp {
    public static void main(String[] args) {
       SpringApplication.run(SimpleApp.class,args);
    }

}
