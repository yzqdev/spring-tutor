package com.yzq.transfer.controller;

import com.yzq.transfer.service.IMailService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;

/**
 * @author yanni
 * @date time 2022/1/24 22:53
 * @modified By:
 */
@RestController
@RequestMapping("/email")
@RequiredArgsConstructor
public class EmailController {
    private final IMailService mailService;
    @Value("${server.port}")
    private String port;

    @PostMapping("/sendTemplate")
    public HashMap<String, Object> sendTemplate(String to, String subject) {
        HashMap<String, Object> content = new HashMap<>(16);
        String username = "yanni";
        String webname = "yzq";
        String new_pass = "123456";
        String domain = "http://localhost:" + port;
        String uid = "yzq";
        content.put("username", username);
        content.put("webname", webname);
        content.put("new_pass", new_pass);
        content.put("url", domain + "/user/retrieve?username=" + uid);
        mailService.sendTemplateEmail(to, subject, content);
        return content;
    }
}
