<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8"%> <%--设置文档类型  防止页面中文乱码--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>         <%--引入jstl核心标签库--%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   <%--引入jstl函数标签库--%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>  
<c:set var="ctx" value="${pageContext.request.contextPath }"/>

<rapid:override name="content">
<div class="content-wrapper">
    <section class="content-header">
        <h1>
            后台首页<button id="testButton">toastr测试</button>
        </h1>
    </section>
    <section class="content">
                <div class="row">
                    <div class="col-md-3 col-sm-6 col-xs-12">
                        <div class="info-box bg-aqua">
                            <span class="info-box-icon"><i class="fa fa-bookmark-o"></i></span>

                            <div class="info-box-content">
                                <span class="info-box-text">文章总数</span>
                                <span class="info-box-number">{{ paper_total }}</span>
                            </div>
                            <!-- /.info-box-content -->
                          </div>
                          <!-- /.info-box -->
                    </div>


                    <div class="col-md-3 col-sm-6 col-xs-12">
                        <div class="info-box bg-maroon">
                            <span class="info-box-icon"><i class="fa fa-eye"></i></span>

                            <div class="info-box-content">
                                <span class="info-box-text">文章浏览</span>
                                <span class="info-box-number">{{ view_total }}</span>
                            </div>
                            <!-- /.info-box-content -->
                          </div>
                          <!-- /.info-box -->
                    </div>


                    <div class="col-md-3 col-sm-6 col-xs-12">
                        <div class="info-box bg-teal">
                            <span class="info-box-icon"><i class="fa fa-user"></i></span>

                            <div class="info-box-content">
                                <span class="info-box-text">用户数量</span>
                                <span class="info-box-number">{{ user_total }}</span>
                            </div>
                            <!-- /.info-box-content -->
                          </div>
                          <!-- /.info-box -->
                    </div>

                        <!-- /.col -->
                    <div class="col-md-3 col-sm-6 col-xs-12">
                        <div class="info-box bg-green">
                            <span class="info-box-icon"><i class="fa fa-thumbs-o-up"></i></span>

                            <div class="info-box-content">
                                <span class="info-box-text">Likes</span>
                                <span class="info-box-number">{{ like_total }}</span>
                            </div>
                            <!-- /.info-box-content -->
                        </div>
                          <!-- /.info-box -->
                    </div>
                        <!-- /.col -->

                    <div class="col-md-3 col-sm-6 col-xs-12">
                        <div class="info-box bg-yellow">
                            <span class="info-box-icon"><i class="fa fa-thumbs-o-down"></i></span>

                            <div class="info-box-content">
                                <span class="info-box-text">Dislike</span>
                                <span class="info-box-number">{{ dislike_total }}</span>
                            </div>
                            <!-- /.info-box-content -->
                        </div>
                          <!-- /.info-box -->
                    </div>
                    <!-- /.col -->

                    <div class="col-md-3 col-sm-6 col-xs-12">
                        <div class="info-box bg-red">
                            <span class="info-box-icon"><i class="fa fa-comments-o"></i></span>

                            <div class="info-box-content">
                                <span class="info-box-text">Comments</span>
                                <span class="info-box-number">{{ comments_total }}</span>
                            </div>
                            <!-- /.info-box-content -->
                        </div>
                          <!-- /.info-box -->
                    </div>
                        <!-- /.col -->
                </div>
                      <!-- /.row -->


                <div class="row">
                    <div class="col-lg-6 col-sm-6 col-xs-12">
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title">最近30天用户活跃统计</h3>
                            </div>
                            <div class="box-body">
                                <canvas id="login-line" height="312"></canvas>
                            </div>
                        </div>
                    </div>


                    <div class="col-lg-6 col-sm-6 col-xs-12">
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title">近30天文章浏览统计</h3>
                            </div>
                            <div class="box-body">
                                <canvas id="paper-view-line" height="312"></canvas>
                            </div>
                        </div>
                    </div>



                    <div class="col-lg-6 col-sm-6 col-xs-12">
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title">客户端</h3>
                            </div>
                            <div class="box-body">
                                <canvas id="brower-pie" height="312"></canvas>
                            </div>
                        </div>
                    </div>


                    <div class="col-lg-6 col-sm-6 col-xs-12">
                        <div class="box box-primary">
                            <div class="box-header">
                                <h3 class="box-title">最新登录</h3>
                            </div>
                            <div class="box-body no-padding">
                                <table class="table table-hover">
                                    <tr>
                                        <th>IP</th>
                                        <th>位置</th>
                                        <th>登录时间</th>
                                    </tr>
                                    {% for l in last_login %}
                                    <tr>
                                        <td><span class="label label-success">{{ l.ip }}</span></td>
                                        <td>{{ l.province }}&nbsp;{{ l.city }}</td>
                                        <td>{{ l.date }}</td>
                                    </tr>
                                    {% endfor %}

                                </table>
                            </div>
                        </div>
                    </div>




                    <div class="col-lg-12 col-sm-12 col-xs-12">
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title">用户活跃地点统计</h3>
                            </div>
                            <div class="box-body" class="responsive">
                                <div id="user-avtive-area" class="responsive" style="width: 600px;height:500px;"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
</rapid:override>

<%@ include file="public/indexBase.jsp"%>