package com.yzq.transfer.config.quartz;

import org.quartz.*;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @author yanni
 * @date time 2022/1/25 1:24
 * @modified By:
 */
@Configuration
public class QuartzConfig {
    @Bean
    public JobDetail jobDetail1() {
        return JobBuilder.newJob(FirstJob.class).storeDurably().build();
    }
    @Bean
    public Trigger trigger1(){
        SimpleScheduleBuilder scheduleBuilder=SimpleScheduleBuilder.simpleSchedule().withIntervalInSeconds(5).repeatForever();
        return TriggerBuilder.newTrigger().forJob(jobDetail1()).withSchedule(scheduleBuilder).build();
    }
}
