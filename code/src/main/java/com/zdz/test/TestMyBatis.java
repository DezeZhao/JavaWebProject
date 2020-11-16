package com.zdz.test;

import com.zdz.dao.GoodsDao;
import com.zdz.dao.OrderDao;
import com.zdz.dao.UserDao;

import com.zdz.domain.Goods;
import com.zdz.domain.Order;
import com.zdz.domain.User;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;

import java.io.InputStream;
import java.util.List;

public class TestMyBatis {

    /**
     * 测试查询
     *
     * @throws Exception
     */
    @Test
    public void testLogin() throws Exception {
        // 加载配置文件
        InputStream in = Resources.getResourceAsStream("SqlMapConfig.xml");
        // 创建SqlSessionFactory对象
        SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
        // 创建SqlSession对象
        SqlSession session = factory.openSession();
        // 获取到代理对象
        UserDao dao = session.getMapper(UserDao.class);
        User user = new User();
        user.setUsername("zdz");
        user.setPassword("zdz199804");
        System.out.println(dao.findUser("zdz").size());
        // 关闭资源
        session.close();
        in.close();
    }

    /**
     * 测试保存
     *
     * @throws Exception
     */
    @Test
    public void run2() throws Exception {
        User user = new User();
        user.setUsername("aaa");
        user.setPassword("123456");
        user.setSex("男");
        // 加载配置文件
        InputStream in = Resources.getResourceAsStream("SqlMapConfig.xml");
        // 创建SqlSessionFactory对象
        SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
        // 创建SqlSession对象
        SqlSession session = factory.openSession();
        // 获取到代理对象
//        UserDao dao = session.getMapper(UserDao.class);
        OrderDao goodsDao = session.getMapper(OrderDao.class);
        Order goodsList = goodsDao.findLastOrder();
        System.out.println(goodsList.getId());
        // 提交事务
        session.commit();

        // 关闭资源
        session.close();
        in.close();
    }

}
