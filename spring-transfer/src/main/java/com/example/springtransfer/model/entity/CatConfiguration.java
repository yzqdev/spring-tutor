package com.example.springtransfer.model.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * configuration常常和@bean搭配
 *
 * @author yanni
 * @date time 2021/11/28 22:43
 * @modified By:
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Configuration
public class CatConfiguration {
    String name;
    private String sex;
    private String age;

    public void init() {
        System.out.println("MyBean初始化...");
    }

    public void destroy() {
        System.out.println("MyBean销毁...");
    }

    public String get() {
        return "MyBean使用...";
    }

    @Bean(name = "catConfig", initMethod = "init", destroyMethod = "destroy")
    public CatConfiguration getCat() {
        return CatConfiguration.builder().age("12").name("tomcat").sex("boy").build();
    }

    @Bean
    public CatConfiguration newCat(){
        return  new CatConfiguration("aaa","bbb","ccc");
    }
}
