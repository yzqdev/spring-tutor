package com.example.springtask.task.jdk.scheduledExecutorService;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
@Slf4j
public class ScheduledExecutorTask implements Runnable {
    private static final SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");

    @Override
    public void run() {
        try {
            Thread.sleep(4 * 1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        log.info("scheduledExecutorTask The time is now {}", dateFormat.format(new Date()));
    }
}
