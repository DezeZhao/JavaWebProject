package com.zdz.service.impl;

import com.zdz.dao.OrderDao;
import com.zdz.domain.Order;
import com.zdz.service.OrderService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("orderService")
public class OrderServiceImpl implements OrderService {
    @Resource(name = "orderDao")
    private OrderDao orderDao;

    @Override
    public List<Order> findOrderByUid(int uid) {
        return orderDao.findOrderByUid(uid);
    }

    @Override
    public Order findLastOrder() {
        return orderDao.findLastOrder();
    }

    @Override
    public void deleteOrderById(int oid) {
        orderDao.deleteOrderById(oid);
    }

    @Override
    public void addOrder(Order order) {
        orderDao.addOrder(order);
    }


}
