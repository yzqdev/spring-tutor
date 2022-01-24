package com.example.springtask.task.quartz.simple.service;

import com.example.springtask.util.ColorUtil;
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
       ColorUtil.red("删除order成功....");
    }
}
