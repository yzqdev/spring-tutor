package com.example.springtask.task.jdk.timer;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Timer;

/**
 * 计时器马槽
 *
 * @author yanni
 * @date 2022/01/25
 */
public class TimerManger {
    private DemoTask demoTask;

    public TimerManger(DemoTask demoTask) {
        this.demoTask = demoTask;
    }

    public void run() throws ParseException {
        Timer timer = new Timer();

        long intevalPeriod = 3 * 1000;
        long delay = 0;
        //每每intevalPeriod毫秒执行一次
        timer.scheduleAtFixedRate(demoTask, delay, intevalPeriod);
        //timer.scheduleAtFixedRate(demoTask, 1000, intevalPeriod);//延迟一秒后每intevalPeriod毫秒执行一次
        String datetimeStr = "2018-10-16 15:00:00";
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date firstTime = sdf.parse(datetimeStr);
        //timer.schedule(demoTask, firstTime, intevalPeriod);//3点后开始执行 每intevalPeriod毫秒执行一次

    }
}
