<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>书籍更新页</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="css/all.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript">
		//显示书籍详细信息
		function showBookModel(){
			//Dialog d = new Dialog(new Shell(),SWT.CLOSE );
			//d.open(,,,);
			//弹出modalDialog方法
			//参数1：即将要显示的页面
			//参数3:left、top、width、height、menubar、toolbar、scrollbar、status、location、resizeable
			var obj = new Object();
			obj.ISBN='${book.ISBN}';
			obj.name='${book.name}';
			obj.price='${book.price}';
			obj.type='${book.type}';
			obj.pulichouse='${book.pulichouse}';
			obj.format='${book.format}';
			obj.publictime='${book.publictime}';
			obj.keywords='${book.keywords}';
			obj.imagepath='${book.imagepath}';
			obj.lang='${book.lang}';
			obj.pagenum='${book.pagenum}';
			obj.title='${book.title}';
			obj.shortcontent='${book.shortcontent}';
			obj.shortauth='${book.shortauth}';
			obj.pulichouse='${book.pulichouse}';
			obj.num = '${book.num}';
			//传字符串和js
			//打开模态窗体 window.showModalDialog
			var returnValue = window.showModalDialog("update_book_modal.jsp",obj,"dialogHeight:800px;dialogWidth:620px");
			//alert(returnValue);
			window.location.href="queryBooksPage.do";
			}
			function Textvalue(){
				//alert('${book}');
			}
	</script>
  </head>
  
  <body style="background: #e1e9eb;" onload="Textvalue();showBookModel()" >
		<form action="" id="mainForm" method="post">
			<div class="right">
				<div class="rightCont">
					<p class="g_title fix">内容列表 <a class="btn03" href="javascript:void(0);" onclick="addBookModel()">新 增</a>&nbsp;&nbsp;&nbsp;&nbsp;<a class="btn03" href="#">删 除</a></p>
					<table class="tab1">
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
					</table>
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
										<td><input type="checkbox" name="cb"/></td>
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
							共 <b>4</b> 条
							<a href='###' class='first'>首页</a>
							<a href='###' class='pre'>上一页</a>
							当前第<span>1/1</span>页
							<a href='###' class='next'>下一页</a>
							<a href='###' class='last'>末页</a>
							跳至&nbsp;<input type='text' value='1' class='allInput w28' />&nbsp;页&nbsp;
							<a href='###' class='go'>GO</a>
						</div>
					</div>
				</div>
			</div>
	    </form>
  </body>
</html>
