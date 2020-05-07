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
                var price = form.price.value;
                var category = form.category.value;
                var unit = form.unit.value;
                var count = form.count.value;
                var supplier = form.supplier.value;
                var shopname = $('#shopselect option:selected').text();
                var remark = form.remark.value;
                var reg = /^(([^0][0-9]+|0)\.([0-9]{1,2})$)|^(([^0][0-9]+|0)$)|^(([1-9]+)\.([0-9]{1,2})$)|^(([1-9]+)$)/;
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
              if(!reg.test(price)){
                  showMsg("价格只能由整数/小数组成");
                  form.price.focus ();
                  return false;
              }
              if(!category || category == ""){
                showMsg("请输入商品类别");
                form.category.focus ();
                return false;
              }
              if(!unit || unit== ""){
                showMsg("请输入数量单位");
                form.unit.focus ();
                return false;
              }           
              if(!supplier || supplier== ""){
                  showMsg("请输入供应商");
                  form.supplier.focus ();
                  return false;
              } 
              if(shopname == "选择仓库"){
                  showMsg("请选择仓库");
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
            	 $.post("add_supplyin_con",{
            		 'productid':productid,
            		 'productname':productname,
            		 'price':price,
            		 'category':category,
            		 'unit':unit,
            		 'count':count,
            		 'supplier':supplier,
            		 'shopname':shopname,
            		 'remark':remark},function(data){
            		 if(data > 0){
            			 showMsg("添加成功");
	           			$(location).attr('href', 'search_product');
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
    <li><label>新增进货订单 </label></li>
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
			    	<label>商品售价<b>*</b></label>  
					<input name="price"class="dfinput" type="text" placeholder="仅支持整数/两位小数" data-options="required:true,validType:'email'" >
			    </li>
				<li>
					<label>商品类别:<b>*</b></label>
					<input name="category"class="dfinput" type="text" placeholder="请填写类别" data-options="required:true,validType:'email'" >
				</li>	
				<li>
					<label>数量单位:<b>*</b></label>
					<input name="unit"class="dfinput" type="text" placeholder="请填写单位" data-options="required:true,validType:'email'" >
				</li>	
				<li>
					<label>数量:<b>*</b></label>
					<input name="count"class="dfinput" type="text" placeholder="请填写数量" data-options="required:true,validType:'email'" >
				</li>	
				<li>
					<label>供应商:<b>*</b></label>
					<input name="supplier"class="dfinput" type="text" placeholder="请填写供应商" data-options="required:true,validType:'email'" >
				</li>
				<li>
					<label>存放仓库:<b>*</b></label>
						<select id="shopselect" style="opacity:1;">
							<option value="">选择仓库</option>
							<c:forEach items="${sessionScope.namelist }" var="name">
								<option value="${name}"><c:out value="${name}" /></option>
							</c:forEach>
						</select>
	<!-- 				<input name="shop"class="dfinput" type="text" placeholder="请选择仓库" data-options="required:true,validType:'email'" >
	 -->			</li>	
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
