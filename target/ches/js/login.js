//切换图片
$('#img').click(function(){
    $('#img').prop('src','index.php?m=admin&c=Common&a=code&v='+Math.random());
});
//提交登录
function login(){
    //进行输入是否为空判断
    if($('#userName').val()==''||$('#password').val()==''){
        // alert('输入的账号密码不能为空');
        popup({type:'tip',msg:"输入的账号密码不能为空",delay:1500});
        return;
    }else if($('#code').val()==''){
        // alert('输入的验证码不能为空');
        popup({type:'tip',msg:"输入的验证码不能为空",delay:1500});
        return;
    }
    //提交ajax
    $.ajax({
        url: 'index.php?m=admin&c=Common&a=index',
        type:'POST',
        data:{userName: $('#userName').val(),password: $('#password').val(),code: $('#code').val()},
        dataType:"JSON",
        success: function(res){
            // alert(res.msg);
            if(res.code==10000){
                popup({type:'success',msg:res.msg,delay:1500,callBack:function(){
                    window.location.href = "index.php?m=admin&c=Employees&a=center";
                }});
            }else{
                popup({type:'error',msg:res.msg,delay:1500});
            }
        }
    })
}