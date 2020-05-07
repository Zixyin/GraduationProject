<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<script language="JavaScript" src="js/jquery.js"></script>

<script type="text/javascript">
$(function(){	
	//导航切换
	$(".menuson .header").click(function(){
		var $parent = $(this).parent();
		$(".menuson>li.active").not($parent).removeClass("active open").find('.sub-menus').hide();
		
		$parent.addClass("active");
		if(!!$(this).next('.sub-menus').size()){
			if($parent.hasClass("open")){
				$parent.removeClass("open").find('.sub-menus').hide();
			}else{
				$parent.addClass("open").find('.sub-menus').show();	
			}
			
			
		}
	});
	
	// 三级菜单点击
	$('.sub-menus li').click(function(e) {
        $(".sub-menus li.active").removeClass("active")
		$(this).addClass("active");
    });
	
	$('.title').click(function(){
		var $ul = $(this).next('ul');
		$('dd').find('.menuson').slideUp();
		if($ul.is(':visible')){
			$(this).next('.menuson').slideUp();
		}else{
			$(this).next('.menuson').slideDown();
		}
	});
})	
</script>


</head>

<body style="background:#fff3e1;">
    <dl class="leftmenu">
            
    <dd>
	    <div class="title">
	    	<span><img src="images/leftico04.png" /></span><a href="index " target="rightFrame">首页</a>
	    </div>
    
   </dd>   
	<dd>
	    <div class="title">
	    	<span><img src="images/leftico02.png" /></span>货物信息
	    </div>
	    <ul class="menuson">
	      	<li><cite></cite><a href="search_product" target="rightFrame">货物清单</a><i></i></li>
	    </ul>    
    </dd>
    <c:if test="${sessionScope.user.category=='2' || sessionScope.user.category=='0'}">
	    <dd>
		    <div class="title">
		    	<span><img src="images/leftico02.png" /></span>仓库信息
		    </div>
		    <ul class="menuson">
		    	<li><cite></cite><a href="search_shop" target="rightFrame">仓库列表</a><i></i></li>
		    	<li><cite></cite><a href="add_shop" target="rightFrame">仓库添加</a><i></i></li>
		    </ul>     
	    </dd> 
    </c:if>
 	<c:if test="${sessionScope.user.category=='2' || sessionScope.user.category=='0'}">
 	    <dd>
		    <div class="title">
		    	<span><img src="images/leftico02.png" /></span>库存盘点
		    </div>
		    <ul class="menuson">
		    	<li><cite></cite><a href="searchbyproduct " target="rightFrame">商品库存</a><i></i></li>
		    	<li><cite></cite><a href="searchbyshop " target="rightFrame">仓库库存</a><i></i></li>
    			<li><cite></cite><a href="search_supplyoutbyflag " target="rightFrame">补货</a><i></i></li>
			</ul>     
   		</dd> 
   </c:if>    
    <c:if test="${sessionScope.user.category=='1' || sessionScope.user.category=='3' || sessionScope.user.category=='0'}">
	    <dd>
		    <div class="title"><span><img src="images/leftico02.png" />
		    	</span>订单信息
		    </div>
		    <ul class="menuson">  
		    <c:if test="${sessionScope.user.category=='1' || sessionScope.user.category=='0'}">		    
		    	<li><cite></cite><a href="search_supplyin " target="rightFrame">查询进货订单</a><i></i></li>
		    	<li><cite></cite><a href="add_supplyin " target="rightFrame">新增进货订单</a><i></i></li>
		    </c:if>	
		    <c:if test="${sessionScope.user.category=='3' || sessionScope.user.category=='0'}">
		    	<li><cite></cite><a href="search_supplyout " target="rightFrame">查询销售订单</a><i></i></li>
		    	<li><cite></cite><a href="add_supplyout " target="rightFrame">新增销售订单</a><i></i></li>
		    </c:if>
		    </ul>   
	    </dd>    
	 </c:if>  
    <c:if test="${sessionScope.user.category=='1' || sessionScope.user.category=='0'}">
	    <dd>
		    <div class="title"><span><img src="images/leftico03.png" />
		    	</span>供应商管理
		    </div>
		    <ul class="menuson">
		    	<li><cite></cite><a href="search_supplier " target="rightFrame">供应商信息</a><i></i></li>
		    	<li><cite></cite><a href="add_supplier" target="rightFrame">添加供应商</a><i></i></li>
		    </ul>    
	    </dd>  
    </c:if>
    
    <c:if test="${sessionScope.user.category=='0'}">
	    <dd>
		    <div class="title"><span><img src="images/leftico03.png" />
		    	</span>员工管理
		    </div>
		    <ul class="menuson">
		    	<li><cite></cite><a href="search_user " target="rightFrame">员工信息</a><i></i></li>
		    	<li><cite></cite><a href="add_user" target="rightFrame">添加员工</a><i></i></li>
		    </ul>    
	    </dd>  
    </c:if>
    
    </dl>
    
</body>
</html>
