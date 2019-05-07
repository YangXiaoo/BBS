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
            用户列表
        </h1>
    </section>
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title"></h3>
                        <div class="pull-left">
                            <a class="btn btn-primary btn-sm" href="${ctx}/admin/user/add"> <i class="fa fa-save"></i> 新增</a> 
                            <a class="btn btn-sm btn-danger delete-all" href="javascript:void(0);" data-url="${ctx}/admin/user/delete" ><i class="fa fa-trash"></i>删除</a>
                        </div>
                    </div>
                    <div class="box-body table-responsive">
                        <table class="table table-bordered table-hover table-sort">
                            <tr>
                                <th width="35"><input type="checkbox" class="minimal checkbox-toggle"></th>
                                <th>id</th>
                                <th>头像</th>
                                <th>用户名</th>
                                <th>邮箱</th>
                                <th>管理员</th>
                                <th>状态</th>
                                <th>操作</th>
                            </tr>
                            <c:forEach var="u" items="${page.result}" varStatus="i">
                            <tr>
                                <td><input type="checkbox" name="id[]" value="${u.id}" class="minimal"></td>
                                <td>${u.id}</td>
                                <td><img src="${ctx}/${u.profile}" style="height:30px; width:30px;" /></td>
                                <td>${u.username}</td>
                                <td>
                                    ${ u.email }
                                </td>
                                <td>
                                    <c:if test="${u.isAdmin == '1'}">
                                    <a href="javascript:void(0);" data-id="${ u.id }" data-field="admin" 
                                    data-value="${ u.isAdmin }" data-url="${ctx}/admin/user/editInLine"
                                    class='editimg fa fa-check-circle text-green'></a>
                                    </c:if>
                                    <c:if test="${u.isAdmin == '0'}">
                                    <a href="javascript:void(0);" data-id="${ u.id }" data-field="admin" 
                                    data-value="${ u.isAdmin }" data-url="${ctx}/admin/user/editInLine"
                                    class='editimg fafa-times-circle text-red'></a>
                                    </c:if>      
                                </td>
                                <td>
                                    <c:if test="${u.isActive == '1'}">
                                    <a href="javascript:void(0);" data-id="${ u.id }" data-field="active" 
                                    data-value="${ u.isActive }" data-url="${ctx}/admin/user/editInLine"
                                    class='editimg fa fa-check-circle text-green'></a>
                                </c:if>
                                    <c:if test="${u.isActive == '0'}">
                                    <a href="javascript:void(0);" data-id="${ u.id }" data-field="active" 
                                    data-value="${ u.isActive }" data-url="${ctx}/admin/user/editInLine"
                                    class='editimg fafa-times-circle text-red'></a>
                                </c:if> 
                                </td>
                                <td>
                                    <a class="btn btn-primary btn-xs" href="${ctx}/admin/user/edit?uid=${ u.id }"><i class="fa fa-edit"></i> 编辑</a> 

                                    <a href="javascript:void(0);" data-id="${ u.id }"  
                                    data-url="${ctx}/admin/user/delete"
                                    class="btn btn-xs btn-danger delete-one">删除</a>

                                </td>
                            </tr>
                            </c:forEach>
                        </table>
                    </div>

                    <div class="box-footer clearfix">
                        <ul class="pagination pagination-sm no-margin">
                            <c:if test="${page.pageNum <= 1}">
                                <li class="disabled"><a href="javascript:void(0);">« 上一页</a></li>
                            </c:if>
                            <c:if test="${page.pageNum > 1}">
                                <li class="previous"><a href="${ctx}/admin/article?pageNum=${page.pageNum-1}">« 上一页</a></li>
                            </c:if>
                            <c:forEach begin="1" end="${page.pages}" var="pn">
                                <c:if test="${page.pageNum==pn}">
                                    <li class="active"><a href="javascript:void(0);">${pn}</a></li>
                                </c:if>
                                <c:if test="${page.pageNum!=pn}">
                                    <li ><a href="${ctx}/admin/article?pageNum=${pn}">${pn}</a></li>
                                </c:if>
                            </c:forEach>

                            <c:if test="${page.pageNum>=page.pages}">
                                <li class="disabled"><a href="javascript:void(0);">下一页 »</a></li>
                            </c:if>
                            <c:if test="${page.pageNum<page.pages}">
                                <li><a href="${ctx}/admin/article?pageNum=${page.pageNum+1}">下一页 »</a></li>
                            </c:if>
                        </ul>
                    </div>

                </div>
            </div>
        </div>
    </section>
</div>
<script type="text/javascript">
$(function(){
    toolInit();
    initEditable();
})
</script>
</rapid:override>

<%@ include file="../public/indexBase.jsp"%>