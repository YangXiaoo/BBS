<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8"%> <%--设置文档类型  防止页面中文乱码--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>         <%--引入jstl核心标签库--%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   <%--引入jstl函数标签库--%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>  
<c:set var="ctx" value="${pageContext.request.contextPath }"/>           <%--用于设置变量值和对象属性--%>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <rapid:block name="title"><title>主页</title></rapid:block> 
    <meta name="keywords" content="yangxiao">
    <meta name="content" content="yangxiao">
    <meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">

    <%@ include file="commonTopCss.jsp"%>
    <rapid:block name="top_css"></rapid:block>
    <%@ include file="commonTopJs.jsp"%>
    <rapid:block name="top_js"></rapid:block> 

</head>
 <body class="hold-transition skin-green-light layout-top-nav">
<div class="wrapper">
	<jsp:include page="/headerBar" flush="true"/>
    <rapid:block name="nav-bar">
    </rapid:block>
    <div class="content-wrapper">
        <div class="container">
            <section class="content bbs-content">
                <div class="row">
                    <div class="col-md-8 bbs-row-main">
                    	<div id="pjax-container">
        <!--                     <section class="content-header">
                            </section> -->
                            
                                <div class="bbs-index-menu clear">
                                    <div class="bbs-index-menu-list">
                                        <li class="article"><a href="${ctx}/newArticle">最新</a></li>
                                        <li class="article"><a href="${ctx}/hotArticle">排行</a></li>
                                        <li class="article"><a href="${ctx}/pushArticle"> 推送</a></li>
                                        <li class="article"><a href="${ctx}/replyQuestion">回答</a> </li>
                                        <li class="article"><a href="${ctx}/followArticle">关注</a> </li>
                                    </div>
                                </div>
                        	<rapid:block name="content"> </rapid:block>
                            
                    	</div>
                    </div>
                    <div class="col-md-4 bbs-row-sider">
                        <%@ include file="indexLeftSideBar.jsp"%>
                    </div>
                </div>
            </section>
        </div>
    </div>
    <rapid:block name="footer">
     <%@ include file="footer.jsp"%>
    </rapid:block>
</div>
    <%@ include file="commonDownCss.jsp"%>
    <%@ include file="commonDownJs.jsp"%>

    <rapid:block name="down_css"></rapid:block> 
    <rapid:block name="down_js"></rapid:block> 
</body>

</html>

