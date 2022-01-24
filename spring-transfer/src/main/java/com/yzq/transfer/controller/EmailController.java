package com.yzq.transfer.controller;

import com.yzq.transfer.service.IMailService;
import lombok.RequiredArgsConstructor;
import org.springdoc.api.annotations.ParameterObject;
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

    @PostMapping("/sendTemplate")
    public HashMap<String, Object> sendTemplate( String to,String subject) {
        HashMap<String, Object> content = new HashMap<>(16);
        content.put("id", to);
        mailService.sendTemplateEmail(to, subject, content);
        return content;
    }
}
