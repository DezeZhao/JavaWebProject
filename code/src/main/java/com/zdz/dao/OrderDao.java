package com.zdz.dao;

import com.zdz.domain.Order;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("orderDao")
public interface OrderDao {
    /**
     * 获取指定用户的订单
     *
     * @param uid
     * @return
     */
    @Select("select * from order_ where uid = #{uid}")
    public List<Order> findOrderByUid(int uid);

    /**
     * 查找最后一次插入的订单项
     *
     * @return
     */
    @Select("select * from order_ where id in (select max(id) from order_)")
    public Order findLastOrder();

    /**
     * 删除订单
     *
     * @param oid
     */
    @Update("delete from order_ where id=#{oid}")
    public void deleteOrderById(int oid);


    @Update("insert into order_(uid,time,price,status_) values(#{uid},#{time},#{price},#{status})")
    public void addOrder(Order order);
}
