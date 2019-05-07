<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8"%> <%--设置文档类型  防止页面中文乱码--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>         <%--引入jstl核心标签库--%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   <%--引入jstl函数标签库--%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>  
<c:set var="ctx" value="${pageContext.request.contextPath }"/>

<rapid:override name="content">
<div class="#bbs-box">
	<c:forEach var="a" items="${page.result}" varStatus="i">
          <!-- Box Comment -->
          <div class="box box-widget">
            <div class="box-header ">
              <div class="user-block">
                <img class="img-circle" src="${ctx}/${a.user.profile}" alt="User Image">
                <span class="username"><a href="#">${a.user.username}</a></span>
                <span class="description">${a.createTime}</span>
              </div>
              <!-- /.user-block -->
<!--               <div class="box-tools">
                <button type="button" class="btn btn-box-tool" data-toggle="tooltip" title="Mark as read">
                  <i class="fa fa-circle-o"></i></button>
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div> -->
              <!-- /.box-tools -->
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <a href="${ctx}/article?aid=${a.id}">
              <div class="desc">
                ${a.description}
              </div>
              </a>
              <div class="bbs-post-bar">
              <!-- Social sharing buttons -->
              <li><i class="fa fa-comment-o">${a.commentCount}</i>
              </li>
              <li> <i class="fa fa-lemon-o">${a.upvote}</i></li>
              </div>
            </div>
          </div>
</c:forEach>
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
</rapid:override>



<%@ include file="../../index.jsp"%>