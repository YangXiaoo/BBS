<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8"%> <%--设置文档类型  防止页面中文乱码--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>         <%--引入jstl核心标签库--%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   <%--引入jstl函数标签库--%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>  
<c:set var="ctx" value="${pageContext.request.contextPath }"/>

<div class="tab-pane active" id="tab_base">
    <div class="form-group">
        <label class="col-sm-2 control-label">所属类型</label>

        <div class="col-sm-7">
            <select class="form-control select2" name="typeid" style="width:100%;">
                <c:forEach var="c" items="${cateList}" varStatus="i">
                <c:if test="${cid != c.id}">
                <option value="${c.id}">${c.categoryName}</option>
                </c:if> 
                <c:if test="${cid == c.id}">
                <option value="${c.id}" selected="selected">${c.categoryName}</option>
                </c:if>
            </c:forEach>
            </select>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">文章标题</label>
        <div class="col-sm-7"><input class="form-control" name="title" value="${a.title}" placeholder="${a.title}"></div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">描述</label>
        <div class="col-sm-7"><textarea class="form-control" style="" name="description" placeholder="${a.description}">${a.description}</textarea></div>
    </div>
<!--     <div class="form-group">
        <label class="col-sm-2 control-label">标签</label>
        <div class="col-sm-7">
            <input class="form-control" name="tag" value="{{ p.tag }}" placeholder="{{ p.tag }}">
        </div>
    </div> -->


    <div class="form-group">
        <label class="col-sm-2 control-label">属性</label>
        <div class="col-sm-7">
            <input type="checkbox" class="hide" name="flag[]" value="" checked="checked" />
            <label class="checkbox-inline">
                <input type="checkbox" name="flag[]" value="n"   class="minimal" checked="checked"> 普通        
            </label>
            <label class="checkbox-inline">
                <input type="checkbox" name="flag[]" value="h"   class="minimal"> 头条        
            </label>
            <label class="checkbox-inline">
                <input type="checkbox" name="flag[]" value="p"  class="minimal"> 图片        
            </label>
        </div>
    </div>


    <div class="form-group hide" id="litpic">
        <label class="col-sm-2 control-label">缩略图</label>
        <div class="col-sm-7">
            <div class="input-group">
                <input class="form-control" name="pic" value="${a.pic}" placeholder="${a.pic}" >
                <span class="input-group-btn">
                    <a href="${a.pic}" target="_blank" >
                        <img src="${ctx}/${a.pic}" style="height:34px; width:68px;" />
                    </a>
                    <button class="btn btn-success btn-flat up-btn" type="button" data-url="${ctx}/uploadFile" data-filetype="0" data-filedir="image">
                        <i class="fa fa-cloud-upload"> 上传 </i>
                    </button>
                </span>
            </div>
        </div>
    </div>

    <div class="form-group">
        <div id="editormd">
            <textarea style="display:none;" name="content">${a.content}</textarea>
        </div>
    </div>
</div>