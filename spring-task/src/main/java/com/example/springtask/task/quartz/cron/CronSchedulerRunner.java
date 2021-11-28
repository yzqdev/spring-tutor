package com.example.springtask.task.quartz.cron;

import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

/**
 * cron调度程序跑
 *
 * @author yanni
 * @date 2021/11/28
 */
//@Component
public class CronSchedulerRunner implements CommandLineRunner {
    @Resource
    public CronSchedulerJobManger manger;

    @Override
    public void run(String... args) throws Exception {
        manger.scheduleJobs();
    }

}
