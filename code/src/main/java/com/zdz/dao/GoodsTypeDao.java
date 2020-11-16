package com.zdz.dao;

import com.zdz.domain.GoodsType;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("goodsTypeDao")
public interface GoodsTypeDao {

    /**
     * 得到所有商品种类
     *
     * @return
     */
    @Select("select * from goods_type")
    public List<GoodsType> findAll();
}
