package com.example.springtask.task.quartz.simple;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

import com.example.springtask.util.ColorUtil;
import lombok.extern.slf4j.Slf4j;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.quartz.QuartzJobBean;

import com.example.springtask.task.own.SchedulerTask;
import com.example.springtask.task.quartz.simple.service.OrderService;

import javax.annotation.Resource;

/**
 * 简单的工作
 *
 * @author yanni
 * @date 2021/11/28
 */
@Slf4j
public class SimpleJob extends QuartzJobBean {
    @Resource
    private OrderService orderService;
    private String serviceCode;


    public String getServiceCode() {
        return serviceCode;
    }

    public void setServiceCode(String serviceCode) {
        this.serviceCode = serviceCode;
    }

    @Override
    protected void executeInternal(JobExecutionContext context) {

       ColorUtil.green(serviceCode);
       ColorUtil.red("quartz 简单时间   "+ LocalDateTime.now().format(DateTimeFormatter.ofPattern("HH:mm:ss")));
        orderService.delete();
    }

}
