package com.yzq.transfer.listener;

import cn.hutool.core.lang.Console;
import org.springframework.boot.web.context.WebServerInitializedEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.context.annotation.Configuration;

import java.net.InetAddress;
import java.net.UnknownHostException;

/**
 * @author yanni
 * @date time 2021/10/29 12:13
 * @modified By:
 */
@Configuration
public class AppListener implements ApplicationListener<WebServerInitializedEvent> {
    @Override
    public void onApplicationEvent(WebServerInitializedEvent event) {
        int port = event.getApplicationContext().getWebServer().getPort();
        InetAddress address = null;
        try {
            address = InetAddress.getLocalHost();
            Console.log("http://" + address.getHostAddress() + ":" + port + "/swagger-ui.html");
            Console.log("http://" + address.getHostAddress() + ":" + port);
        } catch (UnknownHostException e) {
            e.printStackTrace();
        }
    }
}
