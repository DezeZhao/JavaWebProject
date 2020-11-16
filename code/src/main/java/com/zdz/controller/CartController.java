package com.zdz.controller;

import com.zdz.domain.CartItem;
import com.zdz.domain.Goods;
import com.zdz.service.impl.GoodsServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/cart")
@SessionAttributes(value = {"shopcart"})
public class CartController {

    @Resource(name = "goodsService")
    private GoodsServiceImpl goodsService;

    @RequestMapping("/addToCart")
    public String addToCart(Integer gid, HttpServletRequest request, Model model) {
        System.out.println(gid);
        Map shopcart = (Map) request.getSession().getAttribute("shopcart");
        Goods goods = goodsService.findGoodsById(gid);//通过商品id 获取商品
//        System.out.println(goods);
        if (shopcart == null) {//如果购物车不存在，则创建购物，并存入到session中
            shopcart = new HashMap();
            model.addAttribute("shopcart", shopcart);
        }
        //如果存在购物车则判断要添加的商品是否已在购物车
        CartItem cartItem = (CartItem) shopcart.get(goods.getId());
//        cartItem.setGoods(goods);
//        System.out.println(cartItem);
        if (cartItem != null) {//商品已在购物车 则更新其数量即可
            cartItem.setQuantity(cartItem.getQuantity() + 1);
        } else {//创建一个商品项进入购物车
            CartItem newCartItem = new CartItem(goods, 1);
            shopcart.put(goods.getId(), newCartItem);
        }
//        System.out.println(shopcart);

        return "cart";
    }

    @RequestMapping("/updateGoodsQuantity")
    public String updateGoodsQuantity(Integer gid, Integer quantity, HttpServletRequest request) {
        Map shopcart = (Map) request.getSession().getAttribute("shopcart");
        Goods goods = goodsService.findGoodsById(gid);//通过商品id 获取商品
        CartItem cartItem = (CartItem) shopcart.get(goods.getId());
        cartItem.setQuantity(quantity);
        return "cart";
    }

    @RequestMapping("/deleteCartItem")
    public String deleteCartItem(Integer gid, HttpServletRequest request) {
        Map shopcart = (Map) request.getSession().getAttribute("shopcart");
        shopcart.remove(gid);
        return "cart";
    }

    @RequestMapping("/clearShopcart")
    public String clearShopcart(HttpServletRequest request) {
        Map shopcart = (Map) request.getSession().getAttribute("shopcart");
        shopcart.clear();
        return "cart";
    }
}
