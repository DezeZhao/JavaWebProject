package com.zdz.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.zdz.domain.Goods;
import com.zdz.domain.User;
import com.zdz.service.impl.GoodsServiceImpl;
import com.zdz.service.impl.UserServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {
    @Resource(name = "userService")
    private UserServiceImpl userService;

    /**
     * 登录操作 ajax传递数据
     *
     * @param user
     * @param response
     * @return
     */
    @RequestMapping("/login")
    public @ResponseBody
    User login(@RequestBody User user, HttpServletResponse response) {
        User loginUser = userService.login(user);
        System.out.println(loginUser);
        if (loginUser != null) {
            Cookie userCookie = new Cookie("loginUser", loginUser.getUsername());
            //将登录用户名存储在cookie中
            userCookie.setPath("/");
            response.addCookie(userCookie);
            return loginUser;
        } else {//继续输入
            return null;
        }
//        map.put("tttt",8888);//ajax提交--客户端页面不可接受到存储在map中的数据
//        model.addAttribute("tttt",7777);//ajax提交--客户端页面不可接受到存储在model中的数据
//        request.setAttribute("tttt",9999);//ajax提交--客户端页面不可接受到存储在request中的数据
//        request.getSession().setAttribute("tttt",11111);//ajax提交--客户端页面可接受到存储在session中的数据
    }

    /**
     * 记住登录用户
     *
     * @param remember
     * @param response
     */
    @RequestMapping("/rememberme")
    public void rememberme(@RequestBody String remember, HttpServletResponse response) {
        System.out.println(remember);
        System.out.println(remember);
    }

    /**
     * 注册时检测用户名是否存在
     *
     * @param username
     * @return
     */
    @RequestMapping("/checkExists")
    public @ResponseBody
    String checkExists(@RequestParam String username) {
//        System.out.println(username);
        //requestBody requestParam 此处不同  前者传过来的是对象 后者传过来的是json的值
        List<User> userList = userService.checkExists(username);
        Map<String, Boolean> registerMsg = new HashMap<>();
        ObjectMapper mapper = new ObjectMapper();
        String jsonData = null;
        if (userList.size() == 1) {//用户已存在
            registerMsg.put("valid", false);
            try {
                jsonData = mapper.writeValueAsString(registerMsg);//将map转为json返回ajax
            } catch (JsonProcessingException e) {
                e.printStackTrace();
            }
        } else {//用户不存在
            registerMsg.put("valid", true);
            try {
                jsonData = mapper.writeValueAsString(registerMsg);//将map转为json返回ajax
            } catch (JsonProcessingException e) {
                e.printStackTrace();
            }
        }
//        System.out.println(jsonData);
        return jsonData;
    }

    @RequestMapping("/logout")
    public void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Cookie cookies[] = request.getCookies();

        for (Cookie cookie : cookies) {

            cookie.setMaxAge(0);

            cookie.setPath("/");

            response.addCookie(cookie);

        }
        request.getSession().invalidate();//清除会话
        response.sendRedirect(request.getContextPath() + "/index.jsp");
    }
}
