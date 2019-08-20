
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/7/28
  Time: 18:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>用户管理</title>
<%--    <link rel="stylesheet" href=<%=path+"/css/bulma.min.css"%>>--%>
    <link rel="stylesheet" href=<%=path+"/css/bootstrap.min.css"%> >
    <link rel="stylesheet" href=<%=path+"/font-awesome/css/font-awesome.css"%> >

    <link rel="stylesheet" href=<%=path+"/css/plugins/dataTables/datatables.min.css"%>>
    <!-- Ladda style -->
    <link rel="stylesheet" href=<%=path+"/css/plugins/ladda/ladda-themeless.min.css" %>>

    <link rel="stylesheet" href=<%=path+"/css/animate.css"%> >
    <link rel="stylesheet" href=<%=path+"/css/style.css"%> >

</head>
<body>
    <div class="row wrapper border-bottom white-bg page-heading">
        <div class="col-lg-10">
            <h2>用户管理</h2>
<%--            <div class="text-center">--%>
                <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#myModal" id="adduser">
                    添加人员
                </button>
<%--            </div>--%>
            <!-- //弹框 -->
            <div class="modal inmodal" id="myModal" tabindex="-1" role="dialog" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content animated bounceInRight">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                            <i class="fa fa-laptop modal-icon"></i>
                            <h4 class="modal-title">添加人员</h4>
                            <small class="font-bold">温馨提示：名称和邮箱为必填项哟！</small>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <input class="form-control" type="text" placeholder="名称" required="required" name="frontUser.userName"/>
                            </div>
                            <div class="form-group">
                                <input class="form-control" type="email" placeholder="邮箱" required="required" name="frontUser.userEmall"/>
                            </div>
                            <div class="form-group">
                                <input class="form-control" type="tel" placeholder="手机号码" required="required" name="frontUser.userTel"/>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-white" data-dismiss="modal">返回</button>
                            <button type="button" class="btn btn-primary" data-dismiss="modal">提交</button>
                        </div>
                    </div>
                </div>
            </div>


            <ol class="breadcrumb">
                <li>
                    <a href="index.html">Home</a>
                </li>
                <li>
                    <a>Tables</a>
                </li>
                <li class="active">
                    <strong>Data Tables</strong>
                </li>
            </ol>
        </div>
        <div class="col-lg-2">

        </div>
    </div>
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
<%--                        <div class="field-body">--%>
<%--                            <div class="field">--%>
<%--                                <p class="control">--%>
<%--                                    <input class="input is-rounded" type="text" placeholder="请输入你需要输入的文档名称">--%>
<%--                                </p>--%>
<%--                            </div>--%>
<%--                            <div class="field" style="margin-left: 30px;">--%>
<%--                                <p class="control">--%>
<%--                                    <a class="button  is-warning" >--%>
<%--                                <span class="icon is-small">--%>
<%--                                    <i class="fas fa-check"></i>--%>
<%--                                </span>--%>
<%--                                        <span>搜索</span>--%>
<%--                                    </a>--%>
<%--                                </p>--%>
<%--                            </div>--%>
<%--                        </div>--%>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                <i class="fa fa-wrench"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                                <li><a href="#">Config option 1</a>
                                </li>
                                <li><a href="#">Config option 2</a>
                                </li>
                            </ul>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">

                        <div class="table-responsive">
                            <table class="table table-striped table-bordered table-hover dataTables-example" >
                                <thead>
                                <tr>
                                    <th>用户名</th>
                                    <th>用户邮箱</th>
                                    <th>学历</th>
                                    <th>性别</th>
                                    <th>职业</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
