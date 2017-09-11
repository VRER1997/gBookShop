<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">
    
    <title>书籍展示页</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<title>内容列表页面</title>
	<link href="css/all.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript">
		//删除
		function deletes(ISBN){
			window.location.href="delBook.do?ISBN="+ISBN;
		}
		
		//添加书籍的模态窗体
		function addBookModel(){
			var obj = new Object();
			obj.a=null;
			var returnValue = window.showModalDialog("add_book.jsp",obj,"dialogHeight:800px;dialogWidth:580px");
			alert("添加成功");
			window.location.href="queryBooksPage.do";
		}
		function showBookModel1(ISBN){
			//alert(ISBN);
			var request = new XMLHttpRequest();//创建请求对象
			request.onreadystatechange = function(){
			if(request.readyState==4){
				var returnValue = request.responseText;
				alert(returnValue);
				var obj = new Object();
				alert(returnValue.ISBN);
				obj.ISBN=returnValue.ISBN;
				
				var returnValue = window.showModalDialog("show_book_modal.jsp",obj,"dialogHeight:800px;dialogWidth:418px");
				//alert(returnValue);
				//window.location.href="showBook.do";
				}
			};
			//打开通道
			request.open("post", "showBookByISBN.do?ISBN="+ISBN, true);
			//设置请求的头部信息
			request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			//把参数发送到servlet
			request.send(null);
		}
		//显示书籍详细信息
		function showBookModel(ISBN){
			window.location.href="showBookByISBN.do?ISBN="+ISBN;
		}
		//更新书籍信息
		function updateBookModel(ISBN){
			//alert(ISBN);
			window.location.href="updateBookByISBN.do?ISBN="+ISBN;
		}
		//全选 反选
		var is_checked = true;
		function checkall(){
			var list = document.getElementsByName("cb");
			//alert(list.length);
			for(i = 0; i < list.length; i++)
				list[i].checked = is_checked;
			is_checked = !is_checked;
		}
		//删除所选的书籍内容
		//批量删除信息
		var selectedArray = [];
		function deleteSelectecBooks(){
			selectedArray = [];
			var list = document.getElementsByName("cb");
			//alert(list.length);
			for(i = 0; i < list.length; i++)
				if(list[i].checked) selectedArray.push(list[i].id);
			//alert(selectedArray);
			var tem = "";
			for(var i = 0; i < selectedArray.length; i++){
				if(i) tem +='&';
				tem += "ISBN="
				tem += selectedArray[i];
			}
			//alert(tem);
			window.location.href="delBooks.do?"+tem;
		}
	</script>
</head>
  
<body style="background: #e1e9eb;" >
		<form action="" id="mainForm" method="post">
			<div class="right">
				<div class="rightCont">
					<p class="g_title fix">内容列表 <a class="btn03" href="javascript:void(0);" onclick="addBookModel()">新 增</a>&nbsp;&nbsp;&nbsp;&nbsp;
							<a class="btn03" href="javascript:void(0);" onclick="deleteSelectecBooks()">删 除</a></p>
					<!-- <table class="tab1">
						<tbody>
							<tr>
								<td width="90" align="right">演示字段1：</td>
								<td>
									<input type="text" class="allInput" value=""/>
								</td>
								<td width="90" align="right">演示字段2：</td>
								<td>
									<input type="text" class="allInput" value=""/>
								</td>
	                            <td width="85" align="right"><input type="submit" class="tabSub" value="查 询" /></td>
	       					</tr>
						</tbody>
					</table> -->
					<%int cnt = 1; %>
					<div class="zixun fix">
						<table class="tab2" width="100%">
							<tbody>
								<tr>
								    <th><input type="checkbox" id="all" onclick="checkall()"/></th>
								    <th>序号</th>
								    <th>ISBN码</th>
								    <th>书籍名称</th>
								    <th>操作</th>
								</tr>
								<c:forEach items="${list }" var="book">
									<tr>
										<td><input type="checkbox" name="cb" id = "${book.ISBN }"/></td>
										<td><%=cnt %></td>
										<td>${book.ISBN }</td>
										<td>${book.name }</td>
										<td>
											<a href="javascript:void(0);" onclick="updateBookModel(${book.ISBN})">修改</a>&nbsp;&nbsp;&nbsp;
											<a href="javascript:void(0);" onclick="deletes(${book.ISBN})">删除</a>&nbsp;&nbsp;&nbsp;
											<a href="javascript:void(0);" onclick="showBookModel(${book.ISBN})">查看详情</a>
										</td>
										<%cnt++; %>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class='page fix'>
							共 <b>${page.total }</b> 条
							<a href="pageUp.do?nowPage=1" class="first">首页</a>
							<a href="pageUp.do?nowPage=${page.nowPage }" class="pre" >上一页</a>
							当前第<span id="nowPage">${page.nowPage }</span>/<span id="pageNum">${page.pageNum }</span>页
							<a href="pageDown.do?nowPage=${page.nowPage }" class="next">下一页</a>
							<a href="pageDown.do?nowPage=${page.pageNum }" class="last">末页</a>
							跳至&nbsp;<input type='text' value='1' class='allInput w28' />&nbsp;页&nbsp;
							<a href="#" class='go'>GO</a>
						</div>
					</div>
				</div>
			</div>
	    </form>
	</body>
</html>
