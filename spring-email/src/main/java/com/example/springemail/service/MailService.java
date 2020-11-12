package com.example.springemail.service;

/**
 * @Author: Yangzhengqian
 * @Description:
 * @Date:Created time 2020/11/12 上午10:46
 * @Modified By:
 */

public interface MailService {

    void sendSimpleMail(String to, String subject, String content);

    void sendHtmlMail(String to, String subject, String content);

    void sendAttachmentsMail(String to, String subject, String content, String filePath);

    void sendInlineResourceMail(String to, String subject, String content, String rscPath, String rscId);

}
