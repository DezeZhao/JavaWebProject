package com.zdz.domain;

import java.io.Serializable;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class Goods implements Serializable {
    /*
    int  id
	varchar  code
    int  gid
	int  bid
	varchar  name
	longtext  	desciption
	double  price
	varchar picture
	int  inventory
	int	status
	varchar shop
	varchar location
	varchar  img2 img3 img4
*/
    private Integer id;//编号
    private String code;//商品编码
    private Integer gid;//商品类型
    private Integer bid;//品牌
    private String name;//商品名
    private String description;//简介
    private Double price;//单价
    private String picture;//商品大图
    private Integer inventory;//库存
    private Integer status;//处理状态
    private String shop;//销售店铺
    private String location;//销售地点
    private String img2;//第一张小图
    private String img3;//第二张小图
    private String img4;//第三张小图

    //一个商品属于多个订单明细
    private List<OrderDetail> orderDetailList;

    //一个商品只能属于一种品牌
    private BrandType brandType;

    //一个商品只能属于一种商品种类
    private GoodsType goodsType;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Integer getGid() {
        return gid;
    }

    public void setGid(Integer gid) {
        this.gid = gid;
    }

    public Integer getBid() {
        return bid;
    }

    public void setBid(Integer bid) {
        this.bid = bid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public Integer getInventory() {
        return inventory;
    }

    public void setInventory(Integer inventory) {
        this.inventory = inventory;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getShop() {
        return shop;
    }

    public void setShop(String shop) {
        this.shop = shop;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getImg2() {
        return img2;
    }

    public void setImg2(String img2) {
        this.img2 = img2;
    }

    public String getImg3() {
        return img3;
    }

    public void setImg3(String img3) {
        this.img3 = img3;
    }

    public String getImg4() {
        return img4;
    }

    public void setImg4(String img4) {
        this.img4 = img4;
    }

    public List<OrderDetail> getOrderDetailList() {
        return orderDetailList;
    }

    public void setOrderDetailList(List<OrderDetail> orderDetailList) {
        this.orderDetailList = orderDetailList;
    }

    public BrandType getBrandType() {
        return brandType;
    }

    public void setBrandType(BrandType brandType) {
        this.brandType = brandType;
    }

    public GoodsType getGoodsType() {
        return goodsType;
    }

    public void setGoodsType(GoodsType goodsType) {
        this.goodsType = goodsType;
    }

    @Override
    public String toString() {
        return "Goods{" +
                "id=" + id +
                ", code='" + code + '\'' +
                ", gid=" + gid +
                ", bid=" + bid +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", price=" + price +
                ", picture='" + picture + '\'' +
                ", inventory=" + inventory +
                ", status=" + status +
                ", shop='" + shop + '\'' +
                ", location='" + location + '\'' +
                ", img2='" + img2 + '\'' +
                ", img3='" + img3 + '\'' +
                ", img4='" + img4 + '\'' +
                ", orderDetailList=" + orderDetailList +
                ", brandType=" + brandType +
                ", goodsType=" + goodsType +
                '}';
    }
}
