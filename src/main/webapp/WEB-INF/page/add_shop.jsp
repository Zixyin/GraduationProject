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
                var shopid = form.shopid.value;
                var shopname = form.shopname.value;
                var address = form.address.value;
                var daddress = form.daddress.value;
                var remark = form.remark.value;
                var reg =  /^[0-9]+$/;
              if(!shopid || shopid == ""){
                  showMsg("请输入编号");
                  form.shopid.focus();
                  return false;
                }
              if(!reg.test(shopid)){
                  showMsg("编号只能为正整数");
                  form.shopid.focus();
                  return false;
              }
              if(!shopname || shopname == ""){
                showMsg("请输入名称");
                form.shopname.focus();
                return false;
              }
              if(!address || address == ""){
                showMsg("请输入地址");
                form.address.focus();
                return false;
              }
              if(!daddress || address== ""){
                showMsg("请输入详细地址");
                form.daddress.focus();
                return false;
              }
              if(!remark || remark== ""){
            	  var date = new Date();
            	  var mytime=date.toLocaleString();
                  remark = "添加于"+ mytime;
                }
             if(confirm('确认添加？')){
            	 $.post("add_shop_con",{
            		 'shopid':shopid,
            		 'shopname':shopname,
            		 'address':address,
            		 'daddress':daddress,
            		 'remark':remark},function(data){
            		 if(data > 0){
            			 showMsg("添加成功");
	           			$(location).attr('href', 'search_shop');
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
    <li><label>仓库信息</label></li>
    <li><label>仓库添加</label></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div id="usual1" class="usual"> 
    
  	<div id="tab1" class="tabson">
    
    <ul class="forminfo">  
		<form >
		<input type="hidden" name="oper" value="reg" />
  				<li>
					<label>仓库编号<b>*</b></label>
					<input name="shopid"class="dfinput" type="text" placeholder="编号为正整数" type="password" data-options="required:true,validType:'email'" >
				</li>	
 				<li>
					<label>仓库名称<b>*</b></label>
					<input name="shopname"class="dfinput" type="text" placeholder="请填写名称" type="password" data-options="required:true,validType:'email'" >
				</li>					
			    <li>
			    	<label>仓库地址<b>*</b></label>  
					<input name="address"class="dfinput" type="text" placeholder="请填写地址" data-options="required:true,validType:'email'" >
			    </li>
				<li>
					<label>详细地址<b>*</b></label>
					<input name="daddress"class="dfinput" type="text" placeholder="请填写详细地址" data-options="required:true,validType:'email'" >
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
