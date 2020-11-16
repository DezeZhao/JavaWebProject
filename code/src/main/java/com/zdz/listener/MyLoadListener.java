/*
package com.zdz.listener;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

import com.zdz.domain.Goods;
import com.zdz.service.impl.GoodsServiceImpl;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.context.ServletContextAware;

import java.util.List;

@Service
public class MyLoadListener implements InitializingBean, ServletContextAware {

    @Resource(name = "goodsService")
    private GoodsServiceImpl goodsService;

    @Override
    public void setServletContext(ServletContext servletContext) {
        List<Goods> all = goodsService.findAll();
    }

    @Override
    public void afterPropertiesSet() throws Exception {
        // TODO Auto-generated method stub

    }


}*/
