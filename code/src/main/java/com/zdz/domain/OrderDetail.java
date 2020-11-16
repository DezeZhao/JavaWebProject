package com.zdz.domain;

import java.io.Serializable;
import java.util.List;

public class OrderDetail implements Serializable {
    private Integer id;//订单明细项编号
    private Integer oid;//订单信息（匹配订单信息id）
    private Integer gid;//商品信息(匹配商品id)
    private Integer quantity;//商品数量

    //一个订单明细项只能包含一个商品
    private Goods goods;

    //一个订单明细项只能属于唯一的订单编号
    private Order order;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getOid() {
        return oid;
    }

    public void setOid(Integer oid) {
        this.oid = oid;
    }

    public Integer getGid() {
        return gid;
    }

    public void setGid(Integer gid) {
        this.gid = gid;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Goods getGoods() {
        return goods;
    }

    public void setGoods(Goods goods) {
        this.goods = goods;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    @Override
    public String toString() {
        return "OrderDetail{" +
                "id=" + id +
                ", oid=" + oid +
                ", gid=" + gid +
                ", quantity=" + quantity +
                ", goods=" + goods +
                ", order=" + order +
                '}';
    }
}
