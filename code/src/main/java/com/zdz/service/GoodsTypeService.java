package com.zdz.service;

import com.zdz.domain.GoodsType;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface GoodsTypeService {
    /**
     * 得到所有商品种类
     *
     * @return
     */
    public List<GoodsType> findAll();
}
