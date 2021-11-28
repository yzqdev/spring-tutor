package com.example.springtask.task.quartz.simple.service;

import org.springframework.stereotype.Service;

/**
 * 订单服务
 *
 * @author yanni
 * @date 2021/11/28
 */
@Service
public class OrderService {
    public void delete() {
        try {
            Thread.sleep(6 * 1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        System.out.println("删除order成功....");
    }
}
