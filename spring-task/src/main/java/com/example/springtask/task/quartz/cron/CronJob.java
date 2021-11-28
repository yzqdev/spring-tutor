package com.example.springtask.task.quartz.cron;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.example.springtask.task.own.SchedulerTask;
import com.example.springtask.task.quartz.cron.service.LiveReminderService;
import org.springframework.format.annotation.DateTimeFormat;

import javax.annotation.Resource;

public class CronJob implements Job {
    private static final Logger log = LoggerFactory.getLogger(SchedulerTask.class);
    /**
     * 直播课提醒
     */
    @Resource
    private LiveReminderService liveReminderService;
    /**
     * 业务code Live lesson reminder
     */
    private String serviceCode;

    public String getServiceCode() {
        return serviceCode;
    }

    public void setServiceCode(String serviceCode) {
        this.serviceCode = serviceCode;
    }

    @Override
    public void execute(JobExecutionContext context) {
        log.info("quartz cron 当前时间 {}", LocalDateTime.now().format(DateTimeFormatter.ofPattern("HH:mm:ss")));
        liveReminderService.sendmessage();
    }
}
