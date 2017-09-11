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
    
    <title>筛选页</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="css/select.css">
    <link rel="stylesheet" href="css/normalize.css">
    <script type="text/javascript">
    	function queryBookByName(){
    		var meg = document.getElementById("queryMeg").value;
    		//alert(meg);
    		window.location.href="queryBookByName.do?meg="+meg;
    		//window.location.href="queryBookByName.do";
    	}
    	function queryBookOrderByName(con){
    		var lastmeg = document.getElementById("meghid").value;
    		window.location.href="queryBookOrderByName.do?lastmeg="+lastmeg+"&conditions="+con;
    	}
    </script>
  </head>
  
  <body>
    <div class="header">
        <div id="nav" class="page-container">
             <div class="nav-item">
                <ul>
                    <li><a href=""></a></li>
                    <li><a href=""></a></li>
                    <li><a href=""></a></li>
                    <li><a href=""></a></li>
                </ul>
            </div>
            <div class="search-box">
                <form action="">
                    <input type="text" class="search_text" id = "queryMeg" value="${meg}">
                    <input type="hidden" class="" id = "meghid" value="${lastmeg }">
                    <input type="button" value="" class="search_b" onclick="queryBookByName()">
                </form>
            </div>
            <div class="login-area">
                <ul class="logined">
                    <li class="remind_warp"><a href="">我的购物车</a></li>
                    <li class="my_message"><a href="">我的通知</a></li>
                    <li class="user_card"><a href="">我的账户</a></li>
                </ul>
            </div>
        </div>
        <div class="headerfor">
            <div class="headerff">
                <span><a href="">首页</a></span>
            </div>
        </div>
    </div>
    <div class="searchwrap">
        <div class="crumbsbar"></div>
        <div class="container">
            <div class="selector">
                <div id="J_selectorPrice" class="selectorPrice w clearfix">
                    <div class="sl-wrap clearfix">
                        <div class="sl-key "><span>价格：</span></div>
                        <div class="sl-value clearfix">
                            <ul class="valueList fl">
                                <li>
                                    <a href="#" rel="nofollow"><i></i>0-29</a>
                                </li>
                                <li>
                                    <a href="#" rel="nofollow"><i></i>30-39</a>
                                </li>
                                <li>
                                    <a href="#" rel="nofollow"><i></i>40-49</a>
                                </li>
                                <li>
                                    <a href="#" rel="nofollow"><i></i>50以上</a>
                                </li>
                            </ul>
                            <div class="sl-price fl">
                                <input class="input-txt" value="" type="text"><em>-</em>
                                <input class="input-txt" value="" type="text">
                                <a href="#">确定</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="g-main">
                <div class="ml-wrap w">
                    <div class="filter">
                        <div class="sort fl">
                            <a href="">
                                <span>销量</span>
                                <em><i></i></em>
                            </a>
                            <a href="">
                                <span>评论数</span>
                                <em>
                                    <i></i>
                                </em></a>
                            <a href="">
                                <span>价格</span>
                                <em>
                                    <i></i>
                                </em>
                            </a>
                        </div>
                        <div id="J_topPage" class="f-pager fr">
                            <span class="fp-text">
                                <b>1</b>
                                <em>/</em>
                                <i>1</i>
                            </span>
                            <a class="fp-prev disabled" href="javascript:;">&lt;</a>
                            <a class="fp-next disabled" href="javascript:;">&gt;</a>
                        </div>
                        <div class="f-sum fr">
                            共<span id="J_resCount" class="num">${list.size() }</span>件商品
                        </div>
                    </div>
                    <div class="reconmendContent">
                    
                        <c:forEach items="${list }"  var="book">
                        	<div class="book-wrapper">
                            <a href="">
                                <img class="book-img" src="pic/demo11.jpg" alt="">
                                <div class="book-intro">
                                    <h3>${book.name }</h3>
                                    <p>${book.shortcontent }</p>
                                </div>
                                <div class="book-buttom">
                                    <span>￥${book.price }</span>
                                </div>
                            </a>
                        </div>          
                        </c:forEach>            

                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
