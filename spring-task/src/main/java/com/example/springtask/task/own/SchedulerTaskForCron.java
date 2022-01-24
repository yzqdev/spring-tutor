package com.example.springtask.task.own;

import com.example.springtask.util.ColorUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Component
@Slf4j
public class SchedulerTaskForCron {

    /**
     * 每天的14:00 执行一次
     */
    @Scheduled(cron = "0 0 14 * * ?")
    private void cron1() {
        ColorUtil.cyan("cron1 每天14:00发生 "+  LocalDateTime.now().format(DateTimeFormatter.ofPattern("HH:mm:ss")));
    }

    /**
     * 每5秒执行一次
     */
    @Scheduled(cron = "0/3 * * * * ?")
    private void cron2() {
        try {
            Thread.sleep(6 * 1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        ColorUtil.red("cron2 现在时间 "+ LocalDateTime.now().format(DateTimeFormatter.ofPattern("HH:mm:ss")));
    }
}
