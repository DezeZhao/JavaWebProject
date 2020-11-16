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
    <title>喵购网 - 订单详情</title>
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
                                <a>
                                    <span class="fa fa-star"></span>
                                    <span>收藏夹</span>
                                    <strong>13</strong>
                                </a>
                            </li>
                            <li href="#">
                                <a>
                                    <span class="fa fa-phone"></span>
                                    <span>联系我们</span>
                                </a>
                            </li>
                            <li class="dropdown">
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
                    <a class="navbar-brand" href="#" style="color: white;font-weight: 700;font-size: 26px;">订单详情</a>
                </div>
                <ul class="nav navbar-nav" style="float: right;margin-right: 140px">
                    <form class="navbar-form navbar-left">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="搜索商品"/>
                            <span class="input-group-btn">
                                <button class="btn btn-primary search-btn" type="button">搜索</button>
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
            <th style="width:100px;text-align: center"><label>编号</label></th>
            <th style="text-align: center"></th>
            <th style="text-align: center"><label>宝贝描述</label></th>
            <th style="width:100px;text-align: center"><label>单价</label></th>
            <th style="width:120px;text-align: center"><label>数量</label></th>
            <th style="width:100px;text-align: center"><label>小计(元)</label></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${sessionScope.orderDetailItemList}" var="orderDetailItem">
            <tr>
                <td style="display: table-cell;vertical-align: middle;text-align: center">${orderDetailItem.code}
                </td>
                <td style="display: table-cell;vertical-align: middle;text-align: center">
                    <a href="goods/viewGoodsDetail?gid=${orderDetailItem.gid}">
                        <img src="product_images/${orderDetailItem.picture}" style="width: 80px;height: 80px">
                    </a>
                </td>
                <td style="display: table-cell;vertical-align: middle;">
                    <a href="goods/viewGoodsDetail?gid=${orderDetailItem.gid}">${orderDetailItem.description}</a>
                </td>
                <td style="display: table-cell;vertical-align: middle;text-align: center;color: #d9534f;font-weight: 700">
                    ￥
                    <span class="singleprice">${orderDetailItem.price}</span>
                </td>
                <td style="display: table-cell;vertical-align: middle; text-align: center">${orderDetailItem.quantity}</td>
                <td style="display: table-cell;vertical-align: middle;text-align: center;color: #ac2925;font-weight:700">
                    ￥
                    <span class="subtotal">${orderDetailItem.quantity*orderDetailItem.price}</span>
                </td>

            </tr>
        </c:forEach>

        </tbody>
    </table>

</div>
<div style="height: 100px"></div>
<!-- 3.页脚部分-->
<footer class="container-fluid">
    <div class="row">
        <img src="img/footer_service.png" class="img-responsive">
    </div>
    <div class="row company">
        上海喵购电商责任有限公司 版权所有Copyright 2006-2020, All Rights Reserved 苏ICP备16007882
    </div>
</footer>

</body>
</html>
