package com.zdz.domain;

public class CartItem {
    Goods goods;
    private Integer quantity;

    public CartItem(Goods goods, Integer quantity) {
        this.goods = goods;
        this.quantity = quantity;
    }

    public Goods getGoods() {
        return goods;
    }

    public void setGoods(Goods goods) {
        this.goods = goods;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "CartItem{" +
                "goods=" + goods +
                ", quantity=" + quantity +
                '}';
    }
}
