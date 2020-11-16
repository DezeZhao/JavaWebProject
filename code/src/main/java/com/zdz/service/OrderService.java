package com.zdz.service;

import com.zdz.domain.Order;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface OrderService {
    /**
     * 获取指定用户的订单
     *
     * @param uid
     * @return
     */
    public List<Order> findOrderByUid(int uid);

    /**
     * 查找最后一次插入的订单项
     *
     * @return
     */
    public Order findLastOrder();


    /**
     * 删除订单
     *
     * @param oid
     */
    public void deleteOrderById(int oid);


    public void addOrder(Order order);
}
