package com.zdz.service;

import com.zdz.domain.Goods;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface GoodsService {
    /**
     * 得到所有商品列表
     *
     * @return
     */
    public List<Goods> findAll();

    /**
     * 根据商品ID查询商品信息
     *
     * @param gid
     * @return
     */
    public Goods findGoodsById(int gid);
}
