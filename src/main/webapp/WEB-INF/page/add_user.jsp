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
                var userid = form.userid.value;
                var psw = form.psw.value;
                var username = form.username.value;
                var category = $('#categoryselect option:selected').val();
                var tel = form.tel.value;
                var remark = form.remark.value;
                var reg =  /^[0-9]+$/;
              if(!userid || userid == ""){
                  showMsg("请输入帐号");
                  form.userid.focus();
                  return false;
                }
              if(!reg.test(userid)){
                  showMsg("帐号只能为正整数");
                  form.userid.focus();
                  return false;
              }
              if(!psw || psw == ""){
                  showMsg("请输入密码");
                  form.psw.focus();
                  return false;
                }
              if(!username || username == ""){
                showMsg("请输入名称");
                form.username.focus();
                return false;
              }
              if(!category || category == -1){
                  showMsg("请选择职位");
                  return false;
              }
              if(!remark || remark== ""){
            	  var date = new Date();
            	  var mytime=date.toLocaleString();
                  remark = "添加于"+ mytime;
                }
             if(confirm('确认添加？')){
            	 $.post("add_user_con",{
            		 'userid':userid,
            		 'psw':psw,
            		 'username':username,
            		 'category':category,
            		 'remark':remark},function(data){
            		 if(data > 0){
            			 showMsg("添加成功");
	           			$(location).attr('href', 'search_user');
            		 } else {
            			 showMsg("添加失败");
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
    <span>位置：</span>
    <ul class="placeul">
    <li><label>首页</label></li>
    <li><label>员工信息</label></li>
    <li><label>添加员工</label></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div id="usual1" class="usual"> 
    
  	<div id="tab1" class="tabson">
    
    <ul class="forminfo">  
		<form >
		<input type="hidden" name="oper" value="reg" />
  				<li>
					<label>ID<b>*</b></label>
					<input name="userid"class="dfinput" type="text" placeholder="账号为正整数" type="password" data-options="required:true,validType:'email'" >
				</li>	
 				<li>
					<label>密码<b>*</b></label>
					<input name="psw"class="dfinput" type="password" placeholder="请设置密码" type="password" data-options="required:true,validType:'email'" >
				</li>					
			    <li>
			    	<label>姓名<b>*</b></label>  
					<input name="username"class="dfinput" type="text" placeholder="请填写姓名" data-options="required:true,validType:'email'" >
			    </li>
				<li>
					<label>职位<b>*</b></label>
					<select id="categoryselect" style="opacity:1;">
						<option value="-1">选择职位</option>
						<option value="0">管理员</option>
						<option value="1">进货员</option>
						<option value="2">仓库管理员</option>
						<option value="3">销售员</option>
					</select>
				</li>		
				<li>
					<label>电话</label>
					<input name="tel"class="dfinput" type="text" data-options="required:true,validType:'email'" >
				</li>	
				<li>
					<label>备注</label>
					<input name="remark"class="dfinput" type="text" data-options="required:true,validType:'email'" >
				</li>	
				<input type="button" class="loginbtn" value="添加" onclick="return check(this.form);"/>
	
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
