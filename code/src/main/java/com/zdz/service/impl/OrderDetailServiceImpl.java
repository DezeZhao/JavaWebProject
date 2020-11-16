package com.zdz.service.impl;

import com.zdz.dao.OrderDetailDao;
import com.zdz.domain.OrderDetail;
import com.zdz.service.OrderDetailService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("orderDetailService")
public class OrderDetailServiceImpl implements OrderDetailService {
    @Resource(name = "orderDetailDao")
    private OrderDetailDao orderDetailDao;

    @Override
    public List<OrderDetail> findOrderDetailByOid(int oid) {
        return orderDetailDao.findOrderDetailByOid(oid);
    }

    @Override
    public void addOrderDetailItem(OrderDetail orderDetail) {
        orderDetailDao.addOrderDetailItem(orderDetail);
    }
}
