
$(function(){
		$("body").delegate(".deleteComment", "click", function(){
			console.log($(this));
			let commentId = $(this).parent().parent().parent().parent().children(".ping").children(".text-no");
			console.log(commentId.html());
			
			if (confirm("确认要删除这条评论么？")) {
				var commentid=$(this).parent().parent().parent().parent().children(".ping").children(".text-no").html();
				$.ajax({
	                "url"       : "deleteComment",   //要提交的URL路径
	                "type"      : "GET",           //发送请求的方式
	                "data"      : "commentid="+commentid,    //要发送到服务器的数据
	                "dataType"  : "text",          //指定返回的数据格式
	                "success"   : call,        //响应成功后要执行的代码
	                "error"     : function() {     //请求失败后要执行的代码
	                    alert("用户名验证时出现错误，请稍后再试或与管理员联系！");
	                }
	            });
				
				function call(date){
					if(date=="true"){
						alert("删除成功！")
						window.location.reload();
					}
				}//call函数结束
			  } else {
			    
			  }
			
		});//点击的事件结束
	})
	
$(function(){
		$("body").delegate(".btn-hover", "click", function(){
			console.log($(this));//在控制台监控这个操作
			let anr=$(this).parent().children(".ping").children(".abe");//被回复的评论的用户名
			let commentsId = $(this).parent().children(".ping").children(".abc");//被回复的评论的id
			let commeID=$(this).parent().children(".ping").children(".abd");//评论最外层的id
			console.log(commentsId.html());//在控制太输出获取到的commentsID的值
			var anrswer=anr.text();
			$('#addHcomment').modal();
			
			$("#bgs").val(commentsId.html());
			$("#bgss").val(commeID.html());
			$("#cmnss").val(anr.html());
			//$("#huifuc").placeholder("「回复@"+anrswer+"」");
			document.getElementById("huifuc").setAttribute("placeholder","「回复@"+anrswer+"」");
			console.log(anrswer);
			
		});//点击的事件结束
	})
	
$(function(){
		$("body").delegate(".deleteComments", "click", function(){
			console.log($(this));
			let commentId = $(this).parent().parent().parent().children(".ping").children(".abc");
			console.log(commentId.html());
			
			if (confirm("确认要删除这条评论么？")) {
				var commentid=$(this).parent().parent().parent().children(".ping").children(".abc").html();
				$.ajax({
	                "url"       : "deleteComment",   //要提交的URL路径
	                "type"      : "GET",           //发送请求的方式
	                "data"      : "commentid="+commentid,    //要发送到服务器的数据
	                "dataType"  : "text",          //指定返回的数据格式
	                "success"   : call,        //响应成功后要执行的代码
	                "error"     : function() {     //请求失败后要执行的代码
	                    alert("用户名验证时出现错误，请稍后再试或与管理员联系！");
	                }
	            });
				
				function call(date){
					if(date=="true"){
						alert("删除成功！")
						window.location.reload();
					}
				}//call函数结束
			  } else {
			    
			  }
			
		});//点击的事件结束
	})
