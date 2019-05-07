<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8"%> <%--设置文档类型  防止页面中文乱码--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>         <%--引入jstl核心标签库--%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   <%--引入jstl函数标签库--%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>  
<c:set var="ctx" value="${pageContext.request.contextPath }"/>

<div class="tab-pane" id="tab_advanced">
    
<!--     <div class="form-group">
        <label class="col-sm-2 control-label">作者</label>
        <div class="col-sm-7"><input class="form-control" name="author" value="" placeholder=""></div>
    </div> -->


    <div class="form-group">
        <label class="col-sm-2 control-label">浏览数</label>
        <div class="col-sm-7"><input type="text" class="form-control" placeholder="${a.browse}" disabled=""></div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">赞</label>
        <div class="col-sm-7"><input type="text" class="form-control" placeholder="${a.upvote}" disabled=""></div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">踩</label>
        <div class="col-sm-7"><input type="text" class="form-control" placeholder="${a.downvote}" disabled=""></div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">转态</label>
        <div class="col-sm-7">
            <select class="form-control select2" name="status" style="width:100%;">
            <c:if test="${a.status != '0'}">
                <option value="1" selected="selected">开启</option>
                <option value="0">关闭</option>
            </c:if>
            <c:if test="${a.status == '0'}">
                <option value="1">开启</option>
                <option value="0" selected="selected">关闭</option>
            </c:if>
            </select>
        </div>
    </div>


    <div class="form-group">
        <label class="col-sm-2 control-label">创建时间</label>
        <div class="col-sm-7">
            <div class="input-group date">
                <div class="input-group-addon">
                    <i class="fa fa-calendar"></i>
                </div>
                <input class="form-control pull-right datepicker" name="create_time" value="${a.createTime}" placeholder="${a.createTime}"  type="text">
            </div>
        </div>
    </div>
</div>