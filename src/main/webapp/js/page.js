$(function(){
	laypage.render({
		  elem: 'page'
		  ,count: 70 //数据总数，从服务端得到
		  ,jump: function(obj, first){
		    //obj包含了当前分页的所有参数，比如：
		    console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
		    console.log(obj.limit); //得到每页显示的条数
		    
		    //首次不执行
		    if(!first){
		      //do something
		    }
		  }
		});
})
