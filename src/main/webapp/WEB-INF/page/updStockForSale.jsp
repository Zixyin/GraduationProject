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
    <li><label>库存盘点</label></li>
    <li><label>补货</label></li>
    </ul>
    </div>
   
    <div class="formbody">  
    
    <div id="usual1" class="usual"> 
   
    <script language="javascript">
	$(document).ready(function() 
{ 
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
		
	</script>
      
    <script type="text/javascript">
$(document).ready(function(){
  $(".scbtn1").click(function(){
  $(".seachform2").fadeIn(200);
  }); 


});
</script>   
    
    <div class="formtitle"><span>选择仓库</span></div>
	    
    <table class="tablelist">
	    <c:if test="${not empty list}">
	    	<thead>
	    	<tr>
		      	<th>商品名称</th>
		      	<th>仓库名称</th>
		        <th>库存</th>
		        <th>操作</th>
	        </tr>
	        </thead>
	        <tbody>
				<c:forEach  items="${list}"  var="l">
					<tr>
						<td>${l.productname}</td>
						<td>${l.shopname }</td>
						<td>${l.quantity }</td>
						<td><a href="updStockConfirm?id=${l.id }" class="tablelink"  onclick="if(confirm('确定?')==false)return false;">确认</a></td>
					</tr>
				</c:forEach>
	        </tbody>
		</c:if>
		<c:if test="${empty list}">
			库存不足，请及时进货
		</c:if>
    </table>
    
	<div id="page"></div>

	</div>    
    
    </div>
     
</body>

</html>
<script type="text/javascript" src="js/layui.js"></script>