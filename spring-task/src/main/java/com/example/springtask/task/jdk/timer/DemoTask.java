package com.example.springtask.task.jdk.timer;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.TimerTask;

import com.example.springtask.util.ColorUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.example.springtask.task.own.SchedulerTask;

public class DemoTask extends TimerTask {
    private static final DateTimeFormatter dateFormat =DateTimeFormatter.ofPattern( "HH:mm:ss");

    @Override
    public void run() {
        try {
            Thread.sleep(4 * 1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        ColorUtil.blue("DemoTask The time is now  "+ dateFormat.format(LocalDateTime.now()));
    }
}
