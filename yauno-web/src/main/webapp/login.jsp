<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8"%> <%--设置文档类型  防止页面中文乱码--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>         <%--引入jstl核心标签库--%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   <%--引入jstl函数标签库--%>
<c:set var="ctx" value="${pageContext.request.contextPath }"/>           <%--用于设置变量值和对象属性--%>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>登录页面</title>
    <meta name="keywords" content="yangxiao">
    <meta name="content" content="yangxiao">
    <meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
    <script type="text/javascript" src="${ctx}/js/jquery.min.js"></script>
</head>

<body>

    <div>
        <h3>欢迎注册</h3>
        <form action="${ctx}/LoginByUsername" method="post" id="LoginForm">
            <input id="username" name="username" type="text" class="username" placeholder="用户名">
            <br/>
            <input id="password" name="password" type="password" class="possword" placeholder="密码">
            <br/>
            <button type="submit">登录</button>
        </form>
    </div>

</body>
</html>
