package com.example.springtransfer.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

/** @ component直接把整个类声明为一个bean
 * @author yanni
 * @date time 2021/11/28 22:43
 * @modified By:
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Component
public class CatComponent {
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


    public CatComponent cat() {
        return new CatComponent("tom", "boy", "12");
    }
}
