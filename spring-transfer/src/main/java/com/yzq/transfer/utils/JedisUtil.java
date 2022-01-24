package com.yzq.transfer.utils;

import redis.clients.jedis.Jedis;

/**
 * @author yanni
 * @date time 2021/11/28 15:07
 * @modified By:
 */
public class JedisUtil {


    public static Jedis me(){
        //连接本地的 Redis 服务
        Jedis jedis = new Jedis("localhost",6379);
        // 如果 Redis 服务设置了密码，需要下面这行，没有就不需要
        // jedis.auth("123456");
        System.out.println("连接成功");
        //查看服务是否运行
        System.out.println("服务正在运行: "+jedis.ping());
        return  jedis;
    }


}
