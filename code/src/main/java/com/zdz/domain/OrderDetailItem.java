package com.zdz.domain;

import org.aspectj.weaver.ast.Or;

public class OrderDetailItem {
    private Integer gid;
    private String code;
    private String picture;
    private String description;
    private Double price;
    private Integer quantity;

    @Override
    public String toString() {
        return "OrderDetailItem{" +
                "gid=" + gid +
                ", code='" + code + '\'' +
                ", picture='" + picture + '\'' +
                ", description='" + description + '\'' +
                ", price=" + price +
                ", quantity=" + quantity +
                '}';
    }

    public OrderDetailItem(Integer gid, String code, String picture, String description, Double price, Integer quantity) {
        this.gid = gid;
        this.code = code;
        this.picture = picture;
        this.description = description;
        this.price = price;
        this.quantity = quantity;
    }

    public Integer getGid() {
        return gid;
    }

    public void setGid(Integer gid) {
        this.gid = gid;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
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

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }


}
