<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>欢迎登录超市仓库管理系统</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>

<body style="background-color:#df7611; background-image:url(images/light.png); background-repeat:no-repeat; background-position:center top; overflow:hidden;">
    <div id="mainBody">
      <div id="cloud1" class="cloud"></div>
      <div id="cloud2" class="cloud"></div>
    </div>  
	<div class="logintop">    
	    <span>欢迎登录超市仓库管理系统</span>    
	    </div>
	    
	    <div class="loginbody">
	    
	    <span class="systemlogo"></span> 
	    <br />
	
	    <div class="loginbox loginbox1">
	    <form action="login" method="post">
	    	<input type="text" style="visibility: hidden;" />
	    	<ul>
		    <li><input name="userid" type="text" placeholder="用户名" class="loginuser"  /></li>
		    <li><input name="psw" type="password" placeholder="密码" class="loginpwd"  /></li>
		    <li>
		    	<input name="" type="submit" class="loginbtn" value="登录" onclick="return check(this.form);" />
		  		<label><a href="reg">注册</a></label>
		    </li>
		   </ul>
	    </form>	    
	    </div>  
    </div>  
</body>

</html>
<script type="text/javascript" src="js/jquery.js"></script>
<script src="js/cloud.js" type="text/javascript"></script>

<script type="text/javascript">
	$(function(){
	    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
		$(window).resize(function(){  
	    	$('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
	    }) 
	})
	
	function check(form){
	    var id = form.userid.value;
	    var psw = form.psw.value;
		  if(!id || id == ""){
		    showMsg("请输入用户名");
		    form.psw.focus ();
		    return false;
		  }
		  if(!psw || psw == ""){
		    showMsg("请输入密码");
		    form.npsw.focus ();
		    return false;
		  }
		 $.post("user_check",{'psw':psw,'userid':id},function(data){
			 if(data == 0){
				 showMsg("用户名或密码错误");
				 return false;
			 }
		 })
	}
	
	//错误信息提醒
	function showMsg(msg){
		alert(msg);
	}

</script> 