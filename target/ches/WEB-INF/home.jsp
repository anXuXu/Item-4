<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/7/26
  Time: 14:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>后台管理</title>

    <link rel="stylesheet" href=<%=path+"/css/bootstrap.min.css"%> >
    <link rel="stylesheet" href=<%=path+"/font-awesome/css/font-awesome.css"%> >

    <!-- Toastr style -->
    <link rel="stylesheet" href=<%=path+"/css/plugins/toastr/toastr.min.css"%> >

    <!-- Gritter -->
    <link rel="stylesheet" href=<%=path+"/js/plugins/gritter/jquery.gritter.css"%> >

    <link rel="stylesheet" href=<%=path+"/css/animate.css"%>>
    <link rel="stylesheet" href=<%=path+"/css/style.css"%>>

</head>

<body>
<div id="wrapper">
    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav metismenu" id="side-menu">
                <li class="nav-header">
                    <div class="dropdown profile-element"> <span>
                            <img alt="image" class="img-circle" src=<%=path+"/jsp/img/profile_small.jpg"%>>
                             </span>
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <span class="clear"> <span class="block m-t-xs"> <strong class="font-bold" >
<%--                                <s:property value="user"></s:property>--%>
                                ${sessionScope.user}<input type="hidden" id="username" value="${sessionScope.user}"></strong>
                             </span> <span class="text-muted text-xs block">${sessionScope.occ}<b class="caret"></b></span> </span> </a>
                        <ul class="dropdown-menu animated fadeInRight m-t-xs">
                            <!--个人主页 profile.html-->
                            <li><a href="">个人主页</a></li>
                            <!--好友 contacts.html-->
                            <li><a href="">好友</a></li>
                            <!--邮箱 mailbox.html-->
                            <li><a href="">邮箱</a></li>
                            <li class="divider"></li>
                            <!--注销 login.html-->
                            <li><a href="">注销</a></li>
                        </ul>
                    </div>
                    <!--菜单收放 图标-->
                    <div class="logo-element">
                        IN+
                    </div>
                </li>
                <!--仪表-->
                <li class="active">
                    <a href="index.html"><i class="fa fa-th-large"></i> <span class="nav-label">仪表</span> <span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <c:if test="${!empty(requestScope.frontMenuHashMap)}">
                            <c:forEach items="${requestScope.frontMenuHashMap.menuname}" step="1" var="i">
                                <li ><a title="${path}${i.menu_Url}" onclick="changePath(this)">${i.menu_Name}</a></li>
                            </c:forEach>
                        </c:if>
