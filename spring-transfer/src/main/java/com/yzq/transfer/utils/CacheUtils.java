package com.yzq.transfer.utils;

import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

/**
 * 一定要扫描 不然直接使用工具类报空指针异常
 */
@Component
public class CacheUtils {
    @Resource
    private RedisTemplate redisTemplate;

    private static CacheUtils cacheUtils;

     //如果不加这个就要在类上添加注解方法
    @PostConstruct
    public void init() {
        cacheUtils = this;
        cacheUtils.redisTemplate = this.redisTemplate;
    }

    /**
     * 保存到hash集合中
     *
     * @param hName 集合名
     * @param key
     * @param value
     */
    public static void hashSet(String hName, String key, String value) {
        cacheUtils.redisTemplate.opsForHash().put(hName, key, value);
    }

    /**
     * 从hash集合里取得
     *
     * @param hName
     * @param key
     * @return
     */

    public static Object hashGet(String hName, String key) {
        return cacheUtils.redisTemplate.opsForHash().get(hName, key);
    }

    /**
     省略 N 多方法
     。。。。。。
     */
}