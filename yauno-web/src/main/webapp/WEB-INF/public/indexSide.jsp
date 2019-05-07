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
    <div class="bbs-sidebar-box">
    	<h4>最新伙伴</h4>
    	<div class="bbs-sidebar-list">
    		<c:forEach var="u" items="${userList}" varStatus="i">
    		<li title="${u.username}">
    			<a href="${ctx}/user?uid=${u.id}"><img src="${ctx}/${u.profile}"></a>
    		</li>
    		</c:forEach>
    	</div>
    </div>
</div>

<div class="box box-solid">
	<div class="bbs-sidebar-box">
		
		<div class="bbs-topic-sort">
			<h4>热门分类</h4>
			<div class="bbs-topic-content"> 
				<c:forEach var="c" items="${hotCate}" varStatus="i">
				<li title="${c.categoryName}">
					<a href="${ctx}/category?cid=${c.id}" target="_blank">${c.categoryName}</a>
					<span><i class="fa fa-fire hot">${c.browse}</i></span>
				</li>
				</c:forEach>
			</div>
			<div class="bbs-topic-footer">
				<a href="${ctx}/category" target="_blank">更多</a>
			</div>
		</div>
	</div>
</div>
