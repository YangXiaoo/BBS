<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8"%> <%--设置文档类型  防止页面中文乱码--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>         <%--引入jstl核心标签库--%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   <%--引入jstl函数标签库--%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>  
<c:set var="ctx" value="${pageContext.request.contextPath }"/>  


<div class="box box-solid">
    <div class="box-body">
      	一段话 - by
    </div>
</div>


<div class="box box-solid">
    <div class="with-border ">
    	<div class="#bbs-side-header">
      		<h3 class="box-title">通知</h3>
      	</div>
    </div>
    <div class="box-body">
      	<div>side-bar</div>
      	<div>side-bar</div>
      	<div>side-bar</div>
      	<div>side-bar</div>
    </div>
</div>

<div class="box box-solid">
    <div class="with-border ">
    	<div class="#bbs-side-header">
      		<h3 class="box-title">话题</h3>
      	</div>
    </div>
    <div class="box-body">
      	<div>side-bar</div>
      	<div>side-bar</div>
      	<div>side-bar</div>
      	<div>side-bar</div>
    </div>
</div>
