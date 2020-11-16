package com.zdz.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.zdz.domain.User;

import com.zdz.service.UserService;
import com.zdz.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * 帐户web
 */
@Controller
@RequestMapping("/reg")
public class RegisterController {
    //自动注入
//    @Autowired
    @Resource(name = "userService")
    private UserServiceImpl userService;


    /**
     * 用户注册 ajax请求传递参数
     *
     * @param user
     * @return
     */
    @RequestMapping("/register")
    public @ResponseBody
    String register(@ModelAttribute("registerUser") User user) {
//        System.out.println(user);
        boolean registerUser = userService.register(user);
        System.out.println(user);
        Map<String, String> registerMsg = new HashMap<>();
        registerMsg.put("registerMsg", "注册成功!");
        ObjectMapper mapper = new ObjectMapper();
        String jsonData = null;
        try {
            jsonData = mapper.writeValueAsString(registerMsg);//将map转为json返回ajax
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
//        System.out.println(jsonData);
        return jsonData;
    }

    /**
     * /注册前先执行  该函数必须单独和其关联函数一个controller\
     * 否则会造成其他函数执行时的错误
     * 此处只是先为用户注册添加日期信息
     * ajax请求传递参数
     *
     * @param registerUser
     * @param map
     */

    @ModelAttribute
    public void register_(@RequestBody User registerUser, Map<String, User> map) {
//        System.out.println(registerUser);
        registerUser.setRegisterDate(new Date());
        map.put("registerUser", registerUser);//将user存进map 在register中取出来
    }

}
