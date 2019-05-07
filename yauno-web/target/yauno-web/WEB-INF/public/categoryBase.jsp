<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8"%> <%--设置文档类型  防止页面中文乱码--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>         <%--引入jstl核心标签库--%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   <%--引入jstl函数标签库--%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>  
<c:set var="ctx" value="${pageContext.request.contextPath }"/>           <%--用于设置变量值和对象属性--%>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <rapid:block name="title"><title>分类</title></rapid:block> 
    <meta name="keywords" content="yangxiao">
    <meta name="content" content="yangxiao">
    <meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
    
    <%@ include file="commonTopCss.jsp"%>
    <rapid:block name="top_css"></rapid:block>
    <%@ include file="commonTopJs.jsp"%>
    <rapid:block name="top_js"></rapid:block> 

</head>
<body>
    <jsp:include page="/headerBar" flush="true"/>
    <div id="pjax-container">
        <rapid:block name="content"> </rapid:block>
    </div>

</body>
    <%@ include file="commonDownCss.jsp"%>
    <%@ include file="commonDownJs.jsp"%>

    <rapid:block name="down_css"></rapid:block> 
    <rapid:block name="down_js"></rapid:block> 
</html>