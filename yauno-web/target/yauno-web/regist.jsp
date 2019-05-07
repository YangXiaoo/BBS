<%--
  Created by IntelliJ IDEA.
  User: Yauno
  Date: 2019/4/7
  Time: 11:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8"%> <%--设置文档类型  防止页面中文乱码--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>         <%--引入jstl核心标签库--%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   <%--引入jstl函数标签库--%>
<c:set var="ctx" value="${pageContext.request.contextPath }"/>           <%--用于设置变量值和对象属性--%>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>注册页面</title>
    <meta name="keywords" content="yangxiao">
    <meta name="content" content="yangxiao">
    <meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
    <link type="text/css" rel="stylesheet" href="${ctx}/css/yauno.css">
    <script type="text/javascript" src="${ctx}/js/jquery.min.js"></script>
</head>

<body class="login_bj" style="background-color: grey">

<div class="zhuce_body" >
    <div class="zhuce_kong" id="dre_div">
        <div class="zc">
            <div class="bj_bai" style="height: 408px">
                <h3>欢迎注册</h3>
                <form action="${ctx}/doRegister" method="post" id="registerForm">
                    <span id="reg_span"></span>
                    <br>
                    <span id="email_span" style="color: red"></span>
                    <input id="email" name="email" type="text" class="kuang_txt email" placeholder="邮箱">
                    <span id="password_span"></span>
                    <input id="password" name="password" type="password" class="kuang_txt possword" placeholder="密码">
                    <br/>
                    <span id="nickName_span" style="color: red"></span>
                    <input id="nickName" name="nickName" type="text" class="kuang_txt possword" placeholder="昵称">
                    <br/>
                    <input id="code" name="code" type="text" class="kuang_txt yanzm" placeholder="验证码">
                    <button type="submit">注册</button>
                    <br/>
                    <span style="color: red">${error}</span>

                </form>
            </div>
            <div class="bj_right" style="height: 408px">
                <p>使用以下账号直接登录</p>
                <a href="#" class="zhuce_qq">QQ注册</a>
                <a href="#" class="zhuce_wb">微博注册</a>
                <a href="#" class="zhuce_wx">微信注册</a>
                <p>已有账号？<a href="${ctx}/login">立即登录</a></p>
                <p>进入<a href="${ctx}/index">主页</a></p>

            </div>
        </div>
    </div>
</div>

<div style="text-align:center;">
</div>
</body>
</html>
