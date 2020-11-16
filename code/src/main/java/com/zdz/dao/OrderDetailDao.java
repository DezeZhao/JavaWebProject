package com.zdz.dao;

import com.zdz.domain.OrderDetail;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("orderDetailDao")
public interface OrderDetailDao {
    /**
     * 由订单信息表的id得到订单的详细信息
     *
     * @param oid 订单明细项编号
     * @return 订单明细集合
     */
    @Select("select * from order_detail where oid=#{oid}")
    public List<OrderDetail> findOrderDetailByOid(int oid);

    /**
     * 查看订单明细
     *
     * @param orderDetail 订单明细项
     */
    @Update("insert into order_detail(oid,gid,quantity) values(#{oid},#{gid},#{quantity})")
    public void addOrderDetailItem(OrderDetail orderDetail);
}
