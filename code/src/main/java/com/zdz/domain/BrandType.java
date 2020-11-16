package com.zdz.domain;

import java.util.List;

public class BrandType {
    private int id;
    private String name;

    //一个品牌可以有多个商品
    private List<Goods> goodsList;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Goods> getGoodsList() {
        return goodsList;
    }

    public void setGoodsList(List<Goods> goodsList) {
        this.goodsList = goodsList;
    }

    @Override
    public String toString() {
        return "BrandType{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", goodsList=" + goodsList +
                '}';
    }
}
