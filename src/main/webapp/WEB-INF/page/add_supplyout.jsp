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
<title></title>
<script language="JavaScript" src="js/jquery.js"></script>
<script src="js/cloud.js" type="text/javascript"></script>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/layui.css" rel="stylesheet" type="text/css" />
<link href="css/select.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery.idTabs.min.js"></script>
<script type="text/javascript" src="js/select-ui.min.js"></script>
<script type="text/javascript" src="js/layui.js"></script>
<script type="text/javascript">
        function check(form){
                var productid = form.productid.value;
                var productname = form.productname.value;
                var count = form.count.value;
                var shopname = $('#shopselect option:selected').text();
                var remark = form.remark.value;
                 var countreg = /^[1-9]\d*$/;
              if(!productid || productid == ""){
                  showMsg("请输入商品编号");
                  form.productid.focus ();
                  return false;
                }
              if(!productname || productname == ""){
                showMsg("请输入商品名称");
                form.productname.focus ();
                return false;
              }
              if(!count || count== ""){
                    showMsg("请输入数量");
                    form.count.focus ();
                    return false;
              }
              if(!countreg.test(count)){
                  showMsg("数量只能是正整数");
                  form.count.focus ();
                  return false;
              }
              if(!remark || remark== ""){
            	  var date = new Date();
            	  var mytime=date.toLocaleString();
                  remark = "添加于"+ mytime;
                }
             if(confirm('确认添加？')){
            	 $.post("add_supplyout_con",{
            		 'productid':productid,
            		 'productname':productname,
            		 'count':count,
            		 'remark':remark},function(data){
            		 if(data > 0){
            			 showMsg("添加成功");
	           			$(location).attr('href', 'search_supplyout');
            		 } else {
            			 showMsg("操作失败，请重试");
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
    <li><label>订单信息</label></li>
    <li><label>新增销售订单 </label></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div id="usual1" class="usual"> 
    
  	<div id="tab1" class="tabson">
    
    <ul class="forminfo">  
		<form >
		<input type="hidden" name="oper" value="reg" />
  				<li>
					<label>商品编号<b>*</b></label>
					<input name="productid"class="dfinput" type="text" placeholder="请填写编号" type="password" data-options="required:true,validType:'email'" >
				</li>	
 				<li>
					<label>商品名称<b>*</b></label>
					<input name="productname"class="dfinput" type="text" placeholder="请填写名称" type="password" data-options="required:true,validType:'email'" >
				</li>					
				<li>
					<label>数量:<b>*</b></label>
					<input name="count"class="dfinput" type="text" placeholder="请填写数量" data-options="required:true,validType:'email'" >
				</li>	
				<li>
	
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