<%--                        <!--主页面 index.html   class="active" 点击亮起-->--%>
<%--                        <li ><a href="/firstweb/jsp/home.jsp">主页</a></li>--%>
<%--                        <!--仪表2 dashboard_2.html  href="jsp/dataAction!userData"-->--%>
<%--                        <li><a title="jsp/dataAction!userData" onclick="changePath(this)">用户管理</a></li>--%>
<%--                        <!--仪表3 dashboard_3.html-->--%>
<%--                        <li><a title="/firstweb/jsp/fileupload.jsp" onclick="changePath(this)">文件上传</a></li>--%>
<%--                        <!--仪表4 dashboard_4_1.html-->--%>
<%--                        <li><a href="">仪表4</a></li>--%>
<%--                        <!--仪表5 dashboard_5.html-->--%>
<%--                        <li><a href="">仪表5<span class="label label-primary pull-right">新</span></a></li>--%>
                    </ul>
                </li>
                <li>
                    <a href="layouts.html"><i class="fa fa-diamond"></i> <span class="nav-label">Layouts</span></a>
                </li>
                <li>
                    <a href="#"><i class="fa fa-bar-chart-o"></i> <span class="nav-label">Graphs</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level collapse">
                        <li><a href="graph_flot.html">Flot Charts</a></li>
                        <li><a href="graph_morris.html">Morris.js Charts</a></li>
                        <li><a href="graph_rickshaw.html">Rickshaw Charts</a></li>
                        <li><a href="graph_chartjs.html">Chart.js</a></li>
                        <li><a href="graph_chartist.html">Chartist</a></li>
                        <li><a href="c3.html">c3 charts</a></li>
                        <li><a href="graph_peity.html">Peity Charts</a></li>
                        <li><a href="graph_sparkline.html">Sparkline Charts</a></li>
                    </ul>
                </li>
                <li>
                    <a href="mailbox.html"><i class="fa fa-envelope"></i> <span class="nav-label">Mailbox </span><span class="label label-warning pull-right">16/24</span></a>
                    <ul class="nav nav-second-level collapse">
                        <li><a href="mailbox.html">Inbox</a></li>
                        <li><a href="mail_detail.html">Email view</a></li>
                        <li><a href="mail_compose.html">Compose email</a></li>
                        <li><a href="email_template.html">Email templates</a></li>
                    </ul>
                </li>
                <li>
                    <a href="metrics.html"><i class="fa fa-pie-chart"></i> <span class="nav-label">Metrics</span>  </a>
                </li>
                <li>
                    <a href="widgets.html"><i class="fa fa-flask"></i> <span class="nav-label">Widgets</span></a>
                </li>
                <li>
                    <a href="#"><i class="fa fa-edit"></i> <span class="nav-label">Forms</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level collapse">
                        <li><a href="form_basic.html">Basic form</a></li>
                        <li><a href="form_advanced.html">Advanced Plugins</a></li>
                        <li><a href="form_wizard.html">Wizard</a></li>
                        <li><a href="form_file_upload.html">File Upload</a></li>
                        <li><a href="form_editors.html">Text Editor</a></li>
                        <li><a href="form_markdown.html">Markdown</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#"><i class="fa fa-desktop"></i> <span class="nav-label">App Views</span>  <span class="pull-right label label-primary">SPECIAL</span></a>
                    <ul class="nav nav-second-level collapse">
                        <li><a href="contacts.html">Contacts</a></li>
                        <li><a href="profile.html">Profile</a></li>
                        <li><a href="profile_2.html">Profile v.2</a></li>
                        <li><a href="contacts_2.html">Contacts v.2</a></li>
                        <li><a href="projects.html">Projects</a></li>
                        <li><a href="project_detail.html">Project detail</a></li>
                        <li><a href="teams_board.html">Teams board</a></li>
                        <li><a href="social_feed.html">Social feed</a></li>
                        <li><a href="clients.html">Clients</a></li>
                        <li><a href="full_height.html">Outlook view</a></li>
                        <li><a href="vote_list.html">Vote list</a></li>
                        <li><a href="file_manager.html">File manager</a></li>
                        <li><a href="calendar.html">Calendar</a></li>
                        <li><a href="issue_tracker.html">Issue tracker</a></li>
                        <li><a href="blog.html">Blog</a></li>
                        <li><a href="article.html">Article</a></li>
                        <li><a href="faq.html">FAQ</a></li>
                        <li><a href="timeline.html">Timeline</a></li>
                        <li><a href="pin_board.html">Pin board</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#"><i class="fa fa-files-o"></i> <span class="nav-label">Other Pages</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level collapse">
                        <li><a href="search_results.html">Search results</a></li>
                        <li><a href="lockscreen.html">Lockscreen</a></li>
                        <li><a href="invoice.html">Invoice</a></li>
                        <li><a href="login.html">Login</a></li>
                        <li><a href="login_two_columns.html">Login v.2</a></li>
                        <li><a href="forgot_password.html">Forget password</a></li>
                        <li><a href="register.html">Register</a></li>
                        <li><a href="404.html">404 Page</a></li>
                        <li><a href="500.html">500 Page</a></li>
                        <li><a href="empty_page.html">Empty page</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#"><i class="fa fa-globe"></i> <span class="nav-label">Miscellaneous</span><span class="label label-info pull-right">NEW</span></a>
                    <ul class="nav nav-second-level collapse">
                        <li><a href="toastr_notifications.html">Notification</a></li>
                        <li><a href="nestable_list.html">Nestable list</a></li>
                        <li><a href="agile_board.html">Agile board</a></li>
                        <li><a href="timeline_2.html">Timeline v.2</a></li>
                        <li><a href="diff.html">Diff</a></li>
                        <li><a href="i18support.html">i18 support</a></li>
                        <li><a href="sweetalert.html">Sweet alert</a></li>
                        <li><a href="idle_timer.html">Idle timer</a></li>
                        <li><a href="truncate.html">Truncate</a></li>
                        <li><a href="spinners.html">Spinners</a></li>
                        <li><a href="tinycon.html">Live favicon</a></li>
                        <li><a href="google_maps.html">Google maps</a></li>
                        <li><a href="code_editor.html">Code editor</a></li>
                        <li><a href="modal_window.html">Modal window</a></li>
                        <li><a href="clipboard.html">Clipboard</a></li>
                        <li><a href="forum_main.html">Forum view</a></li>
                        <li><a href="validation.html">Validation</a></li>
                        <li><a href="tree_view.html">Tree view</a></li>
                        <li><a href="loading_buttons.html">Loading buttons</a></li>
                        <li><a href="chat_view.html">Chat view</a></li>
                        <li><a href="masonry.html">Masonry</a></li>
                        <li><a href="tour.html">Tour</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#"><i class="fa fa-flask"></i> <span class="nav-label">UI Elements</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level collapse">
                        <li><a href="typography.html">Typography</a></li>
                        <li><a href="icons.html">Icons</a></li>
                        <li><a href="draggable_panels.html">Draggable Panels</a></li> <li><a href="resizeable_panels.html">Resizeable Panels</a></li>
                        <li><a href="buttons.html">Buttons</a></li>
                        <li><a href="video.html">Video</a></li>
                        <li><a href="tabs_panels.html">Panels</a></li>
                        <li><a href="tabs.html">Tabs</a></li>
                        <li><a href="notifications.html">Notifications & Tooltips</a></li>
                        <li><a href="badges_labels.html">Badges, Labels, Progress</a></li>
                    </ul>
                </li>

                <li>
                    <a href="grid_options.html"><i class="fa fa-laptop"></i> <span class="nav-label">Grid options</span></a>
                </li>
                <li>
                    <a href="#"><i class="fa fa-table"></i> <span class="nav-label">Tables</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level collapse">
                        <li><a href="table_basic.html">Static Tables</a></li>
                        <li><a href="table_data_tables.html">Data Tables</a></li>
                        <li><a href="table_foo_table.html">Foo Tables</a></li>
                        <li><a href="jq_grid.html">jqGrid</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#"><i class="fa fa-shopping-cart"></i> <span class="nav-label">E-commerce</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level collapse">
                        <li><a href="ecommerce_products_grid.html">Products grid</a></li>
                        <li><a href="ecommerce_product_list.html">Products list</a></li>
                        <li><a href="ecommerce_product.html">Product edit</a></li>
                        <li><a href="ecommerce_product_detail.html">Product detail</a></li>
                        <li><a href="ecommerce-cart.html">Cart</a></li>
                        <li><a href="ecommerce-orders.html">Orders</a></li>
                        <li><a href="ecommerce_payments.html">Credit Card form</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#"><i class="fa fa-picture-o"></i> <span class="nav-label">Gallery</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level collapse">
                        <li><a href="basic_gallery.html">Lightbox Gallery</a></li>
                        <li><a href="slick_carousel.html">Slick Carousel</a></li>
                        <li><a href="carousel.html">Bootstrap Carousel</a></li>

                    </ul>
                </li>
                <li>
                    <a href="#"><i class="fa fa-sitemap"></i> <span class="nav-label">Menu Levels </span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level collapse">
                        <li>
                            <a href="#">Third Level <span class="fa arrow"></span></a>
                            <ul class="nav nav-third-level">
                                <li>
                                    <a href="#">Third Level Item</a>
                                </li>
                                <li>
                                    <a href="#">Third Level Item</a>
                                </li>
                                <li>
                                    <a href="#">Third Level Item</a>
                                </li>

                            </ul>
                        </li>
                        <li><a href="#">Second Level Item</a></li>
                        <li>
                            <a href="#">Second Level Item</a></li>
                        <li>
                            <a href="#">Second Level Item</a></li>
                    </ul>
                </li>
                <li>
                    <a href="css_animation.html"><i class="fa fa-magic"></i> <span class="nav-label">CSS Animations </span><span class="label label-info pull-right">62</span></a>
                </li>
                <li class="landing_link">
                    <a target="_blank" href="landing.html"><i class="fa fa-star"></i> <span class="nav-label">Landing Page</span> <span class="label label-warning pull-right">NEW</span></a>
                </li>
                <li class="special_link">
                    <a href="package.html"><i class="fa fa-database"></i> <span class="nav-label">Package</span></a>
                </li>
            </ul>

        </div>
    </nav>

    <div id="page-wrapper" class="gray-bg dashbard-1">
        <div class="row border-bottom">
            <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i> </a>
                    <form role="search" class="navbar-form-custom" action="search_results.html">
                        <div class="form-group">
                            <input type="text" placeholder="Search for something..." class="form-control" name="top-search" id="top-search">
                        </div>
                    </form>
                </div>
                <ul class="nav navbar-top-links navbar-right">
                    <li>
                        <span class="m-r-sm text-muted welcome-message">Welcome to INSPINIA+ Admin Theme.</span>
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                            <i class="fa fa-envelope"></i>  <span class="label label-warning">16</span>
                        </a>
                        <ul class="dropdown-menu dropdown-messages">
                            <li>
                                <div class="dropdown-messages-box">
                                    <a href="profile.html" class="pull-left">
                                        <img alt="image" class="img-circle" src=<%=path+"/jsp/img/a7.jp.jpg"%>>
                                    </a>
                                    <div class="media-body">
                                        <small class="pull-right">46h ago</small>
                                        <strong>Mike Loreipsum</strong> started following <strong>Monica Smith</strong>. <br>
                                        <small class="text-muted">3 days ago at 7:58 pm - 10.06.2014</small>
                                     </div>
                                </div>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <div class="dropdown-messages-box">
                                    <a href="profile.html" class="pull-left">
                                        <img alt="image" class="img-circle" src=<%=path+"/jsp/img/a4.jpg"%>>
                                    </a>
                                    <div class="media-body ">
                                        <small class="pull-right text-navy">5h ago</small>
                                        <strong>Chris Johnatan Overtunk</strong> started following <strong>Monica Smith</strong>. <br>
                                        <small class="text-muted">Yesterday 1:21 pm - 11.06.2014</small>
                                    </div>
                                </div>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <div class="dropdown-messages-box">
                                    <a href="profile.html" class="pull-left">
                                        <img alt="image" class="img-circle" src=<%=path+"/jsp/img/profile.jpg"%>>
                                    </a>
                                    <div class="media-body ">
                                        <small class="pull-right">23h ago</small>
                                        <strong>Monica Smith</strong> love <strong>Kim Smith</strong>. <br>
                                        <small class="text-muted">2 days ago at 2:30 am - 11.06.2014</small>
                                    </div>
                                </div>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <div class="text-center link-block">
                                    <a href="mailbox.html">
                                        <i class="fa fa-envelope"></i> <strong>Read All Messages</strong>
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                            <i class="fa fa-bell"></i>  <span class="label label-primary">8</span>
                        </a>
                        <ul class="dropdown-menu dropdown-alerts">
                            <li>
                                <a href="mailbox.html">
                                    <div>
                                        <i class="fa fa-envelope fa-fw"></i> You have 16 messages
                                        <span class="pull-right text-muted small">4 minutes ago</span>
                                    </div>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="profile.html">
                                    <div>
                                        <i class="fa fa-twitter fa-fw"></i> 3 New Followers
                                        <span class="pull-right text-muted small">12 minutes ago</span>
                                    </div>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="grid_options.html">
                                    <div>
                                        <i class="fa fa-upload fa-fw"></i> Server Rebooted
                                        <span class="pull-right text-muted small">4 minutes ago</span>
                                    </div>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <div class="text-center link-block">
                                    <a href="notifications.html">
                                        <strong>See All Alerts</strong>
                                        <i class="fa fa-angle-right"></i>
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </li>


                    <li>
                        <a href="login.html">
                            <i class="fa fa-sign-out"></i> Log out
                        </a>
                    </li>
                    <li>
                        <a class="right-sidebar-toggle">
                            <i class="fa fa-tasks"></i>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>

        <div class="row" style="height: 150ch">
            <iframe src="" id="myiframe"  frameborder="no" width="100%" height="100%"></iframe>
        </div>

    </div>


