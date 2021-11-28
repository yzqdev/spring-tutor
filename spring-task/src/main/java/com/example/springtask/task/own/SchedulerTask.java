package com.example.springtask.task.own;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;

import javax.swing.text.DateFormatter;

//@Component
public class SchedulerTask {

    private static final Logger log = LoggerFactory.getLogger(SchedulerTask.class);
    private static final DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("HH:mm:ss");

    //固定的时间执行 也就是 5秒执行一次
    @Scheduled(fixedRate = 5000)
    public void reportCurrentTimeFixedRate() {
        try {
            Thread.sleep(6 * 1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        log.info("reportCurrentTimeFixedRate The time is now {}", LocalDateTime.now().format(dateFormat));
    }

    @Scheduled(initialDelay = 0, fixedDelay = 5000)
    public void reportCurrentTimeInitialDelay() {
        try {
            Thread.sleep(6 * 1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        log.info("reportCurrentTimeInitialDelay fixedRate The time is now {}", LocalDateTime.now().format(dateFormat));
    }
}
