<%@ page import="com.zdz.domain.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>喵购网 - 首页</title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>BootstrapValidator demo</title>

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
    <script type="text/javascript">
        function prompt() {
            Swal.fire({
                title: '请先登录！',
                icon: 'warning',
                customClass: "sweetAlert_self",
                // animation: 'slide-from-top',
                position: 'top', //定位 左上角
                toast: true,
                showConfirmButton: false,
                timer: 1500
            })
        }
    </script>
</head>
<body>

<!-- 模态框（Modal）登录 -->
<div class="modal fade" id="modal_login" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" style="width: 560px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="loginModalLabel"
                    style="text-align: center;font-weight: bolder;font-size: 30px">
                    登录
                </h4>
            </div>

            <form id="loginForm" class="m-t" role="form" action="user/login" method="post">

                <div class="modal-body" style="display:inline-block;height: auto">
                    <div class="form-group">
                        <div class="input-group" style="text-align: left">
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-user"></span>
                            </span>
                            <input type="text" name="username" class="form-control" placeholder="用户名" required="">
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="input-group" style="text-align: left">
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-lock"></span>
                            </span>
                            <input type="password" name="password" class="form-control" placeholder="密码" required="">
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" name="remember" id="rememberme"/> 记住我
                            </label>
                            <label style="position: relative;float: right;">
                                <a>忘记密码?</a>
                            </label>
                        </div>
                    </div>

                    <div class="form-group" style="position: relative;float: left;">
                        <div class="input-group" style="text-align: left; width: 260px;height:40px;">
                            <span class="input-group-addon" id="captcha">
                                <span class="glyphicon glyphicon-check "></span>
                            </span>
                            <input type="tel" class="form-control" name="captcha" placeholder="请输入图形验证码"
                                   style="width:220px;height:40px;"/>
                        </div>
                    </div>

                    <div class="form-group" style="position:relative;float: left;">
                        &nbsp; &nbsp;
                        <span>
                            <canvas id="canvas" width="120" height="43"></canvas>
                            <a id="changeImg">看不清，换一张</a>
                        </span>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" style="float: left;">
                        关闭
                    </button>
                    <input type="reset" class="btn btn-warning" value="重置" id="resetBtn">
                    <button type="submit" class="btn btn-primary" name="login" id="loginBtn">登录</button>
                </div>

            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<!--模态框 注册-->
<div class="modal fade" id="modal_register" tabindex="-1" role="dialog" aria-labelledby="registerModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" style="width: 560px ;overflow: auto">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="registerModalLabel"
                    style="text-align: center;font-weight: bolder;font-size: 30px">
                    注 册
                </h4>
            </div>

            <form id="registerForm" class="m-t" role="form" action="reg/register" method="post">
                <div class="modal-body" style="/*display:inline-block;height:auto*/ overflow-y:auto; height:360px">
                    <div class="form-group">
                        <div class="input-group" style="text-align: left">
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-user"></span>
                            </span>
                            <input type="text" name="username" class="form-control" placeholder="用户名" required="">
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="input-group" style="text-align: left">
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-lock"></span>
                            </span>
                            <input type="password" name="password" class="form-control" placeholder="密码" required="">
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="input-group" style="text-align: left">
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-lock"></span>
                            </span>
                            <input type="password" name="repassword" class="form-control" placeholder="确认密码"
                                   required="">
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="input-group" style="text-align: left">
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-envelope"></span>
                            </span>
                            <input type="email" name="email" class="form-control" placeholder="电子邮箱" required="">
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="input-group" style="text-align: left">
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-earphone"></span>
                            </span>
                            <input type="text" name="phoneNo" class="form-control" placeholder="手机号码" required="">
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="input-group" style="text-align: left">
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-user"></span>
                            </span>
                            <input type="text" name="realName" class="form-control" placeholder="真实姓名">
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="input-group" style="text-align: left">
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-user"></span>
                            </span>
                            <!--&nbsp;-->
                            <div class="btn-group" style="position: relative;float: left" data-toggle="buttons">
                                <label id="male" class="btn btn-default male_radio" style="border-radius: 0px">
                                    <input class="sex_radio" id="male_" type="radio" name="sex" value="男"/>男</label>
                                <label id="female" class="btn btn-default female_radio">
                                    <input class="sex_radio" id="female_" type="radio" name="sex" value="女"/>女</label>
                                <label id="secret" class="btn btn-default secret_radio">
                                    <input id="secret_" type="radio" name="sex"/>保密</label>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="input-group" style="text-align: left">
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-user"></span>
                            </span>
                            <select id="select_age" class="form-control" style="width:90%"
                                    name="age">
                            </select>
                        </div>
                    </div>


                    <div class="form-group" id="address">
                        <div class="input-group" id="districtInfo">
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-map-marker"></span>
                            </span>
                            <select class="province form-control" style="width:31%" id="province"
                                    name="province"></select>
                            <select class="city form-control" style="width:31%" id="city"
                                    name="city"></select>
                            <select class="area form-control" style="width:31%" id="area"
                                    name="area"></select>
                        </div>
                    </div>

                    <div class="form-group" style="position: relative;float: left;">
                        <div class="input-group" style="text-align: left; width: 260px;height:40px;">
                            <span class="input-group-addon" id="captcha_">
                                <span class="glyphicon glyphicon-check "></span>
                            </span>
                            <input type="tel" class="form-control" name="captcha" placeholder="请输入图形验证码"
                                   style="width:220px;height:40px;"/>
                        </div>
                    </div>


                    <div class="form-group" style="position:relative;float: left;">
                        &nbsp; &nbsp;
                        <span>
                            <canvas id="canvas_" width="120" height="43"></canvas>
                            <a id="changeImg_">看不清，换一张</a>
                        </span>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" style="float: left;">
                        关闭
                    </button>
                    <input type="reset" class="btn btn-warning" value="重置" id="resetBtn_">
                    <button type="submit" class="btn btn-primary" name="login" id="registerBtn">注册</button>
                </div>

            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<!-- 1.页眉部分-->
