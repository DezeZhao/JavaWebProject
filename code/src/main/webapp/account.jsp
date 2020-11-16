<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML>
<html>
<head>
    <base href="<%=basePath%>">

    <title>喵购网-我的喵购账户</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/my/reset.css"/>
    <link rel="stylesheet" href="css/vendor/font-awesome.min.css"/>
    <link rel="stylesheet" href="css/my/common.css"/>
    <link rel="stylesheet" href="css/my/account.css"/>
</head>

<body>
<!--scroll-head-->
<div class="scroll-head"></div>
<!--top-->
<div class="top-wrapper">
    <div class="top-info">
        <div class="top-left">
            <div data-toggle="arrowdown" id="arrow2" class="msg-info">
                <i class="fa fa-envelope fa-gray"></i>
                <a href="">消息</a>
            </div>
            <div data-toggle="arrowdown" id="arrow4" class="user-name">
                <i class="fa fa-bookmark fa-gray"></i>
                <a href="list">网站首页</a>
            </div>
            <div data-toggle="arrowdown" id="arrow4" class="user-name">
                <i class="fa fa-pencil fa-gray"></i>
                <a href="register.jsp">注册</a>
            </div>
            <div data-toggle="arrowdown" id="arrow4" class="user-name">
                <i class="fa fa-user fa-gray"></i>
                <a href="login.jsp">登录</a>
            </div>
        </div>
        <!--top-right-->
        <div class="top-right">
            <div data-toggle="arrowdown" id="arrow3" class="user-name">
                <i class="fa fa-user fa-orange"></i>
                <a href="account.jsp">我的喵购</a>
            </div>
            <div data-toggle="arrowdown" id="arrow4" class="user-name">
                <i class="fa fa-shopping-cart fa-orange"></i>
                <a href="WEB-INF/pages/staticpage/cart1.html">购物车</a>
            </div>
            <div data-toggle="arrowdown" id="arrow5" class="user-name">
                <i class="fa fa-star fa-orange"></i>
                <a href="">收藏夹</a>
            </div>
            <div data-toggle="arrowdown" id="arrow5" class="user-name">
                <i class="fa fa-list fa-orange"></i>
                <a href="toMyOrderInfo">我的订单</a>
            </div>
            <span class="vertical-line">|</span>

            <div data-toggle="arrowdown" id="arrow7" class="user-name">
                <i class="fa fa-list-ul fa-orange"></i>
                <a href="">网站导航</a>
            </div>
        </div>
    </div>
</div>
<div class="account-top-scroll">
    <div class="account-title">
        <ul>
            <li>我的账户</li>
        </ul>
    </div>
    <div class="account-nav">
        <ul>
            <li>首页</li>
            <li>账户设置</li>
            <li>消息</li>
        </ul>
    </div>
    <div class="account-search">
        <div style="margin-left: 60px;margin-top:15px;">
            <input type="text"/>
            <div class="search-btn"><a href="">搜索</a></div>
        </div>
    </div>
</div>
<div class="account-content">
    <div class="account-content-leftbar">
        <div class="account-photo">
            <a href="account.jsp"><img src="images/user-head.jpg" style="height:100px;width:100px;"/></a>
        </div>
        <div style="margin-top: 20px; margin-left: 150px; width:200px;height:2px;border-style:solid none;border-color:gainsboro;border-width:2px;"></div>
        <div class="account-content-list">
            <ul>
                <li><a href="account.jsp">个人资料</a></li>
                <li><a href="">安全信息</a></li>
                <li><a href="toMyOrderInfo">我的订单</a></li>
                <li><a href="WEB-INF/pages/staticpage/cart1.html">我的购物车</a></li>
                <li><a href="">个人成长信息</a></li>
                <li><a href="">支付宝绑定设置</a></li>
                <li><a href="">微博绑定设置</a></li>
                <li><a href="">个人交易信息</a></li>
                <li><a href="">收货地址</a></li>
            </ul>
        </div>
    </div>
    <div class="account-content-rightbar">
        <hr class="left-right-div">
        <div class="right-top">
            <li>个人资料</li>
        </div>
        <div class="right-bottom">
            <ul>
                <li><h2>亲爱的 <font color="#FF0000">${sessionScope.CURRENT_USER.userName }</font>, 填写正确的资料有助于好友找到您哦！</h2>
                </li>
                <li>用户名: ${sessionScope.CURRENT_USER.userName }</li>
                <li>性别: ${sessionScope.CURRENT_USER.sex }</li>
                <li>真实姓名: ${sessionScope.CURRENT_USER.realName }</li>
                <li>家庭住址: ${sessionScope.CURRENT_USER.address }</li>
                <li>电子邮件: ${sessionScope.CURRENT_USER.email }</li>
                <li>注册日期: ${sessionScope.CURRENT_USER.regDate }</li>
                <li>收货地址: 上海市嘉定区曹安公路4800号同济大学嘉定校区</li>
            </ul>
        </div>
    </div>
</div>

<!--尾部开始-->
<div class="end">地址：上海市嘉定区曹安公路4800号同济大学<br>
    电话：6958-88888888&nbsp; 邮箱：zhaodeze@miaogou.com &nbsp;邮编：100100<br>
    版权所有:上海喵购电商责任有限公司&nbsp;　技术支持：17717078595
</div>
<!--尾部结束-->
<script type="text/javascript" src="js/vendor/jquery.min.js"></script>
<script type="text/javascript" src="js/my/common.js"></script>
</body>
</html>
      