</div>

<!-- Mainly scripts -->
<script src=<%=path+"/js/jquery-2.1.1.js"%>></script>
<script src=<%=path+"/js/bootstrap.min.js"%>></script>
<script src=<%=path+"/js/plugins/metisMenu/jquery.metisMenu.js"%>></script>
<script src=<%=path+"/js/plugins/slimscroll/jquery.slimscroll.min.js"%>></script>

<!-- Flot -->
<script src=<%=path+"/js/plugins/flot/jquery.flot.js"%>></script>
<script src=<%=path+"/js/plugins/flot/jquery.flot.tooltip.min.js"%>></script>
<script src=<%=path+"/js/plugins/flot/jquery.flot.spline.js"%>></script>
<script src=<%=path+"/js/plugins/flot/jquery.flot.resize.js"%>></script>
<script src=<%=path+"/js/plugins/flot/jquery.flot.pie.js"%>></script>

<!-- Peity -->
<script src=<%=path+"/js/plugins/peity/jquery.peity.min.js"%>></script>
<script src=<%=path+"/js/demo/peity-demo.js"%>></script>

<!-- Custom and plugin javascript -->
<script src=<%=path+"/js/inspinia.js"%>></script>
<script src=<%=path+"/js/plugins/pace/pace.min.js"%>></script>

