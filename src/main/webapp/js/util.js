/**
 * 
 */
function jQAJAX(path,sendData,successFunction) {
	$.ajax({
		type:"POST",
		url:path,
		data:sendData,
		dataType:"text",
		success:successFunction,
		error:function()
		{
			alert("访问错误");
		}
	});
}
function jQAJAXS(path,sendData,successFunction) {
	$.ajax({
		type:"POST",
		url:path,
		data:sendData,
		contentType : "application/x-www-form-urlencoded",
		dataType:"json",
		async:true,
		success:successFunction,
		error:function()
		{
			alert("访问错误");
		}
	});
}



//js获取项目根路径，如： http://localhost:8083/uimcardprj
function getRootPath(){
    //获取当前网址，如： http://localhost:8083/uimcardprj/share/meun.jsp
    var curWwwPath=window.document.location.href;
    //获取主机地址之后的目录，如： uimcardprj/share/meun.jsp
    var pathName=window.document.location.pathname;
    var pos=curWwwPath.indexOf(pathName);
    //获取主机地址，如： http://localhost:8083
    var localhostPaht=curWwwPath.substring(0,pos);
    //获取带"/"的项目名，如：/uimcardprj
    var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
    // alert(projectName);
    return(projectName);
}