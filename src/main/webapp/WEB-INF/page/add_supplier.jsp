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
                var name = form.name.value;
                var add = form.add.value;
                var dadd = form.dadd.value;
                var person = form.person.value;
                var tel = form.tel.value;
                var remark = form.remark.value;
                var reg = /^[1](([3][0-9])|([4][5-9])|([5][0-3,5-9])|([6][5,6])|([7][0-8])|([8][0-9])|([9][1,8,9]))[0-9]{8}$/;
              if(!name || name == ""){
                  showMsg("请输入名称");
                  form.name.focus ();
                  return false;
                }
              if(!add || add == ""){
                showMsg("请输入地址");
                form.add.focus ();
                return false;
              }
              if(!dadd || dadd == ""){
                  showMsg("请输入详细地址");
                  form.dadd.focus ();
                  return false;
              }
              if(!person || person == ""){
                  showMsg("请输入联系人");
                  form.person.focus ();
                  return false;
              }
              if(!reg.test(tel)){
                  showMsg("手机号格式不正确");
                  form.tel.focus ();
                  return false;
              }
              if(!remark || remark== ""){
            	  var date = new Date();
            	  var mytime=date.toLocaleString();
                  remark = "添加于"+ mytime;
              }
             if(confirm('确认添加？')){
            	 $.post("add_supplier_con",{
            		 'name':name,
            		 'add':add,
            		 'dadd':dadd,
            		 'person':person,
            		 'tel':tel,
            		 'remark':remark},function(data){
            		 if(data > 0){
            			 showMsg("添加成功");
	           			$(location).attr('href', 'search_supplier');
            		 } else{
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
    <li><label>供应商管理</label></li>
    <li><label>添加供应商</label></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div id="usual1" class="usual"> 
    
  	<div id="tab1" class="tabson">
    
    <ul class="forminfo">  
		<form >
		<input type="hidden" name="oper" value="reg" />
 				<li>
					<label>名称<b>*</b></label>
					<input name="name"class="dfinput" type="text" placeholder="请填写名称" type="password" data-options="required:true,validType:'email'" >
				</li>					
			    <li>
			    	<label>地址<b>*</b></label>  
					<input name="add"class="dfinput" type="text" placeholder="请填写地址" data-options="required:true,validType:'email'" >
			    </li>
				<li>
					<label>详细地址:<b>*</b></label>
					<input name="dadd"class="dfinput" type="text" placeholder="请填写详细地址" data-options="required:true,validType:'email'" >
				</li>	
				<li>
					<label>联系人:<b>*</b></label>
					<input name="person"class="dfinput" type="text" placeholder="请填写联系人" data-options="required:true,validType:'email'" >
				</li>	
				<li>
					<label>联系电话:<b>*</b></label>
					<input name="tel"class="dfinput" type="text" placeholder="请填写11位手机号码" data-options="required:true,validType:'email'" >
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
