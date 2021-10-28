package com.example.aop.listener;

import lombok.Data;
import org.springframework.boot.web.context.WebServerInitializedEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.context.annotation.Configuration;

import java.net.InetAddress;
import java.net.UnknownHostException;

/**
 * @author yanni
 */
@Configuration
public class ApplicationStartListener implements ApplicationListener<WebServerInitializedEvent> {


    public int serverPort;

    @Override
    public void onApplicationEvent(WebServerInitializedEvent event) {
        int port = event.getApplicationContext().getWebServer().getPort();
        InetAddress address = null;
        try {
            address = InetAddress.getLocalHost();
            System.out.println("http://" + address.getHostAddress() + ":" + port + "/swagger-ui/");
            System.out.println("http://" + address.getHostAddress() + ":" + port);
        } catch (UnknownHostException e) {
            e.printStackTrace();
        }

    }


}


