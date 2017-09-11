<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>书籍添加页</title>
    
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
		var arg = window.dialogArguments;
		//alert(arg.a);
	}
	function returnValueFromModal(){
		var fromIndex = document.getElementById("fromIndex").value;
		//把要返回的值返回去
		window.returnValue = fromIndex;
		window.close();//关闭模态窗体才能把值传回去
		
	}
	</script>
  </head>
  
  <body onload="recieve()">
    <form action="addBook.do" method="post" enctype="multipart/form-data" onsubmit="window.close();">
    	<table>
    		<tr>
    			<td>ISBN</td>
    			<td><input name = "ISBN" type="text"></td>
    		</tr>
    		<tr>
    			<td>书名</td>
    			<td><input name = "name"type="text"></td>
    		</tr>
    		<tr>
    			<td>价格</td>
    			<td><input name = "price"type="text"></td>
    		</tr>
    		<tr>
    			<td>书籍类型</td>
    			<td><input name = "type"type="text"></td>
    		</tr>
    		<tr>
    			<td>出版社</td>
    			<td><input name = "pulichouse"type="text"></td>
    		</tr>
    		<!--
	    		<tr>
	    			<td>品牌</td>
	    			<td><input name = "brands"type="text"></td>
	    		</tr>
    		 -->
    		<tr>
    			<td>包装</td>
    			<td><input name = "packages"type="text"></td>
    		</tr>
    		<tr>
    			<td>开本</td>
    			<td><input name = "format"type="text"></td>
    		</tr>
    		<tr>
    			<td>出版时间</td>
    			<td><input name = "publictime"type="text"></td>
    		</tr>
    		<!--
    		<tr>
    			<td>纸张</td>
    			<td><input name = "paper"type="text"></td>
    		</tr>
    		 -->
    		<tr>
    			<td>页数</td>
    			<td><input name = "pagenum"type="text"></td>
    		</tr>
    		<tr>
    			<td>语言</td>
    			<td><input name = "lang"type="text"></td>
    		</tr>
    		<tr>
    			<td>数量</td>
    			<td><input name = "num" type="text"></td>
    		</tr>
    		<tr>
    			<td>搜索关键字</td>
    			<td><input name = "keywords"type="text"></td>
    		</tr>
    		<tr>
    			<td>封面图片</td>
    			<td><input name = "image" type="file" style="width: 217px; "></td>
    		</tr>
    	</table>
    	<span style="float: left;">&nbsp;&nbsp;&nbsp;&nbsp;标题语</span>
    	<textarea name="title" style="float: left; width: 550px; height: 120px;"></textarea>
    	<br>
    	<span style="float: left;">&nbsp;&nbsp;&nbsp;&nbsp;作者简介</span>
    	<textarea name="shortauth" style="float: left; width: 550px; height: 120px;"></textarea>
    	<br>
    	<span style="float: left;">&nbsp;&nbsp;&nbsp;&nbsp;内容简介</span>
    	<textarea name="shortcontent" rows="" cols="" style="float: left; width: 550px; height: 120px;"></textarea>
    	<br>
    	<input type="submit" value="提交" style="width: 338px;" >
    </form>
    
  </body>
</html>
