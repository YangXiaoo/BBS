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
            文章列表
        </h1>
    </section>
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title"></h3>
                        <div class="pull-left">
                            <a class="btn btn-primary btn-sm" href="${ctx}/admin/article/add"> <i class="fa fa-save"></i> 新增</a> 
                            <a class="btn btn-sm btn-danger delete-all" href="javascript:void(0);" data-url="${ctx}/admin/article/delete" ><i class="fa fa-trash"></i>删除</a>
                        </div>
                    </div>
                    <div class="box-body table-responsive">
                        <table class="table table-bordered table-hover table-sort">
                            <tr>
                                <th width="35"><input type="checkbox" class="minimal checkbox-toggle"></th>
                                <th>id</th>
                                <th>名称</th>
                                <th>分类</th>
                                <th>作者</th>
                                <th>浏览量</th>
                                <th>创建时间</th>
                                <th>状态</th>
                                <th>操作</th>
                            </tr>
                            <c:forEach var="a" items="${page.result}" varStatus="i">
                            <tr>
                                <td><input type="checkbox" name="id[]" value="${a.id}" class="minimal"></td>
                                <td>${a.id}</td>
                                <td>
                                    <span class="editable" data-pk="${a.id}" data-name="${a.title}" data-url="${ctx}/admin/article/editInLine">${a.title}</span>
                                </td>
                                <td>${a.category.categoryName}</td>
                                <td>
                                    ${a.user.username}
                                </td>
                                <td>${a.browse}</td>
                                <td>${a.createTime}</td>
                                <td>
                                    <c:if test="${a.status == '1'}">
                                    <a href="javascript:void(0);" data-id="${a.id}" data-field="status" 
                                    data-value="${a.status}" data-url=""
                                    class='editimg fa fa-check-circle text-green'></a>
                                </c:if>
                                <c:if test="${a.status == '0'}">
                                    <a href="javascript:void(0);" data-id="${a.id}" data-field="status" 
                                    data-value="${a.status}" data-url=""
                                    class='editimg fa fa-times-circle text-red '></a>
                                </c:if>
                                </td>
                                <td>
                                    <a class="btn btn-primary btn-xs" href="${ctx}/article?aid=${a.id}" target="_blank"><i class="fa fa-eye"></i>查看</a>
                                    <a class="btn btn-primary btn-xs" href="${ctx}/admin/article/edit?pid=${a.id}"><i class="fa fa-edit"></i> 编辑</a> 
                                    <a href="javascript:void(0);" data-id="${a.id}" data-field="0" 
                                    data-value="0" data-url="${ctx}/admin/article/push" data-title="推送" data-content="确认将该文章推送至用户邮箱" class="edit_inline btn btn-primary btn-xs" 
                                    ><i class=" fa fa-paper-plane"></i>推送</a>

                                    <a href="javascript:void(0);" data-id="${a.id}"  
                                    data-url="${ctx}/admin/article/delete"
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