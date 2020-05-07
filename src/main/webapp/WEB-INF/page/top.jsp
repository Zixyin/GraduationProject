<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="js/jquery.js"></script>
<script type="text/javascript">
$(function(){	
	//顶部导航切换
	$(".nav li a").click(function(){
		$(".nav li a.selected").removeClass("selected")
		$(this).addClass("selected");
	})	
	//退出功能
		$("#out").click(function(){
		var flag=window.confirm("你真的要退出吗?");
		if(flag){
			window.top.location.href="loginout";
		} 
	})
})	
</script>


</head>

<body style="background-image:url(images/topbg.gif);background-repeat: repeat-x;">

    <div class="topleft">
   		<a href="main" target="_parent"><img src="images/loginlogo.png" title="系统首页" /></a>
    </div>
            
    <div class="topright">    
	    <ul>
	    <li><a href="pwd_modify" target="rightFrame">修改密码</a></li>
	    <li><a href="javascript:void(0)" target="_parent" id="out">退出</a></li>
	    </ul>
     
	    <div class="user">
	    <span>${sessionScope.user.username }</span>
	    <i>身份：
			<c:choose>
			    <c:when test="${sessionScope.user.category=='0' }">
					管理员
			    </c:when>
			    <c:when test="${sessionScope.user.category=='1' }">
					进货员
			    </c:when>
				<c:when test="${sessionScope.user.category=='2' }">
					仓库管理员
			    </c:when>	
			     <c:when test="${sessionScope.user.category=='3' }">
					销售员
			    </c:when>	
			    <c:otherwise>
			        ...
			    </c:otherwise>
			</c:choose>
		</i>
	    </div>       
    </div>
</body>
</html>