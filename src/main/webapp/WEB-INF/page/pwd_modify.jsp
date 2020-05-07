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
                var password = form.psw.value;
                var password1 = form.npsw.value;
                var password2 = form.cnpsw.value;
                var oldPsw =  form.oldPsw.value;
              if(!password || password == ""){
                showMsg("请输入原始密码");
                form.psw.focus ();
                return false;
              }
              if(!password1 || password1 == ""){
                showMsg("请输入新密码");
                form.npsw.focus ();
                return false;
              }
              if(!password2 || password2 == ""){
                showMsg("请确认新密码");
                form.cnpsw.focus ();
                return false;
              }
              if(password1 != password2){
                showMsg("两次密码不一致");
                return false;
              }
              if(password1 == password2 && password == password1){
                showMsg("新密码不能和原始密码一致");
                return false;
              }
              if(oldPsw != password){    
                showMsg("原始密码错误");
                return false;
              }
             if(confirm('请确认？\n此操作不可恢复！')){
            	 $.post("psw_modify",{'psw':password1},function(data){
            		 if(data > 0){
	           			 alert("修改成功");
	           			 history.go(-1);
            		 }
            		 else return false;
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
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="javascript:void(0)">密码修改</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div id="usual1" class="usual"> 
    
  	<div id="tab1" class="tabson">
    
    <ul class="forminfo">  
		<form >
		<input type="hidden" name="oper" value="reg" />
 				<li>
 				 	<label>原密码<b>*</b></label> 
 					<input name="psw"class="dfinput" type="password" data-options="required:true,validType:'email'" >
 					<input name="oldPsw"class="dfinput" type="hidden" value="${sessionScope.user.psw }">
 					
				</li>
 				
			    <li>
			    	<label>新密码<b>*</b></label>  
					<input name="npsw"class="dfinput" type="password" data-options="required:true,validType:'email'" >
			    </li>
				<li>
					<label>确认新密码:<b>*</b></label>
					<input name="cnpsw"class="dfinput" type="password" data-options="required:true,validType:'email'" >
				</li>			
		
				<input type="button" class="loginbtn" value="确认修改" onclick="return check(this.form);"/>
				

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
