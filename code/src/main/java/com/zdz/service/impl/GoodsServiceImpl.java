package com.zdz.service.impl;

import com.zdz.dao.GoodsDao;
import com.zdz.domain.Goods;
import com.zdz.service.GoodsService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("goodsService")
public class GoodsServiceImpl implements GoodsService {
    @Resource(name = "goodsDao")
    private GoodsDao goodsDao;

    @Override
    public List<Goods> findAll() {
        return goodsDao.findAll();
    }

    @Override
    public Goods findGoodsById(int gid) {
        return goodsDao.findGoodsById(gid);
    }
}
