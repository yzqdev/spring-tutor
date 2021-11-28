package com.example.springtask.task.quartz.cron.service;

import org.springframework.stereotype.Service;

@Service
public class LiveReminderService {
    public void sendmessage() {
        try {
            Thread.sleep(10 * 1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        System.out.println("小明3点要去上课");
    }
}
