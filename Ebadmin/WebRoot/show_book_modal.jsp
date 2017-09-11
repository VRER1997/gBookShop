<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>书籍详细页</title>
    
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
		alert(arg.ISBN);
		window.location.href="showBookByISBN.do?ISBN="+arg.a;
	}
	function returnValueFromModal(){
		var fromIndex = document.getElementById("fromIndex").value;
		//把要返回的值返回去
		window.returnValue = fromIndex;
		window.close();//关闭模态窗体才能把值传回去
		
	}
	function Textvalue(){
		
		var t1 = document.getElementById("t1");
		t1.value = '${book.shortauth }';
		var t2 = document.getElementById("t2");
		t2.value = '${book.shortcontent }';
	}
	</script>
  </head>
  
  <body onload="Textvalue()">
    	<table>
    		<tr>
    			<td>ISBN</td>
    			<td><input name = "ISBN" type="text" value="${book.ISBN }"></td>
    		</tr>
    		<tr>
    			<td>书名</td>
    			<td><input name = "name"type="text" value="${book.name }"></td>
    		</tr>
    		<tr>
    			<td>价格</td>
    			<td><input name = "price"type="text" value="${book.price }"></td>
    		</tr>
    		<tr>
    			<td>书籍类型</td>
    			<td><input name = "type"type="text" value="${book.type }"></td>
    		</tr>
    		
    		<tr>
    			<td>出版社</td>
    			<td><input name = "pulichouse"type="text" value="${book.pulichouse }"></td>
    		</tr>
    		<!-- 
    		<tr>
    			<td>品牌</td>
    			<td><input name = "brands"type="text" value="${book.brands }"></td>
    		</tr>
    		
    		<tr>
    			<td>包装</td>
    			<td><input name = "packages"type="text" value="${book.packages }"></td>
    		</tr>
    		 -->
    		<tr>
    			<td>开本</td>
    			<td><input name = "format"type="text" value="${book.format }"></td>
    		</tr>
    		<tr>
    			<td>出版时间</td>
    			<td><input name = "publictime"type="text" value="${book.publictime }"></td>
    		</tr>
    		<!-- 
    		<tr>
    			<td>纸张</td>
    			<td><input name = "paper"type="text" value="${book.paper }"></td>
    		</tr>
    		-->
    		<tr>
    			<td>页数</td>
    			<td><input name = "pagenum"type="text" value="${book.pagenum }"></td>
    		</tr>
    		
    		<tr>
    			<td>语言</td>
    			<td><input name = "lang"type="text" value="${book.lang }"></td>
    		</tr>
    		<!--
    		<tr>
    			<td>数量</td>
    			<td><input name = "num" type="text" value="${book.num }"></td>
    		</tr>
    		 -->
    		<tr>
    			<td>搜索关键字</td>
    			<td><input name = "keywords"type="text" value="${book.keywords }"></td>
    		</tr>
    		<tr>
    			<td>封面图片</td>
    			<td><img src="image/${book.imagepath }" style="width: 200px; height: 200px"></td>
    		</tr>
    		<tr>
    			<td>标签语</td>
    			<td>
    				<textarea name="title" style="float: left; width: 550px; height:120px;">
    					${book.title}
    				</textarea>
    			</td>
    		</tr>
    		<tr>
    			<td>作者简介</td>
    			<td>
    				<textarea name="shortauth" style="float: left; width: 550px; height:120px;">
    					${book.shortauth}
    				</textarea>
    			</td>
    		</tr>
    		<tr>
    			<td>内容简介</td>
    			<td>
    				<textarea name="shortcontent" style="float: left; width: 550px; height:120px;">
    					${book.shortcontent}
    				</textarea>
    			</td>
    		</tr>
    			
    	</table>
    	<!-- <span style="float: left;">&nbsp;&nbsp;&nbsp;&nbsp;作者简介</span>
    	<textarea id = "t1" name="shortauth" style="float: left; width: 263px"></textarea>
    	<br>
    	<span style="float: left;">&nbsp;&nbsp;&nbsp;&nbsp;内容简介</span>
    	<textarea id = "t2" name="shortcontent" style="float: left; width: 261px" ></textarea>
    	<br> -->
  </body>
</html>
