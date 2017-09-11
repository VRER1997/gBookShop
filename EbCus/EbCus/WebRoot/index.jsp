<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/normalize.css">
    <script type="text/javascript">
    	function queryBookByName(){
    		var meg = document.getElementById("queryMeg").value;
    		alert(meg);
    		window.location.href="queryBookByName.do?meg="+meg;
    		//window.location.href="queryBookByName.do";
    	}
    </script>
  </head>
  
  <body>
    <script type="text/javascript">
        window.onload = function () {
            var Lis = document.getElementsByTagName("li");
            for (var i = 0; i < Lis.length; i++) {
                Lis[i].i = i;
                Lis[i].onmouseover = function (){
                    this.className = "lihover";

                    var h0 = (this.i - 1) * 17.5;
                    //this.getElementsByTagName("div")[0].style.top = h0 + "px";
                    //var y = this.getElementsByTagName("div")[0].offsetHeight;
                    //var h = this.getElementsByTagName("div")[0].style.top + y;
                    //h = h + 300;
                    if (h < h0) {
                        this.getElementsByTagName("div")[0].style.top = h0 + "px";
                    }

                    if (y > 550) {
                        this.getElementsByTagName("div")[0].style.top = "3px";
                    }
                }

                Lis[i].onmouseout = function (){
                    this.className = "";
                }
            }

        }
    </script>
    <div class="header">
        <div id="nav" class="page-container">
            <div class="nav-item">
                <ul>
                    <li>
                        <a href=""></a>
                    </li>
                    <li>
                        <a href=""></a>
                    </li>
                    <li>
                        <a href=""></a>
                    </li>
                    <li>
                        <a href=""></a>
                    </li>
                </ul>
            </div>
            <div class="search-box">
                <form action="">
                    <input type="text" class="search_text" id = "queryMeg">
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
                <span>商品分类</span>
            </div>
        </div>
    </div>
    <div class="g-banner">
        <div class="menuwrap">
            <div class="menuitems">
                <ul class="topmenu">
                    <li><a href="">文学馆</a>
                        <span></span>
                        <div class="submenu">
                            <div class="leftdiv">
                                <dl>
                                    <dt><a href="#">电子书</a></dt>
                                    <dd>
                                        <a href="#">免费</a> <a href="#">小说</a> <a href="#">励志与成功</a> <a href="#">婚恋/两性</a>
                                        <a href="#">文学</a> <a href="#">经管</a> <a href="#">畅读VIP</a>
                                        <a href="#">文学</a> <a href="#">经管</a> <a href="#">畅读VIP</a>
                                    </dd>
                                </dl>
                            </div>
                        </div>
                    </li>
                    <li><a href="">童书馆</a></li>
                    <li><a href="">教育馆</a></li>
                    <li><a href="">人文社科馆</a></li>
                    <li><a href="">经管馆</a></li>
                    <li><a href="">励志成功馆</a></li>
                    <li><a href="">生活馆</a></li>
                    <li><a href="">艺术馆</a></li>
                    <li><a href="">科技馆</a></li>
                    <li><a href="">计算机馆</a>
                        <span></span>
                        <div class="submenu">
                            <div class="leftdiv">
                                <dl>
                                    <dt><a href="#">热门搜索</a></dt>
                                    <dd>
                                        <a href="#">Java</a>
                                        <a href="#">Linux</a>
                                        <a href="#">Python</a>
                                        <a href="#">PHP</a>
                                        <a href="#">Android</a>
                                        <a href="#">算法</a>
                                        <a href="#">图灵图书</a>
                                        <a href="#">机器学习</a>
                                        <a href="#">游戏</a>
                                    </dd>
                                    <dt><a href="#">编程语言</a></dt>
                                    <dd>
                                        <a href="#">C++</a>
                                        <a href="#">JavaScript</a>
                                        <a href="#">spring</a>
                                        <a href="#">c#</a>
                                        <a href="#">Jsp</a>
                                        <a href="#">R语言</a>
                                        <a href="#">HTML5</a>
                                    </dd>
                                    <dt><a href="#">办公软件</a></dt>
                                    <dd>
                                        <a href="#">PPT</a>
                                        <a href="#">Word</a>
                                        <a href="#">Excel</a>
                                    </dd>
                                    <dt><a href="#">数据库</a></dt>
                                    <dd>
                                        <a href="#">Oracle</a>
                                        <a href="#">Mysql</a>
                                        <a href="#">SQLserver</a>
                                        <a href="#">spark</a>
                                        <a href="#">Hadoop</a>
                                        <a href="#">SQL语言</a>
                                        <a href="#">NoSQL</a>
                                        <a href="#">Access</a>
                                    </dd>
                                    <dt><a href="#">图像处理</a></dt>
                                    <dd>
                                        <a href="#">PS</a>
                                        <a href="#">3ds Max</a>
                                        <a href="#">Iilustrator</a>
                                        <a href="#">Premiere</a>
                                        <a href="#">MAYA</a>
                                        <a href="#">After Effects</a>
                                    </dd>
                                    <dt><a href="#">更多分类</a></dt>
                                    <dd>
                                        <a href="#">软件工程</a>
                                        <a href="#">计算机安全</a>
                                        <a href="#">电子商务</a>
                                        <a href="#">专用软件</a>
                                        <a href="#">云计算</a>
                                        <a href="#">考试认证</a>
                                        <a href="#">辅助设计</a>
                                        <a href="#">网页制作</a>
                                        <a href="#">网络通信</a>
                                    </dd>
                                </dl>
                            </div>
                        </div>
                    </li>
                    <li><a href="">英文原版图书</a></li>
                    <li><a href="">杂志/期刊</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="outwrap-course">
        <div class="contentwrap">
            <div class="recomend">
                <span>好书推荐</span>
                <span class="more"><a href="" class="fr">更多</a></span>
            </div>
            <div class="reconmendContent">
                <div class="book-wrapper">
                    <a href="">
                        <img class="book-img" src="pic/demo1.jpg" alt="">
                        <div class="book-intro">
                            <h3>有一个标题</h3>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi.sfsfsfsfas</p>
                        </div>
                        <div class="book-buttom">
                            <span>￥168.00</span>
                        </div>
                    </a>
                </div>
                <div class="book-wrapper">
                    <a href="">
                        <img class="book-img" src="pic/demo1.jpg" alt="">
                        <div class="book-intro">
                            <h3>有一个标题</h3>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi.sfsfsfsfas</p>
                        </div>
                        <div class="book-buttom">
                            <span>￥168.00</span>
                        </div>
                    </a>
                </div>
                <div class="book-wrapper">
                    <a href="">
                        <img class="book-img" src="pic/demo1.jpg" alt="">
                        <div class="book-intro">
                            <h3>有一个标题</h3>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi.sfsfsfsfas</p>
                        </div>
                        <div class="book-buttom">
                            <span>￥168.00</span>
                        </div>
                    </a>
                </div>
                <div class="book-wrapper">
                    <a href="">
                        <img class="book-img" src="pic/demo1.jpg" alt="">
                        <div class="book-intro">
                            <h3>有一个标题</h3>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi.sfsfsfsfas</p>
                        </div>
                        <div class="book-buttom">
                            <span>￥168.00</span>
                        </div>
                    </a>
                </div>
                <div class="book-wrapper">
                    <a href="">
                        <img class="book-img" src="pic/demo1.jpg" alt="">
                        <div class="book-intro">
                            <h3>有一个标题</h3>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi.sfsfsfsfas</p>
                        </div>
                        <div class="book-buttom">
                            <span>￥168.00</span>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <div class="outwrap-content"></div>
    <div class="foot"></div>
</body>
</html>
