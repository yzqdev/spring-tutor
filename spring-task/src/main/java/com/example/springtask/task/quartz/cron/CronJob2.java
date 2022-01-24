package com.example.springtask.task.quartz.cron;

import com.example.springtask.util.ColorUtil;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import com.example.springtask.task.quartz.cron.service.LiveReminderService;

import javax.annotation.Resource;

/**
 * cron job2
 *
 * @author yanni
 * @date 2021/11/28
 */
public class CronJob2 implements Job {
    /**
     * 生活提醒服务
     */
    @Resource
    private LiveReminderService liveReminderService;
    /**
     * 服务代码
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
        ColorUtil.cyan("CronJob2" + serviceCode);
        liveReminderService.sendmessage();
    }
}