<%--                                <s:iterator value="list" var="i">--%>
<%--                                    <tr class="gradeX">--%>
<%--                                        <td><s:property value="#i.userName"></s:property></td>--%>
<%--                                        <td><s:property value="#i.userEmall"></s:property></td>--%>
<%--                                        <td>硕士</td>s--%>
<%--                                        <td class="center">--%>
<%--                                            男--%>
<%--                                        </td>--%>
<%--                                        <td class="center">程序员</td>--%>
<%--                                        <td>--%>
<%--                                            <button class="ladda-button ladda-button-demos btn btn-info"  data-style="zoom-in">删除</button>--%>
<%--                                            <button class="ladda-button ladda-button-demoss btn btn-primary"  data-style="zoom-in">修改</button></td>--%>
<%--                                    </tr>--%>
<%--                                </s:iterator>--%>
                                <c:forEach items="${list}" step="1" var="i">
                                    <tr class="gradeX">
                                        <td>${i.userName}</td>
                                        <td>${i.userEmall}</td>
                                        <td>${i.education_Name}</td>
                                        <td class="center">
                                                ${i.sex}
                                        </td>
                                        <td class="center">${i.occupation_Name}</td>
                                        <td>
                                            <button type="button" class="btn btn-info deluser" data-toggle="modal" data-target="#myModal6">
                                                删除
                                            </button>
                                            <button type="button" class="btn btn-primary upuser" data-toggle="modal" data-target="#myModal5">
                                               修改
                                            </button>
                                    </tr>
                                </c:forEach>
<%--                                <tr class="gradeX">--%>
<%--                                    <td>Trident</td>--%>
<%--                                    <td>Internet--%>
<%--                                        Explorer 4.0--%>
<%--                                    </td>--%>
<%--                                    <td>Win 95+</td>--%>
<%--                                    <td class="center">--%>
<%--                                        <button class="ladda-button ladda-button-demo btn btn-warning"  data-style="zoom-in">添加</button>--%>
<%--                                        <button class="ladda-button ladda-button-demos btn btn-info"  data-style="zoom-in">删除</button>--%>
<%--                                        <button class="ladda-button ladda-button-demoss btn btn-primary"  data-style="zoom-in">修改</button>--%>
<%--                                    </td>--%>
<%--                                    <td class="center">X</td>--%>
<%--                                    <td>Win 95+</td>--%>
<%--                                </tr>--%>
                                </tbody>
                                <tfoot>
                                <tr>
                                    <th>用户名</th>
                                    <th>用户邮箱</th>
                                    <th>学历</th>
                                    <th>性别</th>
                                    <th>职业</th>
                                    <th>操作</th>
                                </tr>
                                </tfoot>
                            </table>
                        </div>
                        <div class="modal inmodal fade" id="myModal5" tabindex="-1" role="dialog"  aria-hidden="true">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                        <h4 class="modal-title">修改信息</h4>
                                        <small class="font-bold">温馨提示：修改的信息是没有办法返回的呀！</small>
                                    </div>
                                    <div class="modal-body">
<%--                                        内容--%>
                                    <div class="form-group">
                                        <span>名字：</span>
                                        <input class="form-control" type="text" placeholder="名称" required="required" name="frontUser.userName" id="upname"/>
                                    </div>
                                    <div class="form-group">
                                        <span>邮箱：</span>
                                        <input class="form-control" type="email" placeholder="邮箱" required="required" name="frontUser.userEmall" id="emall"/>
                                    </div>
                                    <div class="form-group">
                                        <span>电话号码：</span>
                                        <input class="form-control" type="tel" placeholder="手机号码" required="required" name="frontUser.userTel" id="tel"/>
                                    </div>
                                    </div>

                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-white" data-dismiss="modal">返回</button>
                                        <button type="button" class="btn btn-primary" data-dismiss="modal">提交</button>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="modal inmodal fade" id="myModal6" tabindex="-1" role="dialog"  aria-hidden="true">
                            <div class="modal-dialog modal-sm">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                        <h4 class="modal-title">删除人员</h4>
                                    </div>
                                    <div class="modal-body">
                                        <p id="xingxi"></p>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-white" data-dismiss="modal">取消</button>
                                        <button type="button" class="btn btn-primary" data-dismiss="modal">确定</button>
                                    </div>
                                </div>
                            </div>
                        </div>
