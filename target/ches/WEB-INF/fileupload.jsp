<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/7/29
  Time: 17:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>文件上传</title>

    <link rel="stylesheet" href=<%=path+"/css/bootstrap.min.css"%>>
    <link rel="stylesheet" href=<%=path+"/font-awesome/css/font-awesome.css"%>>
    <link rel="stylesheet" href=<%=path+"/css/animate.css"%>>
    <link rel="stylesheet" href=<%=path+"/css/plugins/dropzone/basic.css"%> >
    <link rel="stylesheet" href=<%=path+"/css/plugins/dropzone/dropzone.css"%>>
    <link rel="stylesheet" href=<%=path+"/css/style.css"%>>

</head>

<body>

<div class="row wrapper border-bottom white-bg page-heading">
    <div class="col-lg-10">
        <h2>文件上传</h2>
        <ol class="breadcrumb">
            <li>
                <a href="index.html">Home</a>
            </li>
            <li>
                <a>Forms</a>
            </li>
            <li class="active">
                <strong>File upload</strong>
            </li>
        </ol>
    </div>
    <div class="col-lg-2">

    </div>
</div>
<div class="wrapper wrapper-content animated fadeIn">
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>Dropzone Area</h5>
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
                    <form id="my-awesome-dropzone" class="dropzone" action="#" enctype="multipart/form-data">
                        <div class="dropzone-previews"></div>
                        <button type="submit" class="btn btn-primary pull-right">上传!</button>
                    </form>
<%--                    <div>--%>
<%--                        <div class="m text-right"><small>DropzoneJS is an open source library that provides drag'n'drop file uploads with image previews: <a href="https://github.com/enyo/dropzone" target="_blank">https://github.com/enyo/dropzone</a></small> </div>--%>
<%--                    </div>--%>
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

<!-- Custom and plugin javascript -->
<script src=<%=path+"/js/inspinia.js"%>></script>
<script src=<%=path+"/js/plugins/pace/pace.min.js"%>></script>

<!-- DROPZONE -->
<script src=<%=path+"/js/plugins/dropzone/dropzone.js"%>></script>


<script>
    $(document).ready(function(){

        Dropzone.options.myAwesomeDropzone = {

            autoProcessQueue: false,
            uploadMultiple: true,
            parallelUploads: 100,
            maxFiles: 100,

            // Dropzone settings
            init: function() {
                var myDropzone = this;

                this.element.querySelector("button[type=submit]").addEventListener("click", function(e) {
                    e.preventDefault();
                    e.stopPropagation();
                    myDropzone.processQueue();
                });
                this.on("sendingmultiple", function() {
                });
                this.on("successmultiple", function(files, response) {
                });
                this.on("errormultiple", function(files, response) {
                });
            }

        }

    });
</script>

</body>

</html>