<header class="container">
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
                    <a class="navbar-brand" href="index.jsp">首页</a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->

                <div class="collapse navbar-collapse " id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav ">
                        <!--
                        <li class="active"><a href="index.jsp">主页
                            <span class="sr-only">(current)</span>
                        </a></li>-->
                        <li><a data-toggle="modal" data-target="#modal_register">免费注册</a></li>
                        <li>
                            <c:choose>
                                <c:when test="${not empty cookie.get('loginUser')}">
                                    <a style="color:#d9534f">
                                        欢迎您,${cookie.get('loginUser').value}!
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    <c:if test="${empty cookie.get('loginUser')}">
                                        <a data-toggle="modal" data-target="#modal_login">
                                            登录
                                        </a>
                                    </c:if>
                                </c:otherwise>
                            </c:choose>
                        </li>
                    </ul>
                    <div style="float: right;">
                        <ul class="nav navbar-nav">
                            <!--   <li><a>欢迎光临！</a></li>-->
                            <li><a id="loadgoods" href="goods/loadGoods">我的喵购</a></li>
                            <li>
                                <c:if test="${not empty cookie.get('loginUser')}">
                                    <a href="cart.jsp">
                                        <span class="fa fa-shopping-cart"></span>
                                        <span>购物车</span>
                                        <strong>12</strong>
                                    </a>
                                </c:if>
                                <c:if test="${empty cookie.get('loginUser')}">
                                    <a onclick="prompt()">
                                        <span class="fa fa-shopping-cart"></span>
                                        <span>购物车</span>
                                        <strong>12</strong>
                                    </a>
                                </c:if>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="fa fa-star"></span>
                                    <span>收藏夹</span>
                                    <strong>13</strong>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="fa fa-phone"></span>
                                    <span>联系我们</span>
                                </a>
                            </li>
                            <li class="dropdown">
                                <a href="#" data-toggle="dropdown">更多&nbsp;<span class="caret"></span>
                                </a>
                                <ul class="dropdown-menu">
                                    <c:if test="${not empty cookie.get('loginUser')}">
                                        <li><a href="order/toMyOrder?username=${cookie.get("loginUser").value}">我的订单</a>
                                        </li>
                                    </c:if>
                                    <c:if test="${empty cookie.get('loginUser')}">
                                        <li><a onclick="prompt()">我的订单</a>
                                        </li>
                                    </c:if>
                                    <li><a href="#">用户中心</a></li>
                                    <c:if test="${not empty cookie.get('loginUser')}">
                                        <li><a href="user/logout">登出</a></li>
                                    </c:if>
                                    <c:if test="${empty cookie.get('loginUser')}">
                                        <li><a onclick="prompt()">登出</a>
                                        </li>
                                    </c:if>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- /.navbar-collapse -->
        </nav>
    </div>

    <div class="row " style="margin-top: 60px;margin-bottom: 20px;padding-top: 15px">
        <div class="col-md-3">
            <img src="images/miaogou.png" class="img-responsive" style="width: 250px;height: 90px">
        </div>
        <div class="col-md-5 col-md-offset-1">
            <div class="input-group" style="padding-top: 25px">
                <input type="text" class="form-control search-input" placeholder="搜体育用品/品牌"/>
                <span class="input-group-btn">
                    <button class="btn btn-danger search-btn" type="button"
                            style="padding-left:5px;width: 80px;height: 40px;border-bottom-right-radius: 20px;border-top-right-radius: 20px">
                        搜索
                    </button>
                </span>
            </div>
            <div class="hot-search">
                <a href="#">
                    <span class="glyphicon glyphicon-fire">
                    </span>
                    篮球</a>
                <a href="#">
                    <span class="glyphicon glyphicon-tag">
                    </span>
                    羽毛球</a>
                <a href="#">
                    <span class="glyphicon glyphicon-heart">
                    </span>
                    健身</a>
                <a href="#">
                    <span class="glyphicon glyphicon-tag">
                    </span>
                    特步</a>
                <a href="#">
                    <span class="glyphicon glyphicon-heart">
                    </span>
                    李宁</a>
                <a href="#">
                    <span class="glyphicon glyphicon-tag">
                    </span>
                    360</a>
                <a href="#">
                    <span class="glyphicon glyphicon-fire">
                    </span>
                    尤尼克斯</a>
            </div>
        </div>
    </div>


    <div class="row" style="padding-top: 25px">
        <!--<div class="span2">
            <ul class="nav nav-pills nav-stacked">
                <li class="active"><a href="#">Home</a></li>
                <li><a href="#">Tutorials</a></li>
                <li><a href="#">Practice Editor </a></li>
                <li><a href="#">Gallery</a></li>
                <li><a href="#">Contact</a></li>
            </ul>
        </div>-->
        <!--侧边导航-->
        <div class="col-md-2">
            <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" style="text-align: center">
                        <span class="glyphicon glyphicon-tag"></span>
                        <span class="panel-title">
                            <label role="button" data-toggle="collapse"
                                   data-parent="#accordion">
                                体育运动品牌
                            </label>
                        </span>
                    </div>
                </div>
                <div class="panel panel-danger">
                    <div class="panel-heading" role="tab" id="headingOne">
                        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne"
                           aria-expanded="true" aria-controls="collapseOne"
                           style="text-decoration: none;color: white">
                            <h4 class="panel-title">
                                特步 </h4>
                        </a>

                    </div>
                    <div id="collapseOne" class="panel-collapse collapse" role="tabpanel"
                         aria-labelledby="headingOne">
                        <div class="panel-body">
                            <ul class="nav nav-pills nav-stacked">
                                <li>
                                    <a href="#">运动器材类</a>
                                </li>
                                <!--篮球 羽毛球-->
                                <li>
                                    <a href="#">运动鞋类</a>
                                </li>
                                <!--跑步鞋 休闲鞋 篮球鞋 羽毛球鞋-->
                                <li>
                                    <a href="#">运动服装类</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="panel panel-danger">
                    <div class="panel-heading" role="tab" id="headingTwo">
                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion"
                           href="#collapseTwo"
                           aria-expanded="false" aria-controls="collapseTwo"
                           style="text-decoration: none;color: white">
                            <h4 class="panel-title">
                                特步 </h4>
                        </a>
                    </div>
                    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                        <div class="panel-body">
                            <ul class="nav nav-pills nav-stacked">
                                <li>
                                    <a href="#">运动鞋类</a>
                                </li>
                                <li>
                                    <a href="#">运动服装类</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="panel panel-danger">
                    <div class="panel-heading" role="tab" id="headingThree">
                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion"
                           href="#collapseThree"
                           aria-expanded="false" aria-controls="collapseThree"
                           style="text-decoration: none;color: white">
                            <h4 class="panel-title">
                                安踏 </h4>
                        </a>

                    </div>
                    <div id="collapseThree" class="panel-collapse collapse" role="tabpanel"
                         aria-labelledby="headingThree">
                        <div class="panel-body">
                            <ul class="nav nav-pills nav-stacked">
                                <li>
                                    <a href="#">运动鞋类</a>
                                </li>
                                <li>
                                    <a href="#">运动服装类</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="panel panel-danger">
                    <div class="panel-heading" role="tab" id="headingFour">
                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion"
                           href="#collapseFour"
                           aria-expanded="false" aria-controls="collapseFour"
                           style="text-decoration: none;color: white">
                            <h4 class="panel-title">
                                乔丹 </h4>
                        </a>
                    </div>
                    <div id="collapseFour" class="panel-collapse collapse" role="tabpanel"
                         aria-labelledby="headingFour">
                        <div class="panel-body">
                            <ul class="nav nav-pills nav-stacked">
                                <li>
                                    <a href="#">运动器材类</a>
                                </li>
                                <li>
                                    <a href="#">运动鞋类</a>
                                </li>
                                <li>
                                    <a href="#">运动服装类</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="panel panel-danger">
                    <div class="panel-heading" role="tab" id="headingFive">
                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion"
                           href="#collapseFive"
                           aria-expanded="false" aria-controls="collapseFive"
                           style="text-decoration: none;color: white">
                            <h4 class="panel-title">
                                361度</h4>
                        </a>
                    </div>
                    <div id="collapseFive" class="panel-collapse collapse" role="tabpanel"
                         aria-labelledby="headingFive">
                        <div class="panel-body">
                            <ul class="nav nav-pills nav-stacked">
                                <li>
                                    <a href="#">运动鞋类</a>
                                </li>
                                <li>
                                    <a href="#">运动服装类</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="panel panel-danger">
                    <div class="panel-heading" role="tab" id="headingSix">
                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion"
                           href="#collapseSix"
                           aria-expanded="false" aria-controls="collapseSix"
                           style="text-decoration: none;color: white">
                            <h4 class="panel-title">
                                匹克 </h4>
                        </a>
                    </div>
                    <div id="collapseSix" class="panel-collapse collapse" role="tabpanel"
                         aria-labelledby="headingFive">
                        <div class="panel-body">
                            <ul class="nav nav-pills nav-stacked">
                                <li>
                                    <a href="#">运动器材类</a>
                                </li>
                                <li>
                                    <a href="#">运动鞋类</a>
                                </li>
                                <li>
                                    <a href="#">运动服装类</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!--
                                <div class="divider1"></div>-->
            </div>
        </div>
        <!--轮播图-->
        <div class="col-md-8">

            <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox">
                    <div class="item active">
                        <img src="images/lunbo1.png" style="height: 400px" alt="...">
                    </div>
                    <div class="item">
                        <img src="images/lunbo2.png" style="height: 400px" alt="...">
                    </div>
                    <div class="item">
                        <img src="images/lunbo3.png" style="height: 400px ;" alt="...">
                    </div>
                </div>

                <!-- Controls -->
                <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>

        <div class="col-md-2">
            <div class="panel-group" id="accordion1" role="tablist" aria-multiselectable="true">
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" style="text-align: center">
                        <span class="glyphicon glyphicon-tag"></span>
                        <span class="panel-title">
                            <label role="button" data-toggle="collapse"
                                   data-parent="#accordion1">
                                体育用品
                            </label>
                        </span>
                    </div>
                </div>
                <div class="panel panel-primary">
                    <div class="panel-heading" role="tab" id="headingSeven">

                        <a role="button" data-toggle="collapse" data-parent="#accordion1" href="#collapseSeven"
                           aria-expanded="true" aria-controls="collapseSeven"
                           style="text-decoration: none;color:white">
                            <h4 class="panel-title">
                                运动器材 </h4>
                        </a>

                    </div>
                    <div id="collapseSeven" class="panel-collapse collapse" role="tabpanel"
                         aria-labelledby="headingSeven">
                        <div class="panel-body">
                            <ul class="nav nav-pills nav-stacked">
                                <li>
                                    <a href="#">羽毛球(拍)</a>
                                </li>
                                <!--篮球 羽毛球-->
                                <li>
                                    <a href="#">篮球</a>
                                </li>
                                <!--跑步鞋 休闲鞋 篮球鞋 羽毛球鞋-->
                                <li>
                                    <a href="#">健身器材</a>
                                </li>
                                <li>
                                    <a href="#">乒乓球(拍)</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="panel panel-primary">
                    <div class="panel-heading" role="tab" id="headingEight">
                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion1"
                           href="#collapseEight"
                           aria-expanded="false" aria-controls="collapseEight"
                           style="text-decoration: none;color: white">
                            <h4 class="panel-title">
                                运动鞋</h4>
                        </a>
                    </div>
                    <div id="collapseEight" class="panel-collapse collapse" role="tabpanel"
                         aria-labelledby="headingEight">
                        <div class="panel-body">
                            <ul class="nav nav-pills nav-stacked">
                                <li>
                                    <a href="#">跑步鞋</a>
                                </li>
                                <li>
                                    <a href="#">篮球鞋</a>
                                </li>
                                <li>
                                    <a href="#">羽毛球鞋</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="panel panel-primary">
                    <div class="panel-heading" role="tab" id="headingNine">
                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion1"
                           href="#collapseNine"
                           aria-expanded="false" aria-controls="collapseNine"
                           style="text-decoration: none;color:white">
                            <h4 class="panel-title">
                                运动服装</h4>
                        </a>
                    </div>
                    <div id="collapseNine" class="panel-collapse collapse" role="tabpanel"
                         aria-labelledby="headingNine">
                        <div class="panel-body">
                            <ul class="nav nav-pills nav-stacked">
                                <li>
                                    <a href="#">运动上装</a>
                                </li>
                                <li>
                                    <a href="#">运动下装</a>
                                </li>
                                <li>
                                    <a href="#">运动套装</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</header>
