<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<link href="css/layui.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery.idTabs.min.js"></script>
<script type="text/javascript" src="js/select-ui.min.js"></script>

<script type="text/javascript">
$(document).ready(function(e) {

	$(".select3").uedSelect({
		width : 152
	});
});
</script>
</head>
<body class="sarchbody">
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><label>首页</label></li>
    <li><label>员工管理</label></li>
    <li><label>员工信息</label></li>
    </ul>
    </div>
   
    <div class="formbody">  
    
    <div id="usual1" class="usual"> 
   
<script language="javascript">
	$(document).ready(function() {
		  $(".scbtn1").click(function(){
			  $(".seachform2").fadeIn(200);
			  }); 
    $(".scbtn1").click(function() 
    {      
        if( $(".seachform2").hasClass("hideclass") ) 
        { 
            $(".seachform2").removeClass("hideClass"); 
        } 
        else 
        { 
            $(".seachform2").addClass("hideClass"); 
        }    
	    }); 
	}); 
      
	function check(){
		var id = $("input[name='id']").val();
		var userid = $("input[name='userid']").val();
		var psw = $("input[name='psw']").val();
		var username = $("input[name='username']").val();
		var category = $("input[name='category']").val();
		var reg = /[0-3]/;
		if(!reg.test(category)){
			alert("职位填写有误");
			return false;
		}
		var tel = $("input[name='tel']").val();
		var remark = $("input[name='remark']").val();
		if(confirm('确认修改？')){
			 $.post("modify_user",{
				 'id':id,
				 'userid':userid,
				 'psw':psw,
				 'username':username,
				 'category':category,
				 'tel':tel,
				 'remark':remark},function(data){
					 if(data > 0){
						 alert("修改成功");
			  			$(location).attr('href', 'detail_user?id='+id);
					 }
					 else {
						 alert("修改失败");
						 return false;
				 }
			 })
		} else return false;
	}
</script>   
    
    <div class="formtitle"><span>详细信息</span></div>
	    <ul class="seachform1">
	      	<input name="id" type="text" value="${userdetail.id }"  style="display:none" />	
  		  	<li><label>ID：</label><input name="userid" type="text" class="scinput1" value=${userdetail.userid} /></li>
		</ul>
	    <ul class="seachform1"> 
		    <li><label>密码：</label><input name="psw" type="text" class="scinput1" value=${userdetail.psw } /></li>
 	    </ul>    
	    <ul class="seachform1"> 
		    <li><label>姓名：</label><input name="username" type="text" class="scinput1" value="${userdetail.username }" /></li>
 	    </ul>   
	    <ul class="seachform1"> 
		    <li><label>职位：</label><input name="category" type="text" class="scinput1" value=${userdetail.category } />0-管理员，1-进货员，2-仓库管理员，3-销售员</li>
 	    </ul> 
 	    <ul class="seachform1"> 
		    <li><label>电话：</label><input name="tel" type="text" class="scinput1" value=${userdetail.tel } /></li>
 	    </ul>  
 	    <ul class="seachform1"> 
		    <li><label>备注：</label><input name="remark" type="text" class="scinput1" value=${userdetail.remark } /></li>
 	    </ul>    
 	    <ul>
 	    	<input name="" type="submit" class="loginbtn" value="修改" onclick="return check()" />    
 	    	<input name="" type="submit" class="loginbtn" value="返回" onclick="javascript:history.go(-1);" />
 	    </ul>
	
    </div>
     
</body>

</html>

