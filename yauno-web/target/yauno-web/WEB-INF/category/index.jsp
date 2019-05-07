<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8"%> <%--设置文档类型  防止页面中文乱码--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>         <%--引入jstl核心标签库--%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   <%--引入jstl函数标签库--%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>  
<c:set var="ctx" value="${pageContext.request.contextPath }"/>

<rapid:override name="content">    

<div class="bbs-box">
<div class="layui-row">
    <div class="layui-col-xs6">
      <div class="grid-demo grid-demo-bg1">
          <div class="layui-carousel" id="category-carousel">
              <div carousel-item="">
                <div><img src="${ctx}/images/404.jpg"></div>
                <div>条目2</div>
                <div>条目3</div>
                <div>条目4</div>
                <div>条目5</div>
              </div>
            </div> 
        </div>
    </div>
    <div class="layui-col-xs6">
      <div class="grid-demo">
	    <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
	      <ul class="layui-tab-title">
	        <li class="layui-this">网站设置</li>
	        <li>用户管理</li>
	        <li>权限分配</li>
	        <li>商品管理</li>
	        <li>订单管理</li>
	      </ul>
	      <div class="layui-tab-content" style="height: 100px;">
	        <div class="layui-tab-item layui-show">内容不一样是要有，因为你可以监听tab事件（阅读下文档就是了）</div>
	        <div class="layui-tab-item">内容2</div>
	        <div class="layui-tab-item">内容3</div>
	        <div class="layui-tab-item">内容4</div>
	        <div class="layui-tab-item">内容5</div>
	      </div>
	    </div>
	</div>
    </div>
  </div>
</div>

<div class="bbs-box">
	${title}
</div>


</rapid:override>

<%@ include file="../public/categoryBase.jsp"%>