package com.zdz.service;

import com.zdz.domain.BrandType;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface BrandTypeService {
    public List<BrandType> findAll();
}
