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

    <title>喵购网 - 我的订单</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="css/vendor/sweetalert2.min.css">
    <link rel="stylesheet" href="css/vendor/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/vendor/animate.min.css"/>
    <link rel="stylesheet" href="css/vendor/bootstrapValidator.css"/>
    <link rel="stylesheet" href="css/vendor/font-awesome.min.css"/>

    <script type="text/javascript" src="js/vendor/jquery.min.js"></script>
    <script type="text/javascript" src="js/vendor/popper.min.js"></script>
    <script type="text/javascript" src="js/vendor/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/vendor/bootstrapValidator.min.js"></script>
    <script type="text/javascript" src="js/vendor/jquery.serializejson.min.js"></script>
    <script type="text/javascript" src="js/vendor/bootbox.min.js"></script>
    <script type="text/javascript" src="js/vendor/bootbox.locales.min.js"></script>
    <script type="text/javascript" src="js/vendor/sweetalert2.min.js"></script>
    <script type="text/javascript" src="js/vendor/jquery.cookie.js"></script>
    <script type="text/javascript" src="js/vendor/jquery.cxselect.min.js"></script>
    <script type="text/javascript" src="js/my/login.js"></script>
    <script type="text/javascript" src="js/my/register.js"></script>
    <script type="text/javascript" src="js/my/order.js"></script>

    <link rel="stylesheet" href="css/my/custom.css"/>

</head>

<body>

<!-- 1.页眉部分-->
<header class="container-fluid">
    <!--导航栏-->
    <div class="row">
        <nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <!-- 定义汉堡按钮 -->
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                            data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">首页</a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse " id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav ">
                        <!--
                        <li class="active"><a href="index.jsp">主页
                            <span class="sr-only">(current)</span>
                        </a></li>-->
                        <!-- <li><a data-toggle="modal" data-target="#modal_register">免费注册</a></li>
                         <li><a data-toggle="modal" data-target="#modal_login">登录</a></li>-->
                    </ul>
                    <div style="float:right;">
                        <ul class="nav navbar-nav">
                            <!--   <li><a>欢迎光临！</a></li>-->
                            <li><a href="#">我的喵购</a></li>
                            <li>
                                <a href="cart.jsp">
                                    <span class="fa fa-shopping-cart"></span>
                                    <span>购物车</span>
                                    <strong>12</strong>
                                </a>
                            </li>
                            <li href="#">
                                <a data-toggle="dropdown">
                                    <span class="fa fa-star"></span>
                                    <span>收藏夹</span>
                                    <strong>13</strong>
                                </a>
                            </li>
                            <li href="#">
                                <a data-toggle="dropdown">
                                    <span class="fa fa-phone"></span>
                                    <span>联系我们</span>
                                </a>
                            </li>
                            <li>
                                <a href="#" data-toggle="dropdown">更多&nbsp;<span class="caret"></span>
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">用户中心</a></li>
                                    <li><a href="order/toMyOrder?username=${cookie.get("loginUser").value}">我的订单</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </div><!-- /.navbar-collapse -->
        </nav>
    </div>

    <div class="row" id="mycart" style="margin-top: 70px; ">
        <nav class="navbar navbar-default">
            <div class="container">
                <div class="navbar-header" style="padding-left: 140px;">
                    <a class="navbar-brand" style="color: white;font-weight: 700;font-size: 26px;">我的订单</a>
                </div>
                <ul class="nav navbar-nav" style="float: right;margin-right: 140px">
                    <form class="navbar-form navbar-left">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="搜索订单"/>
                            <span class="input-group-btn">
                                <button class="btn btn-primary" type="button">搜索</button>
                            </span>
                        </div>
                    </form>
                </ul>
            </div>
        </nav>
    </div>
</header>
<!--主体部分-->
<div class="container" style="margin-top: 10px">
    <table id="cartTable" class="cart table table-condensed">
        <thead>
        <tr>
            <th style="width:60px;"><label><input class="check-all check" type="checkbox"/>&nbsp;全选</label></th>
            <th style="text-align: center"><label>下单时间</label></th>
            <th style="width:150px;text-align: center"><label>实付款</label></th>
            <th style="width:150px;text-align: center"><label>交易状态</label></th><!--可查看订单详情-->
            <th style="width:150px;text-align: center"><label>交易操作</label></th>
        </tr>
        </thead>
        <tbody>
        <c:if test="${not empty requestScope.orderMap}">
            <c:forEach items="${orderMap}" var="order">
                <tr>
                    <td style="display: table-cell;vertical-align: middle;text-align: center">
                        <input class="check-one check" type="checkbox"/></td>
                    <td style="display: table-cell;vertical-align: middle;text-align: center">${order.value.time}
                    </td>
                    <td style="display: table-cell;vertical-align: middle;text-align: center;color: #ac2925;font-weight:700">
                        ￥
                        <span class="subtotal">${order.value.price}</span>
                    </td>
                    <td style="display: table-cell;vertical-align: middle; text-align: center">
                        <a class="label label-danger" href="#">未处理</a><br>
                        <a class="label label-info" href="order/toOrderDetail?oid=${order.value.id}">订单详情</a><br>
                        <a class="label label-warning" href="#">查看物流</a><br>
                        <a class="label label-primary" href="#">待确认收货</a><br>
                    </td>
                    <td style="display: table-cell;vertical-align: middle;text-align: center">
                        <a href="order/deleteOrder?oid=${order.value.id}" class="delete btn btn-danger">删除订单</a>
                    </td>
                </tr>
            </c:forEach>
        </c:if>

        </tbody>
    </table>
    <div class="noorders" id="blank"
         style="justify-content: center;align-items: center;font-weight: 700;height: 300px;
             font-size: 24px;color: gray;display:none;">
        您现在还没有订单哦...去
        <a href="#">主页</a>逛逛吧。
    </div>
    <div class="container-fluid" style="background: #D3D3D3;height: 40px;padding-right: 0;padding-left: 0">
        <div class="row" id="cart_bottom">
            <div class="col-md-2">
                <button class="btn btn-danger empty_btn"
                        style="width: 100%;height: 40px;border-radius: 0;font-size: 18px;font-weight: 600">
                    <span class="glyphicon glyphicon-trash"></span>
                    <span class="emptyorders" >删除所有订单</span>
                </button>
            </div>
            <div class="col-md-10 total">
                <span>合计(不含运费):</span>
                <span style="color:orangered">￥</span>
                <span id="priceTotal" style="color:orangered">0.00</span>
            </div>
            <div class="pull-right selected" id="selected">
                <span id="selectedTotal"></span>
            </div>

        </div>
    </div>

</div>
<div style="height: 100px"></div>
<!-- 3.页脚部分-->
<footer class="container-fluid">
    <div class="row">
        <img src="../../../img/footer_service.png" class="img-responsive">
    </div>
    <div class="row company">
        上海喵购电商责任有限公司 版权所有Copyright 2006-2018, All Rights Reserved 苏ICP备16007882
    </div>
</footer>

</body>
</html>