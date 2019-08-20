<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/7/29
  Time: 15:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en" >

<head>
    <meta charset="UTF-8">
    <title>登录注册表单</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href=<%=path+"/css/bulma.min.css"%>>
    <!--图标库-->
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css'>
<%--    <link rel="stylesheet" href=<%=path+"/css/all.css"%>>--%>
    <!--响应式框架-->
    <link rel='stylesheet' href='https://ajax.aspnetcdn.com/ajax/bootstrap/4.2.1/css/bootstrap.min.css'>
<%--    <link rel="stylesheet" href=<%=path+"/css/bootstrap.min.css"%> >--%>
    <!--主要样式-->
    <link rel="stylesheet" href=<%=path+"/css/stylelogin.css"%>>


</head>

<body>

<div class="container">

    <div class="card-wrap">

        <div class="card border-0 shadow card--welcome is-show" id="welcome">
            <div class="card-body">
                <h2 class="card-title">欢迎光临</h2>
                <p>欢迎进入登录页面</p>
                <div class="btn-wrap">
                    <div class="field-body">
                        <div class="field">
                            <p class="control">
                                <input class="input is-rounded" type="text" placeholder="请输入你需要输入的文档名称">
                            </p>
                        </div>
                        <div class="field" style="margin-left: 30px;">
                            <p class="control">
                                <a class="button  is-warning" >
                                <span class="icon is-small">
                                    <i class="fas fa-check"></i>
                                </span>
                                    <span>搜索文档</span>
                                </a>
                            </p>
                        </div>
                    </div>
                    <a class="btn btn-lg btn-register js-btn" data-target="register" style="margin-left: 20%;" id="frontreg">注册</a>
                    <a class="btn btn-lg btn-login js-btn" data-target="login" style="margin-left: 20%;">登录</a>
                </div>
            </div>
        </div>

        <div class="card border-0 shadow card--register" id="register">
            <div class="card-body">
                <h2 class="card-title">会员注册</h2>
                <p class="card-text">第三方注册</p>
                <p class="badge-wrap"><a class="badge"><i class="fab fa-facebook-f"></i></a><a class="badge"><i class="fab fa-google"></i></a><a class="badge"><i class="fab fa-twitter"></i></a><a class="badge"><i class="fab fa-github"></i></a></p>
                <p>或者使用您的电子邮箱进行注册</p>
                <form action=<%=path+"/jsp/testAction!reg"%> method="post" id="regform">
                    <div class="form-group">
                        <input class="form-control" type="text" placeholder="名称" required="required" name="frontUsers.userName"/>
                    </div>
                    <div class="form-group">
                        <input class="form-control" type="email" placeholder="邮箱" required="required" name="frontUsers.userEmall"/>
                    </div>
                    <div class="form-group">
                        <input class="form-control" type="tel" placeholder="手机号码" required="required" />
                    </div>
                    <div class="form-group">
                        <div class="control" style="width: 200px">
                            <span>性别：</span>
                            <label class="radio">
                                <input type="radio" name="frontUsers.sex" value="男" checked>
                                男
                            </label>
                            <label class="radio">
                                <input type="radio" name="frontUsers.sex" value="女">
                                女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <span>学历：</span>
                        <select id="educations" style='width: 200px'>

                            </select>
                        <input type="hidden" id="education_Id" name="frontUsers.education_Id">
<%--                        <s:select list="#education"  label="abc" listKey="key" listValue="value" value="#request.aa"  headerKey="0" headerValue="aabb"></s:select>--%>
                    </div>
                    <div class="form-group">
                        <span>职业：</span>
                        <select id="occupations" style='width: 200px'>

                          </select>
                        <input type="hidden" id="occupation_Id" name="frontUsers.occupation_Id">
<%--                        <s:select list="#request.map"  label="abc" listKey="key" listValue="value" value="#request.aa"  headerKey="0" headerValue="aabb"></s:select>--%>
                    </div>
                    <div class="form-group">
                        <input class="form-control" type="password" placeholder="密码" required="required" name="frontUsers.userPwd"/>
                    </div>
                    <div class="form-group">
                        <div class="field">
                            <div class="file is-right is-info">
                                <label class="file-label">
                                    <input class="file-input" type="file" name="myfile" id="myfile">
                                    <span class="file-cta">
                                        <span class="file-icon">
                                          <i class="fas fa-upload"></i>
                                        </span>
                                        <span class="file-label">
                                          添加头像
                                        </span>
                                      </span>
                                    <span class="file-name" name="resume" id="resume" style="width: 100px">

                                  </span>
                                </label>
                                <a class="button is-warning " id="filess">
                                    <span class="icon">
                                        <i class="fas fa-images"></i>
                                    </span>
                                    <span>上传头像</span>
                                </a>
                            </div>
                        </div>

                    </div>
                    <button class="btn btn-lg" id="reg">注册</button>
                </form>
            </div>
            <button class="btn btn-back js-btn" data-target="welcome"><i class="fas fa-angle-left"></i></button>
        </div>

        <div class="card border-0 shadow card--login" id="login">
            <div class="card-body">
                <h2 class="card-title">欢迎登录！</h2>
                <p>第三方登录</p>
                <p class="badge-wrap"><a class="badge"><i class="fab fa-facebook-f"></i></a><a class="badge"><i class="fab fa-google"></i></a><a class="badge"><i class="fab fa-twitter"></i></a><a class="badge"><i class="fab fa-github"></i></a></p>
                <p>或用邮箱登录</p>
