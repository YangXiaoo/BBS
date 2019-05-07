<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8"%> <%--设置文档类型  防止页面中文乱码--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>         <%--引入jstl核心标签库--%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   <%--引入jstl函数标签库--%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>  
<c:set var="ctx" value="${pageContext.request.contextPath }"/>

<rapid:override name="content">
<div class="#bbs-box">
          <!-- Box Comment -->
          <div class="box box-widget">
            <div class="box-header ">
              <div class="user-block">
                <img class="img-circle" src="${ctx}/${user.profile}" alt="User Image">
                <span class="username"><a href="#">${user.username}</a></span>
                <span class="description">${a.createTime}</span>
              </div>

            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div class="content">
                ${a.content}
              </div>

		    	<div class="pull-right bbs-post-bar">
		        	<button class="btn dislike btn-warning arc-thumbs" type="button" data-id="${a.id}" data-kind="0" data-url="${ctx}/downvote" title="踩" data-toggle="tooltip" >
		            <i class="fa fa-thumbs-o-down"></i>
		            <span>${a.upvote}</span>
		        	</button>    

		        	<button class="btn btn-danger like arc-thumbs" type="button" data-id="${a.id}" data-kind="1" data-url="${ctx}/upvote" title="赞" data-toggle="tooltip" >
		            <i class="fa fa-thumbs-o-up"></i>
		            <span>${a.downvote}</span>
		        	</button>  
		    	</div>
 		
          </div>
		</div>
	</div>
<c:forEach var="comment" items="${comments.result}" varStatus="i">
<div class="bbs-single-box clear">
	<div class="left">
		
		<div class="avatar">
			<a href="${ctx}/user?uid=${comment.userId}" target="_blank">
			<img src="${ctx}/${comment.user.profile}" class="avatar opacity" width="50" height="50" /></a>
		</div>
		<div class="name">
			<a href=" " target="_blank">${comment.user.username}</a>
		</div>
		<div class="info">
		</div>
	</div><!-- left -->

	<div class="right">
		<div class="bbs-single-content">
			<p>${comment.content}</p>
		</div>
		<div class="bbs-single-footer">
			<span onclick=''>拉黑</span><span title="${comment.createTime}">${comment.createTime}</span>
			<span onclick="" class="comment">回复</span>
			<a style="color: #999;"></a>
		</div>

		<c:forEach var="r" items="${comment.comment}" varStatus="i">
		<div class="bbs-comment-floor clear" style="display:block;">
			<div class="bbs-comment-floor-list" >
				<li class="clear">
					<div class="floor-left">
						<a href="${ctx}/user?uid=${r.userId}" target="_blank">
						<img src="${ctx}/${r.user.profile}" class="avatar opacity" width="40" height="40" /></a>
					</div>

					<div class="floor-right">
						<div class="name">
							<a href="${ctx}/user?uid=${r.userId}" target="_blank"><font style="color:#FF5722;">${r.user.username}</font></a>:  
    						<c:if test="${not empty r.user}" >
                      		<a href="${ctx}/user?uid=${r.puser.id}">@ ${r.puser.username}</a>&nbsp;
                  			</c:if>
							<span class="content">${r.content}</span>
						</div>
					</div>

					<div class="bottom">
						<span onclick=''>拉黑</span>
						<span title="${r.createTime
						}">${r.createTime
						}</span>
						<span onclick="" class="comment">回复</span>
					</div>

				</li>

			</div>
		</div>
	</c:forEach>
	</div>
</div>
</c:forEach>
</rapid:override>



<%@ include file="../../index.jsp"%>