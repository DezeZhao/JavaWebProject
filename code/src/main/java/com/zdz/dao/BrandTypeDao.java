package com.zdz.dao;

import com.zdz.domain.BrandType;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("brandTypeDao")
public interface BrandTypeDao {
    /**
     * 得到所有的品牌类型
     *
     * @return
     */
    @Select("select * from brand_type")
    public List<BrandType> findAll();
}
