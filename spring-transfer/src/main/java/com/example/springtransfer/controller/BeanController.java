package com.example.springtransfer.controller;

import com.example.springtransfer.config.Person;
import org.springframework.context.ApplicationContext;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.HashMap;

/**
 * @author yanni
 * @date time 2021/11/23 13:13
 * @modified By:
 */
@RestController
@RequestMapping


public class BeanController {
    @Resource
    Person person;
    @Resource
    ApplicationContext appContext;

    @GetMapping("/beans")
    public Person showBeans() {
        return person;
    }

    @GetMapping("/appBean")
    public HashMap<String, Object> appBean() {
        HashMap<String, Object> res = new HashMap<>();
        res.put("bean", appContext.getBean("person"));
        return res;
    }

    @GetMapping("/allBean")
    public HashMap<String, Object> allBeans() {
        HashMap<String, Object> res = new HashMap<>();
        String[] beans = appContext.getBeanDefinitionNames();
        Arrays.sort(beans);
        for (String bean : beans) {
            System.out.println(bean + " of Type :: " + appContext.getBean(bean).getClass());
        }
        res.put("beans", beans);
        return res;


    }

}