package com.zdz.controller;

import com.zdz.domain.Goods;
import com.zdz.service.GoodsService;
import com.zdz.service.impl.GoodsServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/goods")
@SessionAttributes(value = {"goodsList", "goodsdetail"})//存入session
public class GoodsController {
    @Resource(name = "goodsService")
    private GoodsServiceImpl goodsService;

    @RequestMapping("/loadGoods")
    public void loadGoods(Model model, HttpServletRequest request, HttpServletResponse response) {
        List<Goods> goodsList = goodsService.findAll();
        model.addAttribute("goodsList", goodsList);//存入request 但是转发是两次请求 故在页面接收不到request中的值
//        return "redirect:/index.jsp";  //关键字重定向
        try {
            response.sendRedirect(request.getContextPath() + "/index.jsp");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/viewGoodsDetail")
    public String viewGoodsDetail(Integer gid, Model model) {
        Goods goods = goodsService.findGoodsById(gid);
        model.addAttribute("goodsdetail", goods);
        return "goodsdetail";
    }


}