<%--                        <div class="control" style="text-align:center;">--%>
<%--                            <button class="button is-primary" id="topweek">上一页</button>--%>
<%--                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>
<%--                            <button class="button is-primary" id="lowerweek">下一页</button>--%>
<%--                        </div>--%>
                    </div>
                </div>
            </div>
        </div>
    </div>
        <!-- Mainly scripts -->
        <script src=<%=path+"/js/jquery-2.1.1.js"%>></script>
        <script src=<%=path+"/js/bootstrap.min.js"%>></script>
        <script src=<%=path+"/js/plugins/metisMenu/jquery.metisMenu.js"%>></script>
        <script src=<%=path+"/js/plugins/slimscroll/jquery.slimscroll.min.js"%>></script>
        <script src=<%=path+"/js/plugins/jeditable/jquery.jeditable.js"%>></script>

        <script src=<%=path+"/js/plugins/dataTables/datatables.min.js"%>></script>

        <!-- Custom and plugin javascript -->
        <script src=<%=path+"/js/inspinia.js"%>></script>
        <script src=<%=path+"/js/plugins/pace/pace.min.js"%>></script>

        <!-- Ladda -->
        <script src=<%=path+"/js/plugins/ladda/spin.min.js"%>></script>
        <script src=<%=path+"/js/plugins/ladda/ladda.min.js"%>></script>
        <script src=<%=path+"/js/plugins/ladda/ladda.jquery.min.js"%>></script>
        <!-- Page-Level Scripts -->
        <script>
            $(document).ready(function(){

                // Bind normal buttons
                $( '.ladda-button' ).ladda( 'bind', { timeout: 2000 } );

                // Bind progress buttons and simulate loading progress
                Ladda.bind( '.progress-demo .ladda-button',{
                    callback: function( instance ){
                        // alert(11111);
                        var progress = 0;
                        var interval = setInterval( function(){
                            progress = Math.min( progress + Math.random() * 0.1, 1 );
                            instance.setProgress( progress );

                            if( progress === 1 ){
                                instance.stop();
                                clearInterval( interval );
                            }
                        }, 200 );
                    }
                });


                var l = $( '.ladda-button-demo' ).ladda();

                l.click(function(){
                    // Start loading
                    l.ladda( 'start' );
                    // alert(2222);
                    // Timeout example
                    // Do something in backend and then stop ladda
                    setTimeout(function(){
                        l.ladda('stop');
                    },12000)


                });
                $('.dataTables-example').DataTable({
                    dom: '<"html5buttons"B>lTfgitp',
                    buttons: [
                        { extend: 'copy'},
                        {extend: 'csv'},
                        {extend: 'excel', title: 'ExampleFile'},
                        {extend: 'pdf', title: 'ExampleFile'},

                        {extend: 'print',
                            customize: function (win){
                                $(win.document.body).addClass('white-bg');
                                $(win.document.body).css('font-size', '10px');

                                $(win.document.body).find('table')
                                    .addClass('compact')
                                    .css('font-size', 'inherit');
                            }
                        }
                    ]

                });


                /* Init DataTables */
                var oTable = $('#editable').DataTable();

                /* Apply the jEditable handlers to the table */
                oTable.$('td').editable( '../example_ajax.php', {
                    "callback": function( sValue, y ) {
                        var aPos = oTable.fnGetPosition( this );
                        oTable.fnUpdate( sValue, aPos[0], aPos[1] );
                    },
                    "submitdata": function ( value, settings ) {
                        return {
                            "row_id": this.parentNode.getAttribute('id'),
                            "column": oTable.fnGetPosition( this )[2]
                        };
                    },

                    "width": "90%",
                    "height": "100%"
                } );
            });
            $("#DataTables_Table_0_info").text("用户数据如下");
            function fnClickAddRow() {
                $('#editable').dataTable().fnAddData( [
                    "Custom row",
                    "New row",
                    "New row",
                    "New row",
                    "New row",
                    "New row"] );

            }
            $(document).ready(function (){



            });

        </script>
    <script>
        $(function () {
            //修改
            $(".upuser").on(
                "click", function () {
                    //拿父类
                    var parentNode = $(this).parents("tr");
                    //拿子类集合
                    var childArr = parentNode.eq(0).children("td");
                    $("#upname").val(childArr.eq(0).text());//名字
                    $("#emall").val(childArr.eq(1).text());//邮箱
                    // alert($("#upname").text());

                }
            );
            //删除
            $(".deluser").on(
                "click",function () {
                    //拿父类
                    var parentNode = $(this).parents("tr");
                    //拿子类集合
                    var childArr = parentNode.eq(0).children("td");
                    $("#xingxi").text("你是否要删除有关于"+childArr.eq(0).text()+"所有信息");
                }
            );
        });
    </script>
    </body>
</html>
