package com.zdz.service.impl;

import com.zdz.dao.BrandTypeDao;
import com.zdz.domain.BrandType;
import com.zdz.service.BrandTypeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("brandTypeService")
public class BrandTypeServiceImpl implements BrandTypeService {
    @Resource(name = "brandTypeDao")
    private BrandTypeDao brandTypeDao;

    @Override
    public List<BrandType> findAll() {
        return brandTypeDao.findAll();
    }
}