<!-- jQuery UI -->
<script src=<%=path+"/js/plugins/jquery-ui/jquery-ui.min.js"%>></script>

<!-- GITTER -->
<script src=<%=path+"/js/plugins/gritter/jquery.gritter.min.js"%>></script>

<!-- Sparkline -->
<script src=<%=path+"/js/plugins/sparkline/jquery.sparkline.min.js"%>></script>

<!-- Sparkline demo data  -->
<script src=<%=path+"/js/demo/sparkline-demo.js"%>></script>

<!-- ChartJS-->
<script src=<%=path+"/js/plugins/chartJs/Chart.min.js"%>></script>

<!-- Toastr -->
<script src=<%=path+"/js/plugins/toastr/toastr.min.js"%>></script>
<script type="text/javascript" src=<%=path+"/js/menu.js"%>></script>
<script type="text/javascript" src=<%=path+"/js/myhome.js"%>></script>

<script>
    $(document).ready(function() {
        var username = $("#username").val();
        // alert(username);
        setTimeout(function() {
            toastr.options = {
                closeButton: true,
                progressBar: true,
                showMethod: 'slideDown',
                timeOut: 4000
            };
            toastr.success(username, '欢迎来到管理页面');

        }, 1300);


        // var data1 = [
        //     [0,4],[1,8],[2,5],[3,10],[4,4],[5,16],[6,5],[7,11],[8,6],[9,11],[10,30],[11,10],[12,13],[13,4],[14,3],[15,3],[16,6]
        // ];
        // var data2 = [
        //     [0,1],[1,0],[2,2],[3,0],[4,1],[5,3],[6,1],[7,5],[8,2],[9,3],[10,2],[11,1],[12,0],[13,2],[14,8],[15,0],[16,0]
        // ];
        // $("#flot-dashboard-chart").length && $.plot($("#flot-dashboard-chart"), [
        //         data1, data2
        //     ],
        //     {
        //         series: {
        //             lines: {
        //                 show: false,
        //                 fill: true
        //             },
        //             splines: {
        //                 show: true,
        //                 tension: 0.4,
        //                 lineWidth: 1,
        //                 fill: 0.4
        //             },
        //             points: {
        //                 radius: 0,
        //                 show: true
        //             },
        //             shadowSize: 2
        //         },
        //         grid: {
        //             hoverable: true,
        //             clickable: true,
        //             tickColor: "#d5d5d5",
        //             borderWidth: 1,
        //             color: '#d5d5d5'
        //         },
        //         colors: ["#1ab394", "#1C84C6"],
        //         xaxis:{
        //         },
        //         yaxis: {
        //             ticks: 4
        //         },
        //         tooltip: false
        //     }
        // );
        //
        // var doughnutData = [
        //     {
        //         value: 300,
        //         color: "#a3e1d4",
        //         highlight: "#1ab394",
        //         label: "App"
        //     },
        //     {
        //         value: 50,
        //         color: "#dedede",
        //         highlight: "#1ab394",
        //         label: "Software"
        //     },
        //     {
        //         value: 100,
        //         color: "#A4CEE8",
        //         highlight: "#1ab394",
        //         label: "Laptop"
        //     }
        // ];
        //
        // var doughnutOptions = {
        //     segmentShowStroke: true,
        //     segmentStrokeColor: "#fff",
        //     segmentStrokeWidth: 2,
        //     percentageInnerCutout: 45, // This is 0 for Pie charts
        //     animationSteps: 100,
        //     animationEasing: "easeOutBounce",
        //     animateRotate: true,
        //     animateScale: false
        // };
        //
        // var ctx = document.getElementById("doughnutChart").getContext("2d");
        // var DoughnutChart = new Chart(ctx).Doughnut(doughnutData, doughnutOptions);
        //
        // var polarData = [
        //     {
        //         value: 300,
        //         color: "#a3e1d4",
        //         highlight: "#1ab394",
        //         label: "App"
        //     },
        //     {
        //         value: 140,
        //         color: "#dedede",
        //         highlight: "#1ab394",
        //         label: "Software"
        //     },
        //     {
        //         value: 200,
        //         color: "#A4CEE8",
        //         highlight: "#1ab394",
        //         label: "Laptop"
        //     }
        // ];
        //
        // var polarOptions = {
        //     scaleShowLabelBackdrop: true,
        //     scaleBackdropColor: "rgba(255,255,255,0.75)",
        //     scaleBeginAtZero: true,
        //     scaleBackdropPaddingY: 1,
        //     scaleBackdropPaddingX: 1,
        //     scaleShowLine: true,
        //     segmentShowStroke: true,
        //     segmentStrokeColor: "#fff",
        //     segmentStrokeWidth: 2,
        //     animationSteps: 100,
        //     animationEasing: "easeOutBounce",
        //     animateRotate: true,
        //     animateScale: false
        // };
        // var ctx = document.getElementById("polarChart").getContext("2d");
        // var Polarchart = new Chart(ctx).PolarArea(polarData, polarOptions);

    });
</script>
</body>
</html>
