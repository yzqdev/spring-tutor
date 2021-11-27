package com.example.springtransfer;

import com.example.springtransfer.utils.CacheUtils;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.context.junit4.SpringRunner;

@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
@ExtendWith(SpringExtension.class)
class SpringTransferTests {

    @Test
    public void test() throws Exception {
        CacheUtils.hashSet("test", "ymq", "www.ymq.io");
        System.out.println(CacheUtils.hashGet("test", "ymq"));
    }
}
