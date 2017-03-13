package com.qcacg.common.util;

/**
 * Created by lijunyang on 2016/12/3.
 */



public class RedisConfig {


    //ip
    public  static String ADDR = "localhost";


    //端口号
    public  static int PORT = 6379;

    public  static String AUTH = "f4f1490f6cbbfa57c8b3e3f35d8fcaa2810b0390";

    //最大连接数
    public  static int MAX_ACTIVE = 300;

    //最大空闲连接数
    public  static int MAX_IDLE = 200;

    //获取连接时的最大等待毫秒数(如果设置为阻塞时BlockWhenExhausted),
    // 如果超时就抛异常, 小于零:阻塞不确定的时间,  默认-1
    public  static int MAX_WAIT = 10000;

    //超时时间
    public  static int TIMEOUT = 100000;

    //在获取连接的时候检查有效性, 默认false
    public  static boolean TEST_ON_BORROW = true;
}
