<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/7/28
  Time: 18:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>文档管理</title>
    <link rel="stylesheet" href=<%=path+"/css/bulma.min.css"%>>
    <link rel="stylesheet" href=<%=path+"/css/bootstrap.min.css"%>>
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
        <h2>文档管理</h2>
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
                    <a class="button is-info is-outlined download" href=<%=path+"/admin/downLoad.action?downPath=我的问题.txt"%>>我要下载</a>
                    <a class="button is-success is-outlined">我要上传</a>
                    <a class="button is-danger is-outlined">个人信息</a>
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
                                <th>文档标题</th>
                                <th>上传人</th>
                                <th>上传时间</th>
                                <th>下载积分</th>
                                <th>文档类型</th>
                                <th>下载次数</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr class="gradeX">
                                <td>Trident</td>
                                <td>Internet
                                    Explorer 4.0
                                </td>
                                <td>Win 95+</td>
                                <td class="center">
                                    <button class="ladda-button ladda-button-demo btn btn-warning"  data-style="zoom-in">添加</button>
                                    <button class="ladda-button ladda-button-demos btn btn-info"  data-style="zoom-in">删除</button>
                                    <button class="ladda-button ladda-button-demoss btn btn-primary"  data-style="zoom-in">修改</button>
                                </td>
                                <td class="center">X</td>
                                <td class="center">X</td>
                            </tr>
                            </tbody>
                            <tfoot>
                            <tr>
                                <th>文档标题</th>
                                <th>上传人</th>
                                <th>上传时间</th>
                                <th>下载积分</th>
                                <th>文档类型</th>
                                <th>下载次数</th>
                            </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
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
        // $(".download").on(
        //     "cilck",function () {
        //         var downloadFileName = "新建文本文档";
        //         var downName = "新建文本文档";
        //         var send = {
        //             "downloadFileName":downloadFileName,
        //             "downName":
        //         }
        //         jQAJAX(getRootPath()+"/filetest/Download", send, function (msg) {
        //
        //
        //         })
        //     }
        // );

    });

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
</body>
</html>
