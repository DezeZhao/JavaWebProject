package com.zdz.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class Order implements Serializable {
    private Integer id;//订单编号
    private Integer uid;//用户信息（匹配用户id）
    private String time;//下单时间
    private Double price;//订单总价
    private String status;//订单状态

    //一个订单信息表可能含有多个订单，每个订单有各自的明细，
    private List<OrderDetail> orderDetailList;
    //所以用list来表示订单明细（一对多）

    //一个订单只属于一个用户
    private User user;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public List<OrderDetail> getOrderDetailList() {
        return orderDetailList;
    }

    public void setOrderDetailList(List<OrderDetail> orderDetailList) {
        this.orderDetailList = orderDetailList;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "Order{" +
                "id=" + id +
                ", uid=" + uid +
                ", time='" + time + '\'' +
                ", price=" + price +
                ", status='" + status + '\'' +
                ", orderDetailList=" + orderDetailList +
                ", user=" + user +
                '}';
    }
}
