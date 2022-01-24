package com.example.springtask.task.own;

import com.example.springtask.util.ColorUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 * 调度器任务
 *<h2 style="color:red">在主类上加上@EnableScheduling</h2>
 * @author yanni
 * @date 2022/01/25
 */
@Component
@Slf4j
public class SchedulerTask {

    private static final DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("HH:mm:ss");


    /**
     * 固定的时间执行 也就是 3秒执行一次
     * <p>
     *      <pre>
     *          fixedRate: 上一次开始执行时间点之后多长时间再执行
     *      </pre>
     * </p>
     */
    @Scheduled(fixedRate = 3000)
    public void task1() {
        try {
            Thread.sleep(4 * 1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        ColorUtil.red("SchedulerTask1  "+LocalDateTime.now().format(dateFormat)  );
    }

    /**
     * task2
     * <p>
     *     <pre>
     *        fixedDelay: 上一次执行完毕时间点之后多长时间再执行
     *     </pre>
     * </p>
     */
    @Scheduled(initialDelay = 0, fixedDelay = 3000)
    public void task2() {
        try {
            Thread.sleep(4 * 1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        ColorUtil.blue("SchedulerTask2  "+ LocalDateTime.now().format(dateFormat));
    }
}
