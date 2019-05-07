<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8"%>

<div class="tab-pane active" id="tab1">
    
    <input type="hidden" name="cid" value="${c.id}" />

    <div class="form-group">
        <label class="col-sm-2 control-label">分类名</label>
        <div class="col-sm-7"><input class="form-control" name="categoryName" value="${c.categoryName}" placeholder="${c.categoryName}"></div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">描述</label>
        <div class="col-sm-7"><input class="form-control" name="desc" value="${c.description}" placeholder="${c.description}"></div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">排序</label>
        <div class="col-sm-7"><input class="form-control" name="sorts" value="${c.sorts}" placeholder="${c.sorts}"></div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">状态</label>
        <div class="col-sm-7">
            <select class="form-control select2" name="status" style="width:100%;">
                <c:if test="${c.status == '1'}">
                <option value="1" selected="selected">开启</option>
                <option value="0" selected="">关闭</option>
            </c:if>
            <c:if test="${c.status != '1'}">
                <option value="1" selected="">开启</option>
                <option value="0" selected="selected">关闭</option>

            </c:if>
            </select>
        </div>
    </div>
</div>