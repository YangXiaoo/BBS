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
            创建文章
        </h1>
    </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-md-12">
                    <form class="form-horizontal" method="POST" action="${ctx}/admin/article/save" onsubmit="return false" >
                        <input type="hidden" name="aid" value="${a.id}" />
                        
                        <div class="nav-tabs-custom">
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#tab_base" data-toggle="tab">基本参数</a></li>
                                <li><a href="#tab_advanced" data-toggle="tab">高级参数</a></li>
                                <li class="pull-right"><a href="javascript:history.back(-1)" class="btn btn-sm" style="padding:10px 2px;"><i class="fa fa-list"></i> 返回</a></li>
                            </ul>
                            <div class="tab-content">
                                <%@ include file="base.jsp"%>
                                <%@ include file="advance.jsp"%>
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
<script src="${ctx}/plugs/editor.md/editormd.js"></script>
<script type="text/javascript">
    $(function() {
        var editor = editormd("editormd", {

            width: "90%",
            height: 730,
            path : "${ctx}/plugs/editor.md/lib/", // Autoload modules mode, codemirror, marked... dependents libs path
            codeFold : true,
            saveHTMLToTextarea : true,
            searchReplace : true,
            // htmlDecode : "style,script,iframe|on*",
            emoji : true,
            taskList : true,
            tocm : true,         // Using [TOCM]
            tex : true,                   // 开启科学公式TeX语言支持，默认关闭
            flowChart : true,             // 开启流程图支持，默认关闭
            sequenceDiagram : true,       // 开启时序/序列图支持，默认关闭,
            imageUpload : true,
            imageFormats : ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
            imageUploadURL : "${ctx}/uploadFile",
            onload : function() {
                console.log('onload', this);
            }
        });
    });
</script>
<script type="text/javascript">
$(function(){
    toolInit();
})
</script>
</rapid:override>

<%@ include file="../public/indexBase.jsp"%>