<%--                <form action="jsp/loginAction" method="post">--%>
                    <div class="form-group">
                        <input class="form-control" type="text" id="loginusername"  placeholder="用户名"  required="required"/>
                    </div>
                    <div class="form-group">
                        <input class="form-control" type="password" id="loginpwd"  placeholder="密码" required="required"/>
                    </div>
                    <div class="form-group">
                        <input class="form-control" type="text" id="loginyzm" name="yzm" placeholder="验证码"  required="required"/>
                        <img src=<%=path+"image/imageyzm.action"%>  id="imgCode">
                    </div>
                    <p>看不清验证码时,点击图片更换</p>
                    <p><a href="#">忘记密码?</a></p>
                    <button class="btn btn-lg"  id="frontlogin">登录</button>
<%--                </form>--%>
            </div>
            <button class="btn btn-back js-btn" data-target="welcome"><i class="fas fa-angle-left"></i></button>
        </div>
    </div>

</div>
<script type="text/javascript" src=<%=path+"/js/jquery.js"%>> </script>
<script type="text/javascript" src=<%=path+"/js/jquery-ui.js" %>></script>
<script type="text/javascript" src=<%=path+"/js/json2.js"%>> </script>
<script type="text/javascript" src=<%=path+"/js/util.js"%>></script>
<script src=<%=path+"/js/ajaxfileupload.js"%>></script>
<script>
    $(function () {
        //图片预览
        $("#myfile").on(
            "change",function readFile(){
            // var file = obj.files[0];
            // var reader = new FileReader();
            // reader.readAsDataURL(file);
            // reader.onload = function(e){
            //     $('#imgModal img').attr('src',this.result);
            // }
            $("#resume").html($("#myfile").val());
        });
        $("#filess").on(
            "click",function () {
                // var send = {
                //     "myfile":$("#myfile").val()
                // }
                // jQAJAX("filetest/uploadAction!upload", send, function (msg) {
                //         var ob = JSON.parse(msg);
                // })


                $.ajaxFileUpload({
                    url: getRootPath()+"/filetest/uploadAction!upload", //用于文件上传的服务器端请求地址
                    secureuri: false, //是否需要安全协议，一般设置为false
                    fileElementId: "myfile", //文件上传域的ID
                    dataType: "json", //返回值类型 一般设置为json
                    success: function (msg) {
                        // var ob = JSON.parse(msg);
                        alert(msg.sss);
                    },error: function(){
                        alert("访问出错");
                    }
                })
            }
        );

        //点击验证码进行更换
        $("#imgCode").on({
            "click":function(){
                // alert(111111);
//		jQAJAX("../ImgCodeServlet", sendData, function (msg) {
                $("#imgCode").attr("src",getRootPath()+"/login/imageAction!verificAtion?time=" + new Date().getTime());
//		})
            }
        });
        //点击注册时需要给隐藏域赋值
        $("#reg").on(
            "click",function () {
                //将下来框中的ID拿到
                $("#education_Id").val($("#educations").val());
                $("#occupation_Id").val($("#occupations").val());
                $("#regform").submit();

            }
        );
        //给跳转注册的按钮挂监听
        $("#frontreg").on(
            "click",function () {
                var send = {
                    "frontreg":"frontreg"
                }
                jQAJAX(getRootPath()+"/login/loginAction!dropdownBox", send, function (msg) {
                        var ob = JSON.parse(msg);
                        // var ob = eval('(' + msg + ')');
                        var listedu = ob.education;
                        var listocc = ob.occupation;
                        // alert(listedu);
                        var educations = $("#educations");
                        var occupations = $("#occupations");
                        educations.empty();
                        occupations.empty();
                        if (listedu.length > 0) {
                            for (var i = 0; i < listedu.length ; i++) {
                                educations.append(
                                    "<option value='"+listedu[i].education_Id+"'>"+listedu[i].education_Name+"</option>"
                                );
                            }
                        }
                    if (listocc.length > 0) {
                        for (var j = 0; j < listocc.length ; j++) {
                            occupations.append(
                                "<option value='"+listocc[j].occupation_Id+"'>"+listocc[j].occupation_Name+"</option>"
                            );
                        }
                    }
                })
            }
        );
        //登录时验证用户名是否可用
        $("#loginusername").on(
            "blur", function () {
                var username = $(this).val();//注册用户名
                // alert(username);
                if (username == '') {
                    alert("用户名不能为空");

                } else {
                    var send = {
                        "userName": username
                    }
                    jQAJAX(getRootPath()+"/login/loginAction!TestLogin", send, function (msg) {
                        var ob = eval('(' + msg + ')');
                        if (ob.sss!="可以登录")
                        {
                            $("#loginusername").val("");
                            alert(ob.sss);


                        }

                    })
                }

            });
        //登录
        $("#frontlogin").on(
            "click", function () {
                var loginusername = $("#loginusername").val();
                var loginpwd = $("#loginpwd").val();
                var loginyzm = $("#loginyzm").val();
                // alert(loginusername);
                var send = {
                    "loginusername": loginusername,
                    "loginpwd": loginpwd,
                    "loginyzm": loginyzm
                }
                jQAJAX(getRootPath()+"/login/loginAction", send, function (msg) {
                    var ob = eval('(' + msg + ')');
                    if((ob.ver)=="登录成功"){
                        // alert(ob.ver);http://localhost:8080/firstweb/jsp/home.jsp"
                        window.location.href = getRootPath()+"/jsp/dataAction!dynamicMenu";
                    }else{
                        $("#imgCode").attr("src",getRootPath()+"/login/imageAction!verificAtion?time=" + new Date().getTime());
                        alert(ob.ver);
                    }

                })
            }
        );
    });

</script>
<script src=<%=path+"/js/frontlogin.js"%>></script>
</body>
</html>