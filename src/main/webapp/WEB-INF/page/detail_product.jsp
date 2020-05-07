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
    <li><label>货物信息</label></li>
    <li><label>货物清单</label></li>
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
		var productid = $("input[name='productid']").val();
		var productname = $("input[name='name']").val();
		var price = $("input[name='price']").val();
		var category = $("input[name='category']").val();
		var unit = $("input[name='unit']").val();
		var remark = $("input[name='remark']").val();
		if(confirm('确认修改？')){
			 $.post("modify_product",{
				 'productid':productid,
				 'productname':productname,
				 'price':price,
				 'category':category,
				 'unit':unit,
				 'remark':remark},function(data){
					 if(data > 0){
						 alert("修改成功");
			  			$(location).attr('href', 'detail_product?id='+id);
					 }
					 else {
						 alert("修改失败");
						 return false;
				 }
			 })
		} else return false;
	}
</script>   
    
    <div class="formtitle"><span>商品详情</span></div>
	    <ul class="seachform1">
        	<input name="id" type="text" value="${p.id }"  style="display:none" />
		  	<li><label>商品编号：</label><input name="productid" type="text" class="scinput1" value=${p.productid } disabled="disabled" style="border: 0;  outline: none;  background-color: rgba(0, 0, 0, 0);"/></li>
		</ul>
	    <ul class="seachform1"> 
		    <li><label>商品名称：</label><input name="name" type="text" class="scinput1" value=${p.productname } /></li>
 	    </ul>    
	    <ul class="seachform1"> 
		    <li><label>商品价格：</label><input name="price" type="text" class="scinput1" value="${p.price }" /></li>
 	    </ul>   
	    <ul class="seachform1"> 
		    <li><label>商品类别：</label><input name="category" type="text" class="scinput1" value=${p.category } /></li>
 	    </ul>    
	    <ul class="seachform1"> 
		    <li><label>数量单位：</label><input name="unit" type="text" class="scinput1" value=${p.unit } /></li>
 	    </ul>    
	    <ul class="seachform1"> 
		    <li><label>备注：</label><input name="remark" type="text" class="scinput1" value=${p.remark } /></li>
 	    </ul>    
 	    <ul>
 	    	<input name="" type="submit" class="loginbtn" value="修改" onclick="return check()" />    
 	    	<input name="" type="submit" class="loginbtn" value="返回" onclick="javascript:history.go(-1);" />
 	    </ul>
	
    </div>
     
</body>

</html>

