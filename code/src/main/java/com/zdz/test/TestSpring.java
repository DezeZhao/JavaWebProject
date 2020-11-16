package com.zdz.test;

import com.zdz.domain.CartItem;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.HashMap;
import java.util.Map;

public class TestSpring {

    @Test
    public void run1() {
        // 加载配置文件
        //ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        // 获取对象
        /*AccountService as = (AccountService) ac.getBean("accountService");
        // 调用方法
        as.findAll();*/
        Map map = new HashMap<Integer, String>();
        map.put(1, "1111");
        map.put(2, "1111");
        map.put(3, "1111");
        map.put(4, "1111");
        System.out.println(map);
    }


}
