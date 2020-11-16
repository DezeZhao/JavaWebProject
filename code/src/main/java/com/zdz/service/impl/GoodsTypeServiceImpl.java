package com.zdz.service.impl;

import com.zdz.dao.GoodsDao;
import com.zdz.dao.GoodsTypeDao;
import com.zdz.domain.GoodsType;
import com.zdz.service.GoodsTypeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("goodsTypeService")
public class GoodsTypeServiceImpl implements GoodsTypeService {
    @Resource(name = "goodsTypeDao")
    private GoodsTypeDao goodsTypeDao;

    @Override
    public List<GoodsType> findAll() {
        return goodsTypeDao.findAll();
    }
}
