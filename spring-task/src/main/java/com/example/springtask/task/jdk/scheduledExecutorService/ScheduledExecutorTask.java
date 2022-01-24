package com.example.springtask.task.jdk.scheduledExecutorService;

import com.example.springtask.util.ColorUtil;
import lombok.extern.slf4j.Slf4j;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 * 计划任务执行人
 *
 * @author yanni
 * @date 2022/01/25
 */
@Slf4j
public class ScheduledExecutorTask implements Runnable {
    private static final DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern( "HH:mm:ss");

    @Override
    public void run() {
        try {
            Thread.sleep(4 * 1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        ColorUtil.green("scheduledExecutorTask当前时间  "+dateFormat.format(LocalDateTime.now()));
    }
}
