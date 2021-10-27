package com.example.aop.service;

import com.example.aop.core.CommonResp;
import com.example.aop.core.Passport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

/**
 * @author yanni
 */
@Service
public class DemoService {

    private Logger log = LoggerFactory.getLogger(getClass());

    public CommonResp action0(Passport passport, String input) {
        log.info("enter action0...");
        return CommonResp.success("action0 success. input=" + input);
    }
}
