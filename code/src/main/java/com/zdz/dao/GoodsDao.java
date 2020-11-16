package com.zdz.dao;

import com.zdz.domain.Goods;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("goodsDao")
public interface GoodsDao {
    /**
     * 得到所有商品列表
     *
     * @return
     */
    @Select("select *from goods")
    public List<Goods> findAll();

    /**
     * 根据商品ID查询商品信息
     *
     * @param gid
     * @return
     */
    @Select("select * from goods where id = #{gid}")
    public Goods findGoodsById(int gid);
}
