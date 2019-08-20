<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/7/26
  Time: 14:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>在线文档后台管理系统</title>
<%--  <link rel="shortcut icon" type="image/x-icon" href="Public/images/ico.ico">--%>
  <link rel="stylesheet" href=<%=path+"/css/all.css"%>>
  <link rel="stylesheet" href=<%=path+"/css/dialog.css"%>>
  <link rel="stylesheet" href=<%=path+"/css/bulma.min.css"%>>
  <link rel="stylesheet" href=<%=path+"/css/admin_login.css"%>>
</head>

<body>
<section class="section">
  <div class="container">
    <h2 class="title is-2 is-centered">Log In</h2>
    <div class="field" id="usernameBox">
      <label class="label">Username</label>
      <div class="control has-icons-left has-icons-right">
        <input class="input" type="text" placeholder="Text input" maxlength="10" id="userName">
        <span class="icon is-small is-left">
                        <i class="fas fa-user-secret" style="font-size: 25px"></i>
                    </span>
        <span class="icon is-small is-right">
                        <!-- <i class="fas fa-check"></i> -->
                    </span>
      </div>
    </div>
    <div class="field" id="passwordBox">
      <label class="label">Password</label>
      <div class="control has-icons-left">
        <input class="input" type="password" placeholder="Password" maxlength="12" id="password">
        <span class="icon is-small is-left">
                        <i class="fas fa-key" style="font-size: 25px"></i>
                    </span>
      </div>
    </div>
    <div class="field" id="codeBox">
      <label class="label">Code</label>
      <div class="columns is-vcentered">
        <div class="column is-one-quarter" id="imgs">
          <img src="" alt="" id="img">
        </div>
        <div class="column">
          <input type="text" name="" class="input" placeholder="Code" id="code">
        </div>
      </div>


    </div>
    <div class="field" id="buttonBox">
      <p class="control">
        <!-- <button class="button is-success is-medium" onclick="login()">Login</button> -->
        <a class="button is-success is-medium" href=<%=path+"/WEB-INF/hello.jsp"%>>
                        <span class="icon is-medium">
                            <i class="fal fa-sign-in-alt"></i>
                        </span>
          <span>Login</span>
        </a>
      </p>
    </div>
  </div>
</section>

<script src=<%=path+"/js/jquery.js"%>></script>
<script src=<%=path+"/js/zepto.min.js"%>></script>
<script src=<%=path+"/js/dialog.min.js"%>></script>
<script src=<%=path+"/js/login.js"%>></script>
</body>

</html>
