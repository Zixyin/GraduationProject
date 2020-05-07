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
    <li><label>订单信息</label></li>
    <li><label>查询进货订单</label></li>
    </ul>
    </div>
   
    <div class="formbody">  
    
    <div id="usual1" class="usual"> 
   
    
    <div class="formtitle"><span>订单详情</span></div>
	    <ul class="seachform1">
        	<input name="id" type="text" value="${si.id }"  style="display:none" />
		  	<li><label>订单编号：</label><input name="tid" type="text" class="scinput1" value=${si.id } disabled="disabled" style="border: 0;  outline: none;  background-color: rgba(0, 0, 0, 0);"/></li>
		</ul>
	    <ul class="seachform1"> 
		    <li><label>商品名称：</label><input name="productname" type="text" class="scinput1" value=${si.productname } disabled="disabled" style="border: 0;  outline: none;  background-color: rgba(0, 0, 0, 0);"/></li>
 	    </ul>    
	    <ul class="seachform1"> 
		    <li><label>数量：</label><input name="quantity" type="text" class="scinput1" value="${si.quantity}" disabled="disabled" style="border: 0;  outline: none;  background-color: rgba(0, 0, 0, 0);"/></li>
 	    </ul>   
	    <ul class="seachform1"> 
		    <li><label>价格：</label><input name="price" type="text" class="scinput1" value=${si.price } disabled="disabled" style="border: 0;  outline: none;  background-color: rgba(0, 0, 0, 0);"/></li>
 	    </ul>    
	    <ul class="seachform1"> 
		    <li><label>仓库ID：</label><input name="shopid" type="text" class="scinput1" value=${si.shopid } disabled="disabled" style="border: 0;  outline: none;  background-color: rgba(0, 0, 0, 0);"/></li>
 	    </ul>    
	    <ul class="seachform1"> 
		    <li><label>供应商：</label><input name="shopname" type="text" class="scinput1" value=${si.supname } disabled="disabled" style="border: 0;  outline: none;  background-color: rgba(0, 0, 0, 0);"/></li>
 	    </ul>  
 	    <ul class="seachform1"> 
		    <li><label>日期：</label><input name="date" type="text" class="scinput1" value=${si.date } disabled="disabled" style="border: 0;  outline: none;  background-color: rgba(0, 0, 0, 0);"/></li>
 	    </ul>   
 	    <ul>
 	    	<input name="" type="submit" class="loginbtn" value="返回" onclick="javascript:history.go(-1);" />
 	    </ul>
	
    </div>
     
</body>

</html>

