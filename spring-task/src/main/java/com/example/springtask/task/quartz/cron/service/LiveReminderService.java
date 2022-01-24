package com.example.springtask.task.quartz.cron.service;

import com.example.springtask.util.ColorUtil;
import org.springframework.stereotype.Service;

@Service
public class LiveReminderService {
    public void sendmessage() {
        try {
            Thread.sleep(10 * 1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
       ColorUtil.blue("小明3点要去上课");
    }
}
