package com.example.springtransfer.config;

import com.example.springtransfer.model.entity.Dog;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 人
 *
 * @author yanni
 * @date 2021/11/23
 */
@PropertySource(value = "classpath:person.properties")
@Component
@ConfigurationProperties(prefix = "person")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Person {

    private String lastName;

    private Integer age;

    private Boolean boss;

    private Date birth;

    private Map<String, Object> maps;

    private List<Object> lists;

    private Dog dog;

}