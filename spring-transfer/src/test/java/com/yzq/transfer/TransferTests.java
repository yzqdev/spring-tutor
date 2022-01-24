package com.yzq.transfer;

import com.yzq.transfer.utils.CacheUtils;
import com.yzq.transfer.utils.RedisStaticUtil;
import com.yzq.transfer.utils.RedisUtils;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import javax.annotation.Resource;
import java.util.LinkedHashMap;
import java.util.Map;

@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
@ExtendWith(SpringExtension.class)
class TransferTests {
    @Resource
    RedisUtils redisUtils;

    @Test
    public void test() throws Exception {
        CacheUtils.hashSet("test", "ymq", "www.ymq.io");
        System.out.println(CacheUtils.hashGet("test", "ymq"));
    }

    @Test
    public void getRedisValue() {
         LinkedHashMap<String,Object> s = (LinkedHashMap) redisUtils.get("el-admin-48fd0b60-669f-461c-98df-ca4a14524db3");

        for (Map.Entry<String, Object > entry : s.entrySet()) {
            System.out.println("Key = " + entry.getKey() + ", Value = " + entry.getValue());
        }
    }
    @Test
    public void getRedis(){

        LinkedHashMap<String,Object> s = (LinkedHashMap) RedisStaticUtil.get("guns-87168db0-9c6d-4307-abc2-1aadeb8cefad");

        for (Map.Entry<String, Object > entry : s.entrySet()) {
            System.out.println("Key = " + entry.getKey() + ", Value = " + entry.getValue());
        }
    }
}