<!-- 2.主体部分-->
<div class="container">
    <div class="row jx">
        <img src="img/icon_5.jpg">
        <span>体育精选</span>
    </div>
    <div class="row paddtop">
        <c:forEach items="${sessionScope.goodsList}" var="goods">
            <div class="col-md-3">
                <div class="thumbnail">
                    <a href="goods/viewGoodsDetail?gid=${goods.id}">
                        <img src="product_images/${goods.picture}" alt="..." class="img-responsive"> 
                           
                    </a>
                    <div>
                        <p style="width: 100%;padding-left: 5px;padding-right: 5px;">
                            <strong style="color:#d9534f;font-size: 17px">￥ ${goods.price}</strong>
                            <sapn style="float: right;color: darkgray;font-size: 13px">89人付款</sapn>
                        <p>
                        <p style="width: 100%;float:left;overflow: hidden;
                        white-space:nowrap;text-overflow: ellipsis">${goods.description}
                        </p>
                        <span class="label label-success">新品</span>
                        <span class="label label-warning">包邮</span>
                        <div style="padding-left: 10px;padding-right: 10px;padding-top: 10px">
                            <c:if test="${not empty cookie.get('loginUser')}">
                                <a class="btn btn-primary" href="cart/addToCart?gid=${goods.id}" role="button"
                                   style="width: 100px">加入购物车</a>
                                <a class="btn btn-danger" href="#" role="button"
                                   style="float: right;width: 100px">立即购买</a>
                            </c:if>
                            <c:if test="${empty cookie.get('loginUser')}">
                                <a class="btn btn-primary" onclick="prompt()" role="button"
                                   style="width: 100px">加入购物车</a>
                                <a class="btn btn-danger" onclick="prompt()" role="button"
                                   style="float: right;width: 100px">立即购买</a>
                            </c:if>
                        </div>
                        </p>
                    </div>

                </div>
            </div>
        </c:forEach>
    </div>

    <!--分页-->
    <nav align="center">
        <ul class="pagination">
            <li><a href="#">
                <span>&laquo</span>
            </a>
            <li><a href="#">1
            <li><a href="#">2
            <li><a href="#">3
            <li><a href="#">4
            <li><a href="#">
                <span>&raquo</span>
            </a>
        </ul>
    </nav>
</div><!--container-->
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
