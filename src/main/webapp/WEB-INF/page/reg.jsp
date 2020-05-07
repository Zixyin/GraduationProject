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
<title></title>
<script language="JavaScript" src="js/jquery.js"></script>
<script src="js/cloud.js" type="text/javascript"></script>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/select.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery.idTabs.min.js"></script>
<script type="text/javascript" src="js/select-ui.min.js"></script>
<script type="text/javascript">
        function check(form){
                var zcm = form.zcm.value;
                var userid = form.userid.value;
                var psw = form.psw.value;
                var cpsw =  form.cpsw.value;
                var reg = /^[0-9]*$/;
              if(!zcm || zcm == ""){
                  showMsg("请输入注册码");
                  form.zcm.focus ();
                  return false;
                }
              if(!userid || userid == ""){
                showMsg("账号");
                form.userid.focus ();
                return false;
              }
              if(!reg.test(userid)){
                  showMsg("账号只能由数字组成");
                  form.userid.focus ();
                  return false;
              }
              if(!psw || psw == ""){
                showMsg("请输入密码");
                form.psw.focus ();
                return false;
              }
              if(!cpsw || cpsw == ""){
                showMsg("请确认密码");
                form.cpsw.focus ();
                return false;
              }
              if(psw != cpsw){
                showMsg("两次密码不一致");
                return false;
              }

             if(confirm('确认注册？')){
            	 $.post("admin_reg",{'userid':userid,'psw':psw},function(data){
            		 if(data > 0){
            			 showMsg("注册成功");
	           			$(location).attr('href', '/login.jsp');
            		 }
            		 else {
            			 showMsg("注册失败");
            			 return false;
            		 }
            	 })
             } else return false;
          }
          //错误信息提醒
        function showMsg(msg){
          alert(msg);
        }
$(document).ready(function(e) {
    $(".select1").uedSelect({
		width : 345			  
	});
	$(".select2").uedSelect({
		width : 167  
	});
	$(".select3").uedSelect({
		width : 100
	});
});
</script>
</head>

<body>

	<div class="place">
    <span>位置：管理员注册</span>

    </div>
    
    <div class="formbody">
    
    <div id="usual1" class="usual"> 
    
  	<div id="tab1" class="tabson">
    
    <ul class="forminfo">  
		<form >
		<input type="hidden" name="oper" value="reg" />
 				<li>
					<label>注册码:<b>*</b></label>
					<input name="zcm"class="dfinput" type="text" placeholder="请填写购买系统时附赠的注册码" type="password" data-options="required:true,validType:'email'" >
				</li>					
			    <li>
			    	<label>账号<b>*</b></label>  
					<input name="userid"class="dfinput" type="text" placeholder="请输入纯数字" data-options="required:true,validType:'email'" >
			    </li>
				<li>
					<label>密码:<b>*</b></label>
					<input name="psw"class="dfinput" type="password" data-options="required:true,validType:'email'" >
				</li>	
				<li>
					<label>确认密码:<b>*</b></label>
					<input name="cpsw"class="dfinput" type="password" data-options="required:true,validType:'email'" >
				</li>	
				<input type="button" class="loginbtn" value="注册" onclick="return check(this.form);"/>
				<input type="button" class="loginbtn" value="返回" onclick="javascript:history.go(-1);"/>
	
	</form>

    
    </div></div></div> 
 
	<script type="text/javascript"> 
      $("#usual1 ul").idTabs(); 
    </script>
    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>
    
    
    
    
    
    </div>


</body>

</html>
