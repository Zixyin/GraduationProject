<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
$(function(){
	/*
	url: 请求服务器地址
	data:请求参数
	dataType:服务器返回数据类型
	error请求出错执行的功能
	success请求成功执行的功能,function(data) data服务器返回的数据.
	type:请求方式

	$("a").click(function(){
 			$.ajax({
			url:'demo',
			data:{"name":"张三"},
			dataType:'html',
			error:function(){
				alert("请求出错.")
			},
			success:function(data){
				alert("请求成功"+data)
			},
			type:'POST'
		}); 
		return false;
	})*/
		$.post("demo",function(data){
			var result="";
			for(var i =0 ;i<data.length;i++){
				result+="<tr>";
				result+="<td>"+data[i].id+"</td>"
				result+="<td>"+data[i].username+"</td>"
				result+="<td>"+data[i].remark+"</td>"
				result+="</tr>";
			}
			//相当innerHTML先清空后添加
			$("#mytbody").html(result);
		})

});
</script>
</head>
<body>
<table border="1">
	<tr>
		<td>编号</td>
		<td>姓名</td>
		<td>密码</td>
	</tr>
	<tbody id="mytbody"></tbody>
</table>
</body>
</html>