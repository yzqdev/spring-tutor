package com.example.springtask;

import com.example.springtask.util.ColorUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

import java.time.LocalDateTime;

@SpringBootApplication
@Slf4j
//@EnableScheduling
public class Task {

    public static void main(String[] args) {
        SpringApplication.run(Task.class, args);
        ColorUtil.red("reportCurrentTimeInitialDelay fixedRate The time is start {}"+ LocalDateTime.now());
    }

}
