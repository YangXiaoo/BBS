<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8"%> <%--设置文档类型  防止页面中文乱码--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>         <%--引入jstl核心标签库--%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   <%--引入jstl函数标签库--%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>  
<c:set var="ctx" value="${pageContext.request.contextPath }"/>

<header class="main-header">
    <a href="${ctx}/admin/index" class="logo">
        <span class="logo-mini"><b>B</b>bs</span>
        <span class="logo-lg"><b>BBS</b>ADMIN</span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
        <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
            <span class="sr-only">Toggle navigation</span>
        </a>
        <!-- Navbar Right Menu -->
        <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
                <li>
                    <a href="${ctx}/admin/index" target="_blank"><i class="fa fa-home"></i>首页</a>
                    
                </li>
                <!-- User Account: style can be found in dropdown.less -->
                <li class="dropdown user user-menu">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <img src=" " class="user-image" alt="User Image">
                        <span class="hidden-xs">username</span>
                    </a>
                    <ul class="dropdown-menu">
                    <!-- User image -->
                        <li class="user-header">
                            <img src=" " class="img-circle" alt="User Image">
                            <p>
                                管理员
                            </p>
                        </li>
                        <!-- Menu Footer-->
                        <li class="user-footer">
                            <div class="pull-left">
                                <a href=" " class="btn btn-default btn-flat">编辑</a>
                            </div>
                            <div class="pull-right">
                                <a href=" " class="btn btn-default btn-flat">退出</a>
                            </div>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
</header>
