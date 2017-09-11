<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>书籍更新对话框</title>
    
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
		var bookinfo = window.dialogArguments;
		document.getElementById("ISBN").value = bookinfo.ISBN;
		document.getElementById("name").value = bookinfo.name;
		document.getElementById("price").value = bookinfo.price;
		document.getElementById("type").value = bookinfo.type;
		document.getElementById("format").value = bookinfo.format;
		document.getElementById("publictime").value = bookinfo.publictime;
		document.getElementById("pagenum").value = bookinfo.pagenum;
		document.getElementById("lang").value = bookinfo.lang;
		document.getElementById("keywords").value = bookinfo.keywords;
		document.getElementById("lang").value = bookinfo.lang;
		document.getElementById("pagenum").value = bookinfo.pagenum;
		document.getElementById("pulichouse").value = bookinfo.pulichouse;
		document.getElementById("num").value = bookinfo.num;
		document.getElementById("title").value = bookinfo.title;
		document.getElementById("shortcontent").value = bookinfo.shortcontent;
		document.getElementById("shortauth").value = bookinfo.shortauth;
		//document.getElementById("image").value = bookinfo.image;
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
    <form action="updateBook.do" method="post" enctype="multipart/form-data" onsubmit="window.close();">
    	<table>
    		<tr>
    			<td>ISBN</td>
    			<td><input id = "ISBN" type="text" name = "ISBN"></td>
    		</tr>
    		<tr>
    			<td>书名</td>
    			<td><input id = "name"type="text" name = "name"></td>
    		</tr>
    		<tr>
    			<td>价格</td>
    			<td><input id = "price"type="text" name="price"></td>
    		</tr>
    		<tr>
    			<td>书籍类型</td>
    			<td><input id = "type"type="text" name="type"></td>
    		</tr>
    		
    		<tr>
    			<td>出版社</td>
    			<td><input id = "pulichouse"type="text" name="pulichouse"></td>
    		</tr>
    		<!--
	    		<tr>
	    			<td>品牌</td>
	    			<td><input name = "brands"type="text"></td>
	    		</tr>
    		<tr>
    			<td>包装</td>
    			<td><input name = "packages"type="text"></td>
    		</tr>
    		 -->
    		<tr>
    			<td>开本</td>
    			<td><input id = "format"type="text" name="format"></td>
    		</tr>
    		<tr>
    			<td>出版时间</td>
    			<td><input id = "publictime"type="text" name="publictime"></td>
    		</tr>
    		<!--
    		<tr>
    			<td>纸张</td>
    			<td><input id = "paper"type="text"></td>
    		</tr>
    		 -->
    		<tr>
    			<td>页数</td>
    			<td><input id = "pagenum"type="text" name="pagenum"></td>
    		</tr>
    		<tr>
    			<td>语言</td>
    			<td><input id = "lang"type="text" name="lang"></td>
    		</tr>
    		
    		<tr>
    			<td>数量</td>
    			<td><input id = "num" type="text" name="num"></td>
    		</tr>
    		
    		<tr>
    			<td>搜索关键字</td>
    			<td><input id = "keywords"type="text" name="keywords"></td>
    		</tr>
    		<tr>
    			<td>封面图片</td>
    			<td><input id = "image" type="file" style="width: 217px; "></td>
    		</tr>
    		<tr>
    			<td>标签语</td>
    			<td>
    				<textarea id = "title" name="title" style="float: left; width: 550px; height:120px;">
    					
    				</textarea>
    			</td>
    		</tr>
    		<tr>
    			<td>作者简介</td>
    			<td>
    				<textarea id = "shortauth" name="shortauth" style="float: left; width: 550px; height:120px;">
    					
    				</textarea>
    			</td>
    		</tr>
    		<tr>
    			<td>内容简介</td>
    			<td>
    				<textarea id = "shortcontent" name="shortcontent" style="float: left; width: 550px; height:120px;">
    					
    				</textarea>
    			</td>
    		</tr>
    	</table>
    	<input type="submit" value="提交" style="width: 338px;" >
    </form>
    
  </body>
</html>
