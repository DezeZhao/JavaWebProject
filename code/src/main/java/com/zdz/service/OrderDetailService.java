package com.zdz.service;

import com.zdz.domain.OrderDetail;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface OrderDetailService {
    /**
     * 由订单信息表的id得到订单的详细信息
     *
     * @param oid 订单明细项编号
     * @return 订单明细集合
     */
    public List<OrderDetail> findOrderDetailByOid(int oid);

    /**
     * 查看订单明细
     *
     * @param orderDetail 订单明细项
     */

    public void addOrderDetailItem(OrderDetail orderDetail);
}
