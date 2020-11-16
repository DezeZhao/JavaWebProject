package com.zdz.controller;

import com.fasterxml.jackson.core.util.InternCache;
import com.zdz.domain.*;
import com.zdz.service.impl.GoodsServiceImpl;
import com.zdz.service.impl.OrderDetailServiceImpl;
import com.zdz.service.impl.OrderServiceImpl;
import com.zdz.service.impl.UserServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/order")
@SessionAttributes(value = {"orderDetailItemList", "orderMap"})
public class OrderController {
    @Resource(name = "orderDetailService")
    private OrderDetailServiceImpl orderDetailService;

    @Resource(name = "orderService")
    private OrderServiceImpl orderService;

    @Resource(name = "userService")
    private UserServiceImpl userService;

    @Resource(name = "goodsService")
    private GoodsServiceImpl goodsService;

    @RequestMapping("/addOrder")
    public void addOrder(String username, HttpServletRequest request, HttpServletResponse response) throws IOException {
        System.out.println(username);
        Order order = new Order();
        //取得当前系统时间
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        order.setTime(simpleDateFormat.format(new Date()));
        List<User> userList = userService.checkExists(username);//其实为1
        order.setUser(userList.get(0));
        order.setUid(userList.get(0).getId());
        order.setPrice((Double) request.getSession().getAttribute("totalPrice"));
        order.setStatus("未处理");
        orderService.addOrder(order);
        Map shopcart = (Map) request.getSession().getAttribute("shopcart");//获得购物车
        Iterator it = shopcart.keySet().iterator();
        Order order1 = orderService.findLastOrder();
        System.out.println(order1.getId());
        try {
            while (it.hasNext()) {
                Object key = it.next();
                CartItem cartItem = (CartItem) shopcart.get(key);
                //设置订单明细
                OrderDetail orderDetail = new OrderDetail();
                orderDetail.setGoods(cartItem.getGoods());
                orderDetail.setGid(orderDetail.getGoods().getId());
                orderDetail.setOrder(order1);
                orderDetail.setOid(order1.getId());
                orderDetail.setQuantity(cartItem.getQuantity());
                //添加订单明细项
                orderDetailService.addOrderDetailItem(orderDetail);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        //已经生成订单，所以删除购物车
        request.getSession().removeAttribute("shopcart");
//        return "index";
        response.sendRedirect(request.getContextPath() + "/index.jsp");
    }

    @RequestMapping("/toMyOrder")
    public String toMyOrder(String username, Model model) {
        //获取指定用户的订单列表
        List<User> userList = userService.checkExists(username);//其实为1
        List<Order> orderList = orderService.findOrderByUid(userList.get(0).getId());
        Map orderMap = new HashMap();
        for (Order order : orderList) {
            orderMap.put(order.getId(), order);
        }
        model.addAttribute("orderMap", orderMap);
        return "order";
    }

    @RequestMapping("/toOrderDetail")
    public String toOrderDetail(Integer oid, Model model) {
        List<OrderDetail> orderDetailList = orderDetailService.findOrderDetailByOid(oid);
        List<OrderDetailItem> orderDetailItemList = new ArrayList<OrderDetailItem>();
        for (OrderDetail orderDetail : orderDetailList) {
            Goods goods = goodsService.findGoodsById(orderDetail.getGid());
            OrderDetailItem orderDetailItem = new OrderDetailItem(
                    goods.getId(), goods.getCode(), goods.getPicture(), goods.getDescription(), goods.getPrice(), orderDetail.getQuantity()
            );

            orderDetailItemList.add(orderDetailItem);
        }
        model.addAttribute("orderDetailItemList", orderDetailItemList);
        return "orderdetail";
    }

    @RequestMapping("/deleteOrder")
    public String deleteOrder(Integer oid, HttpServletRequest request) {
        orderService.deleteOrderById(oid);
        Map orderMap = (Map) request.getSession().getAttribute("orderMap");
        orderMap.remove(oid);
        return "order";
    }
}
