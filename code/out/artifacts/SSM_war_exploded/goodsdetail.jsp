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

    <title>喵购网-商品详细信息</title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script type=text/javascript src="js/my/goodsdetail.js"></script>
    <link rel="stylesheet" href="css/my/goodsdetail.css"/>

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
    <script type="text/javascript" src="js/my/goodsdetail.js"></script>

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
                            <li class="dropdown">
                                <a data-toggle="dropdown" href="cart.jsp">
                                    <span class="fa fa-shopping-cart"></span>
                                    <span>购物车</span>
                                    <strong>12</strong>
                                </a>
                            </li>
                            <li class="dropdown" href="#">
                                <a data-toggle="dropdown">
                                    <span class="fa fa-star"></span>
                                    <span>收藏夹</span>
                                    <strong>13</strong>
                                </a>
                            </li>
                            <li class="dropdown" href="#">
                                <a data-toggle="dropdown">
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
                    <!-- 定义汉堡按钮 -->
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                            data-target="#bs-example-navbar-collapse-2" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#" style="color: white;font-weight: 700;font-size: 26px;">商品详细信息</a>
                </div>
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-2">
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

            </div>
        </nav>
    </div>
</header>

<div class="container" style="padding-top: 10px">
    <div class="row" id="detail">
        <div class="col-md-5">
            <!--            <div class="product-detail-img">-->
            <div class="box">
                <div class="productImg-smallBox">
                    <img src="product_images/${goodsdetail.picture}" class="small" class="img-responsive"/>
                    <div class="mask"></div>
                </div>
                <div class="productImg-bigBox">
                    <img src="product_images/${goodsdetail.picture}"
                         class="big"></div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="product-small-img">

                        <img src="product_images/${goodsdetail.picture}"/>

                        <img src="product_small_images/${goodsdetail.img2}"/>

                        <img src="product_small_images/${goodsdetail.img3}"/>

                        <img src="product_small_images/${goodsdetail.img4}"/>

                    </div>
                </div>
            </div>
            <div class="product-collect-share">
                <a href=""> <i class="fa fa-share-square-o"> 分享</i></a>&nbsp;
                <a href=""><i class="fa fa-star-o"> 收藏</i></a>&nbsp;
                <a href=""> <i class="fa fa-bars">李宁官方旗舰店 </i></a>&nbsp;
            </div>
        </div>
        <div class="col-md-5" id="details-other">
            <div class="product-detail-intro">
                <span>${goodsdetail.description}
                </span>
            </div>
            <div class="product-detail-item">
                选购商品&nbsp;
                <span>${goodsdetail.name}</span>
            </div>
            <div class="product-detail-item">
                商品编号&nbsp;
                <span>${goodsdetail.code}</span>
            </div>
            <div class="product-detail-price">
                销售价格&nbsp;
                <span>￥</span>
                <span id="singleprice">${goodsdetail.price}</span>
            </div>
            <div class="product-detail-item">
                库存数量&nbsp;
                <span>${goodsdetail.inventory}</span>
            </div>
            <div class="product-detail-item">
                选购数量&nbsp;
                <span>
                    <div style="display: table-cell;vertical-align: middle;">
                        <div class="input-group" style="text-align: left">
                            <a class="input-group-addon minus">
                                <span class="glyphicon glyphicon-minus minus"></span>
                            </a>
                            <input name="qty" style="text-align: center;width: 45px;z-index: -1;" type="text"
                                   class="form-control"
                                   value="1"/>
                            <a class="input-group-addon plus">
                                <span class="glyphicon glyphicon-plus plus"></span>
                            </a>
                        </div>
                    </div>
                </span>
            </div>
            <div class="product-detail-price">
                小计金额&nbsp;
                <span>￥</span>
                <span id="totalprice">${goodsdetail.price}</span>
            </div>
            <div style="padding-left: 40px;padding-right: 40px;margin-top: 80px">
                <a class="btn btn-lg btn-primary" href="cart/addToCart?gid=${goodsdetail.id}" role="button"
                   style="width: 150px">加入购物车</a>
                <a class="btn btn-lg btn-danger" href="#"
                   role="button" style="float: right;width: 150px">立即购买</a>
            </div>
        </div>
        <div class="col-md-2">
            <table class="leader-board-table">
                <tr>
                    <th colspan="2" class="table-head">浏览排行榜</th>
                </tr>
                <s:iterator id="browsePiItem" value="#session.browsePiList" status="status">
                    <s:if test="#status.index>=0 && #status.index<=6">
                        <tr class="table-row">
                            <td class="picture-td"><a href=""><img class="browse-pic"
                                                                   src="product_images/Adidas.jpg"/></a></td>
                            <td class="name-td"><a href="">阿迪达斯</a></td>
                        </tr>
                        <tr class="table-row">
                            <td class="picture-td"><a href=""><img class="browse-pic"
                                                                   src="product_images/Adidas.jpg"/></a></td>
                            <td class="name-td"><a href="">阿迪达斯</a></td>
                        </tr>
                        <tr class="table-row">
                            <td class="picture-td"><a href=""><img class="browse-pic"
                                                                   src="product_images/Adidas.jpg"/></a></td>
                            <td class="name-td"><a href="">阿迪达斯</a></td>
                        </tr>
                    </s:if>
                </s:iterator>
            </table>
        </div>
    </div>


</div>
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