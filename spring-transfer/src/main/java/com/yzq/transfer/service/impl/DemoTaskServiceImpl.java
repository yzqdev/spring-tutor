package com.yzq.transfer.service.impl;

import com.yzq.transfer.service.IDemoTaskService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

@Slf4j
@Service
public class DemoTaskServiceImpl implements IDemoTaskService {


    private static final DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("HH:mm:ss");

    @Scheduled(fixedRate = 5000)
    public void getTask1() {
        System.out.println("任务1，当前时间：" + dateFormat.format(LocalDateTime.now()));
    }

    @Scheduled(cron = "0/5 * *  * * ? ")
    public void getTask2() {
        System.out.println("任务2，当前时间：" + dateFormat.format(LocalDateTime.now()));
    }

    @Scheduled(cron = "0/5 * *  * * ? ")
    public void getTaskLog4j() {
        log.info("Log4j，当前时间：" + dateFormat.format(LocalDateTime.now()));
    }

}