<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8"%> <%--设置文档类型  防止页面中文乱码--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>         <%--引入jstl核心标签库--%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   <%--引入jstl函数标签库--%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>  
<c:set var="ctx" value="${pageContext.request.contextPath }"/>

<rapid:override name="content">
<div class="content-wrapper">
<!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            编辑用户
        </h1>
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <form class="form-horizontal" method="POST" action="${ctx}/admin/user/save" onsubmit="return false;" >
                    <div class="nav-tabs-custom">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#tab1" data-toggle="tab">基本参数</a></li>
                            <li class="pull-right"><a href="javascript:history.back(-1)" class="btn btn-sm" style="padding:10px 2px;"><i class="fa fa-list"></i>返回</a></li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="tab1">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">登录名</label>
                                    <div class="col-sm-7"><input class="form-control" name="username" value="" placeholder="用户姓名"></div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">登录密码</label>
                                    <div class="col-sm-7"><input class="form-control" name="password" value="" placeholder="密码" type="password"></div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">邮箱</label>
                                    <div class="col-sm-7"><input class="form-control" name="email" value="" placeholder="邮箱"></div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">是否激活</label>
                                    <div class="col-sm-7">
                                        <select class="form-control select2" name="status" style="width:100%;">
                                            <option value="1" >是</option>
                                            <option value="0" >否</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">是否管理员</label>
                                    <div class="col-sm-7">
                                        <select class="form-control select2" name="admin" style="width:100%;">
                                            <option value="1" >是</option>
                                            <option value="0" >否</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="box-footer">
                            <div class="col-sm-2"></div>
                            <div class="col-sm-7">
                                <div class="btn-group pull-right">
                                    <button type="submit" class="btn btn-info pull-right submits" data-loading-text="&lt;i class='fa fa-spinner fa-spin '&gt;&lt;/i&gt; 提交">提交</button>
                                </div>
                                <div class="btn-group pull-left">
                                    <button type="reset" class="btn btn-warning">重置</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <!-- /.content -->
</div>
<script type="text/javascript">
$(function(){
    toolInit();
})
</script>
</rapid:override>

<%@ include file="../public/indexBase.jsp"%>