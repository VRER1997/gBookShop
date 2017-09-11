<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>商品评价页</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
		function recieve(){
			//获取参数
			var list = window.dialogArguments;
			for(var i = 0; i < list.size(); i++)
				alert(list[i]);				
		}
		function returnValueFromModal(){
			var fromIndex = document.getElementById("fromIndex").value;
			//把要返回的值返回去
			window.returnValue = fromIndex;
			window.close();//关闭模态窗体才能把值传回去
			
		}
	</script>
  </head>
  
  <body>
    <div class="list">
    	<div class="p-img">
    		<img src="">
    	</div>
    	<input type="input" class="p-comment">
    </div>
  </body>
</html>
