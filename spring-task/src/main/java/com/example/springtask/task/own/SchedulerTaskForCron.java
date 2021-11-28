package com.example.springtask.task.own;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;

//@Component
@Slf4j
public class SchedulerTaskForCron {

    /**
     * 每天的14:00 执行一次
     */
    @Scheduled(cron = "0 0 14 * * ?")
    private void cron() {
        log.info("cron The time is now {}",  LocalDateTime.now().format(DateTimeFormatter.ofPattern("HH:mm:ss")));
    }

    /**
     * 每5秒执行一次
     */
    @Scheduled(cron = "0/5 * * * * ?")
    private void cron2() {
        try {
            Thread.sleep(6 * 1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        log.info("cron2 The time is now {}", LocalDateTime.now().format(DateTimeFormatter.ofPattern("HH:mm:ss")));
    }
}
