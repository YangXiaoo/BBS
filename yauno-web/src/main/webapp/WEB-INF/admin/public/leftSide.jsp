<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8"%> <%--设置文档类型  防止页面中文乱码--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>         <%--引入jstl核心标签库--%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   <%--引入jstl函数标签库--%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>  
<c:set var="ctx" value="${pageContext.request.contextPath }"/>

<!-- Left side column. contains the logo and sidebar -->
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
    <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src=" " class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
                <p>username</p>
                <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
        </div>
        <!-- /.search form -->
        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu" data-widget="tree">
            <li class="header">MAIN NAVIGATION</li>
            <li>
                <a href="${ctx}/admin/index"><i class="fa fa-home"></i><span>后台首页</span></a>
            </li>

            <li class="treeview">
                <a href="#">
                    <i class="fa fa-file-text"></i>
                    <span>帖子</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li>
                        <a href="${ctx}/admin/category">
                            <i class="fa fa-columns"></i> 帖子分类
                        </a>
                    </li>
                    <li>
                        <a href="${ctx}/admin/article">
                            <i class="fa fa-file-text-o"></i> 文章列表
                        </a>
                    </li>
                    <li>
                        <a href="${ctx}/admin/article/add">
                            <i class="fa fa fa-edit"></i> 写文章
                        </a>
                    </li>
                </ul>
            </li>

            <li class="treeview">
                <a href="javascript:void(0);">
                    <i class="fa fa-users"></i>
                    <span>用户管理</span>
                    <span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
                </a>
                <ul class="treeview-menu">
                    <li>
                        <a href="${ctx}/admin/user"><i class="fa fa-user-o"></i>用户列表
                        </a>
                    </li>
                    <li>
                        <a href="${ctx}/admin/userAuth"><i class="fa fa-user-o"></i>权限管理
                        </a>
                    </li>
                    <li><a href="${ctx}/admin/addUser"><i class="fa fa-vcard"></i>添加用户</a></li>
                </ul>
            </li>

            <li class="treeview">
                <a href="javascript:void(0);">
                    <i class="fa fa-comments"></i>
                    <span>消息管理</span>
                    <span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
                </a>
                <ul class="treeview-menu">
                    <li>
                        <a href="${ctx}/admin/article/comment"><i class="fa fa-user-o"></i>文章评论
                        </a>
                    </li>
                    <li>
                        <a href="${ctx}/admin/guestbook/comment"><i class="fa fa-user-o"></i>留言列表
                        </a>
                    </li>
                </ul>
            </li>

            <li class="treeview">
                <a href="javascript:void(0);">
                    <i class="fa fa-gear"></i>
                    <span>系统设置</span>
                    <span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
                </a>
                <ul class="treeview-menu">
                    <li>
                        <a href="${ctx}/admin/config/web"><i class="fa fa-desktop"></i>站点配置
                        </a>
                    </li>
                    <li>
                        <a href="${ctx}/admin/config/email">
                            <i class="fa fa-envelope"></i> 邮箱设置
                        </a>
                    </li>
                    <li>
                        <a href="${ctx}/admin/config/resources"><i class="fa fa-list-alt"></i>资源列表
                        </a>
                    </li>
                </ul>
            </li>

            <li class="treeview">
                <a href="javascript:void(0);">
                    <i class="fa fa-wrench"></i>
                    <span>站长工具</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li>
                        <a href="${ctx}/admin/log/login">
                            <i class="fa fa-location-arrow"></i>登录日志
                        </a>
                    </li>
                    <li>
                        <a href="${ctx}/admin/log/browse">
                            <i class="fa fa-user-o"></i>浏览日志
                        </a>
                    </li>
                    <li>
                        <a href="${ctx}/admin/tool/blogRoll">
                            <i class="fa fa-link"></i>友情链接
                        </a>
                    </li>
                </ul>
            </li>

            <li class="treeview">
                <a href="javascript:void(0);">
                    <i class="fa fa-database"></i>
                    <span>数据库管理</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li>
                        <a href="${ctx}/admin/databaseList">
                            <i class="fa fa-list"></i>数据库列表
                        </a>
                    </li>
                </ul>
            </li>

            <li class="header">LABELS</li>
            <li><a href="#"><i class="fa fa-circle-o text-red"></i> <span>Important</span></a></li>
            <li><a href="#"><i class="fa fa-circle-o text-yellow"></i> <span>Warning</span></a></li>
            <li><a href="#"><i class="fa fa-circle-o text-aqua"></i> <span>Information</span></a></li>
        </ul>
    </section>
<!-- /.sidebar -->
</aside>