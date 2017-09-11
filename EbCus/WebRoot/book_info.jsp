<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

  <head>
    <base href="<%=basePath%>">
    
    <title>商品详情页</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">   
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/xcConfirm.css"/>
	<script src="js/jquery-1.9.1.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/xcConfirm.js" type="text/javascript" charset="utf-8"></script>
	<style type="text/css">
		.sgBtn{width: 135px; height: 35px; line-height: 35px; margin-left: 10px; margin-top: 10px; text-align: center; background-color: #0095D9; color: #FFFFFF; float: left; border-radius: 5px;}
	</style>
	<link rel="stylesheet" href="css/info.css">
    <link rel="stylesheet" href="css/normalize.css">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="js/jsAddress.js"></script>
	<script type="text/javascript">
		function changeNumber(){
			var num = document.getElementById("number").value;
			num = num == 1 ? 1 : num-1;
			document.getElementById("number").value = num;
		}
		//通过Ajax技术  将书籍添加到购物车
		function addBookToCarByAjax(){
			var request = new XMLHttpRequest();//创建请求对象
			request.onreadystatechange = function(){
				//alert("1111");
				//alert(request.readyState);
				if(request.readyState==4){
					var returnValue = request.responseText;
					if(returnValue == "Yes"){
						/* alert("已经添加到购物车中"); */
						var txt=  "已经添加到购物车中";
						window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.success);
					}						
				}
			};
			var num = document.getElementById("number").value;
			//打开通道
			request.open("post", "addBookToCar.do?userID="+${user.userID}+"&bookISBN="+ ${book.ISBN }+"&price="+ ${book.price }
									+"&num="+num+"&discount=1", true);
			//设置请求的头部信息
			request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			//把参数发送到servlet
			request.send(null);
		}
		//通过Ajax技术设置降价通知
		function toDownList(){
			//alert();
			var request = new XMLHttpRequest();//创建请求对象
			request.onreadystatechange = function(){
				if(request.readyState==4){
					var returnValue = request.responseText;
					if(returnValue == "yes"){
						var txt=  "该商品一降价,将会立即通知您,请及时查看消息盒子";
						window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.success);
					}						
				}
			};
			request.open("post", "addBookToDownlist.do?ISBN="+${book.ISBN}+"&price="+${book.price}, true);
			request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			request.send(null);
		}
	</script>
  </head>

<body>
	
	<!-- 页头部分  -->
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
                    <input type="text" class="search_text">
                    <input type="submit" value="" class="search_b">
                </form>
            </div>
            <div class="login-area">
                <ul class="logined">
                    <li class="remind_warp"><a href="selectBooksByUserID.do">我的购物车</a></li>
                    <li class="my_message"><a href="">我的通知</a></li>
                    <li class="user_card"><a href="">我的账户</a></li>
                </ul>
            </div>
        </div>
        <div class="headerfor">
            <div class="headerff">
                <span><a href="getMessageTo.do?url=index.jsp">首页</a></span>
            </div>
        </div>
    </div>
    <div class="root-nav">
        <div class="w">
            <div class="fl" style="background:background: #1f78e7;">
                <strong>
                <a href="" style="text-decoration: none; color: black;">图书</a>
                <span>&nbsp > &nbsp<a href="">计算机互联网</a></span>
                <span>&nbsp > &nbsp<a href="">${book.name}</a></span>
            </strong>
            </div>
        </div>
    </div>
    <div class="b-box" style="padding-top: 100px; height: 450px;">
        <div class="w">
        	<!-- 书籍图片信息 -->
            <div class="book-info">
                <div class="preview" style="height: 450px; border-bottom: 6px solid #bda5a5;">
                    <div class="book-i">
                        <img src="image/${book.imagepath}" alt="" height="300" width="300">
                    </div>
                    <!-- 
                    <ul class="spec-list">
                        <li><img src="pic/1.jpg" alt=""></li>
                        <li><img src="pic/2.jpg" alt=""></li>
                        <li><img src="pic/3.jpg" alt=""></li>
                        <li><img src="pic/4.jpg" alt=""></li>
                        <li><img src="pic/1.jpg" alt=""></li>
                    </ul>
                    -->
                    <div class="share"></div>
                </div>
                <!-- 订购信息 -->
                <div class="b-item" style="height: 450px; border-bottom: 6px solid #bda5a5; width: 590px;">
                    <div class="name" style="padding-bottom: 30px;">
                        <h3>${book.name}</h3>
                        <h4 style="color:red width: 523px;">
                            ${book.title }
                        </h4>
                        <!--  
                        <h5>Lorem ipsum dolor sit amet, con </h5>
                        -->
                    </div>
                    <div class="summary">
                        <div class="price">
                            <span class="fl" style="font-size:20px;">价格:</span>
                            <strong><span class="fl pri" style="color:red;padding-top:2px;">￥${book.price}</span></strong>
                            <!--
                                <div class="fl disc" style="margin-left:5px;padding-top:2px;">[8.5折]</div>
                                <div class="fl yj" style="margin-left:10px;padding-top:2px;">[定价:￥128.00]</div>
                              -->
                            <a href="javascript:void(0)" class="notice" class="fl" style="margin-left:5px;padding-top:3px;" onclick="toDownList()" >降价通知</a>
                        </div>
                        <div class="place">
                            <div class="city fl">
                                <span>配送至:</span>
                                <select id="cmbProvince" name="cmbProvince">
                                	
                                </select>
    							<select id="cmbCity" name="cmbCity">
    								
    							</select>
    							<select id="cmbArea" name="cmbArea">
    								
    							</select>
    							<script type="text/javascript">
									addressInit('cmbProvince','cmbCity','cmbArea');
								</script>
                            </div>
                            <div class="state fl">
                                <span>有货</span>
                            </div>
                        </div>
                    </div>
                    <div class="choose">
                        <div class="amount">
                            <span class="fl">选购数量</span>
                            <div class="add fl">
                                <a href="javascript:void(0)" onclick="changeNumber()">-</a>
                            </div>
                            <div class="tt fl">
                                <input type="text" id = "number" value="1" readOnly="true" style="text-align: center">
                            </div>
                            <div class="sub fl">
                                <a href="javascript:void(0)" onclick="document.getElementById('number').value++">+</a>
                            </div>
                        </div>
                        <div class="button fl">
                            <input type="button" value="加入购物车" onclick="addBookToCarByAjax()">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 书籍详细信息 -->
    <div class="prod" style="padding-bottom: 80px;">
        <div class="w">
            <div class="right">
                <div id="product-detail">
                    <div class="hd">
                        <ul class="ul">
                            <li class="product-detali"><a href="javascript:void(0)" onclick="document.getElementById('product-detail').scrollIntoView();" >商品介绍</a></li>
                            <li class="comment"><a href="javascript:void(0)" onclick="document.getElementById('comment').scrollIntoView();" >商品评论</a></li>
                        </ul>
                    </div>
                    <div class="product">
                        <div class="p-parameter">
                            <div class="item-mt">
                                <h3>书籍细节</h3>
                            </div>
                            <ul>
                                <li title="电子工业出版社">出版社： 电子工业出版社
                                </li>
                                <li title="9787121155352">ISBN：${book.ISBN }</li>
                                <!--  
                                <li title="5">版次：5</li>
                                <li title="11306138">商品编码：11306138</li>
                                <li title="Broadview">品牌：<a href="//www.jd.com/pinpai/1-1713-188126.html" clstag="shangpin|keycount|product|pinpai_1713">Broadview</a></li>
                                -->
                                <li title="平装">包装：${book.packages }</li>
                                <li title="16开">开本：${book.format }</li>
                                <li title="2013-09-01">出版时间：${book.publictime }</li>
                                <!-- 
                                <li title="胶版纸">用纸：胶版纸</li>
                                 -->
                                <li title="848">页数：${book.pagenum }</li>
                                <li title="中文">正文语种：${book.lang }</li>
                            </ul>
                        </div>
                        
                        <div id="J-detail-content">
                        	<!-- 
                            <div id="detail-tag-id-1" name="detail-tag-id-1" text="产品特色" class="book-detail-item">
                                <!--  
                                <div class="item-mt">
                                    <h3>产品特色</h3>
                                </div>
                                <div class="item-mc">
                                    <div class="book-detail-content">
                                        <p>
                                            <br><img data-lazyload="done" title="C++ Primer（中文版 第5版）.jpg" alt="" style="" src="//img30.360buyimg.com/vc/jfs/t2344/125/2193225213/329552/bb9828a/56f8d84dN83610bac.jpg"></p>
                                        <p>
                                            <br>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div id="detail-tag-id-2" name="detail-tag-id-2" text="编辑推荐">
                                <div class="item-mt">
                                    <h3>编辑推荐</h3>
                                </div>
                                <div class="item-mc">
                                    <div class="book-detail-content">
                                        <p>　　C++领域专家：潘爱民、孟岩作序，代表技术圈鼎力推荐！
                                            <br>　　一线C++工程师腾讯Milo、微软刘未鹏、陈梓瀚、阿里李云、侯凤林高水准技术审校！
                                            <br>　　如果只读一本C++书籍，相信所有读过的人都会毫不犹豫选择《C++ Primer（中文版）（第5版）》，无论初学或老手既可用来理解C++11规则背后的原理，也可用其新语言特性与标准库来快速构建健壮程序，采用中文版页码全面呈现原书大量交叉引用及详尽索引，新式辅学设置与课后操练用于避开陷阱、巩固良法！
                                            <br><strong><br></strong></p>
                                    </div>
                                </div>
                            </div>
                             -->
                            <div id="detail-tag-id-3" name="detail-tag-id-3" text="内容简介" class="book-detail-item">
                                <div class="item-mt">
                                    <h3>内容简介</h3>
                                </div>
                                <div class="item-mc">
                                    <div class="book-detail-content">
                                        <p>${book.shortcontent}</p>
                                    </div>
                                </div>
                            </div>
                            <div id="detail-tag-id-4" name="detail-tag-id-4" text="作者简介" class="book-detail-item">
                                <div class="item-mt">
                                    <h3>作者简介</h3>
                                </div>
                                <div class="item-mc">
                                    <div class="book-detail-content">
                                        ${book.shortauth}
                                    </div>
                                </div>
                            </div>
                            <!--  
                            <div id="detail-tag-id-9" name="detail-tag-id-9" text="内页插图" class="book-detail-item">
                                <div class="item-mt">
                                    <h3>内页插图</h3>
                                </div>
                                <div class="item-mc">
                                    <div class="illustrated">
                                        <ul class="img-preview">
                                            <li>
                                                <a href="#none">
                                                    <img class="ui-preview-img" src="//img30.360buyimg.com/n1/s130x160_jfs/t2458/294/2614815105/276245/cdc05dd6/56e26101N49c7374a.jpg" data-big-img="//img30.360buyimg.com/n1/s900x900_jfs/t2458/294/2614815105/276245/cdc05dd6/56e26101N49c7374a.jpg" alt="" width="150">
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#none">
                                                    <img class="ui-preview-img" src="//img30.360buyimg.com/n1/s130x160_jfs/t2413/223/2579151211/232766/e0f08c99/56e26101Nedb7c320.jpg" data-big-img="//img30.360buyimg.com/n1/s900x900_jfs/t2413/223/2579151211/232766/e0f08c99/56e26101Nedb7c320.jpg" alt="" width="150">
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#none">
                                                    <img class="ui-preview-img" src="//img30.360buyimg.com/n1/s130x160_jfs/t1945/277/2602579877/250486/c5a847f7/56e26102N84b46d81.jpg" data-big-img="//img30.360buyimg.com/n1/s900x900_jfs/t1945/277/2602579877/250486/c5a847f7/56e26102N84b46d81.jpg" alt="" width="150">
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#none">
                                                    <img class="ui-preview-img" src="//img30.360buyimg.com/n1/s130x160_jfs/t2365/241/2530343407/258627/a67f911c/56e26102N27a432b1.jpg" data-big-img="//img30.360buyimg.com/n1/s900x900_jfs/t2365/241/2530343407/258627/a67f911c/56e26102N27a432b1.jpg" alt="" width="150">
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div id="detail-tag-id-6" name="detail-tag-id-6" text="目录" class="book-detail-item">
                                <div class="item-mt">
                                    <h3>目录</h3>
                                </div>
                                <div class="item-mc">
                                    <div class="book-detail-content" style="height: 314px; overflow: hidden;">
                                        <p>第1章 开始
                                            <br>1.1 编写一个简单的C++程序
                                            <br>1.1.1 编译、运行程序
                                            <br>1.2 初识输入输出
                                            <br>1.3 注释简介
                                            <br>1.4 控制流
                                            <br>1.4.1 while语句
                                            <br>1.4.2 for语句
                                            <br>1.4.3 读取数量不定的输入数据
                                            <br>1.4.4 if语句
                                            <br>1.5 类简介
                                            <br>1.5.1 Sales_item类
                                            <br>1.5.2 初识成员函数
                                            <br>1.6 书店程序
                                            <br>小结
                                            <br>术语表
                                            <br>第Ⅰ部分 C++基础
                                            <br>
                                            <br>第2章 变量和基本类型
                                            <br>2.1 基本内置类型
                                            <br>2.1.1 算术类型
                                            <br>2.1.2 类型转换
                                            <br>2.1.3 字面值常量
                                            <br>2.2 变量
                                            <br>2.2.1 变量定义
                                            <br>2.2.2 变量声明和定义的关系
                                            <br>2.2.3 标识符
                                            <br>2.2.4 名字的作用域
                                            <br>2.3 复合类型
                                            <br>2.3.1 引用
                                            <br>2.3.2 指针
                                            <br>2.3.3 理解复合类型的声明
                                            <br>2.4 const限定符
                                            <br>2.4.1 const的引用
                                            <br>2.4.2 指针和const
                                            <br>2.4.3 顶层const
                                            <br>2.4.4 constexpr和常量表达式
                                            <br>2.5 处理类型
                                            <br>2.5.1 类型别名
                                            <br>2.5.2 auto类型说明符
                                            <br>2.5.3 decltype类型指示符
                                            <br>2.6 自定义数据结构
                                            <br>2.6.1 定义Sales_data类型
                                            <br>2.6.2 使用Sales_data类
                                            <br>2.6.3 编写自己的头文件
                                            <br>小结
                                            <br>术语表
                                            <br>
                                            <br>第3章 字符串、向量和数组
                                            <br>3.1 命名空间的using声明
                                            <br>3.2 标准库类型string
                                            <br>3.2.1 定义和初始化string对象
                                            <br>3.2.2 string对象上的操作
                                            <br>3.2.3 处理string对象中的字符
                                            <br>3.3 标准库类型vector
                                            <br>3.3.1 定义和初始化vector对象
                                            <br>3.3.2 向vector对象中添加元素
                                            <br>3.3.3 其他vector操作
                                            <br>3.4 迭代器介绍
                                            <br>3.4.1 使用迭代器
                                            <br>3.4.2 迭代器运算
                                            <br>3.5 数组
                                            <br>3.5.1 定义和初始化内置数组
                                            <br>3.5.2 访问数组元素
                                            <br>3.5.3 指针和数组
                                            <br>3.5.4 C风格字符串
                                            <br>3.5.5 与旧代码的接口
                                            <br>3.6 多维数组
                                            <br>小结
                                            <br>术语表
                                            <br>
                                            <br>第4章 表达式
                                            <br>4.1 基础
                                            <br>4.1.1 基本概念
                                            <br>4.1.2 优先级与结合律
                                            <br>4.1.3 求值顺序
                                            <br>4.2 算术运算符
                                            <br>4.3 逻辑和关系运算符
                                            <br>4.4 赋值运算符
                                            <br>4.5 递增和递减运算符
                                            <br>4.6 成员访问运算符
                                            <br>4.7 条件运算符
                                            <br>4.8 位运算符
                                            <br>4.9 sizeof运算符
                                            <br>4.10 逗号运算符
                                            <br>4.11 类型转换
                                            <br>4.11.1 算术转换
                                            <br>4.11.2 其他隐式类型转换
                                            <br>4.11.3 显式转换
                                            <br>4.12 运算符优先级表
                                            <br>小结
                                            <br>术语表
                                            <br>
                                            <br>第5章 语句
                                            <br>5.1 简单语句
                                            <br>5.2 语句作用域
                                            <br>5.3 条件语句
                                            <br>5.3.1 if语句
                                            <br>5.3.2 switch语句
                                            <br>5.4 迭代语句
                                            <br>5.4.1 while语句
                                            <br>5.4.2 传统的for语句
                                            <br>5.4.3 范围for语句
                                            <br>5.4.4 do
                                            <br>5.5 跳转语句
                                            <br>5.5.1 break语句
                                            <br>5.5.2 continue语句
                                            <br>5.5.3 goto语句
                                            <br>5.6 TRY语句块和异常处理
                                            <br>5.6.1 throw表达式
                                            <br>5.6.2 try语句块
                                            <br>5.6.3 标准异常
                                            <br>小结
                                            <br>术语表
                                            <br>
                                            <br>第6章 函数
                                            <br>6.1 函数基础
                                            <br>6.1.1 局部对象
                                            <br>6.1.2 函数声明
                                            <br>6.1.3 分离式编译
                                            <br>6.2 参数传递
                                            <br>6.2.1 传值参数
                                            <br>6.2.2 传引用参数
                                            <br>6.2.3 const形参和实参
                                            <br>6.2.4 数组形参
                                            <br>6.2.5 main：处理命令行选项
                                            <br>6.2.6 含有可变形参的函数
                                            <br>6.3 返回类型和return语句
                                            <br>6.3.1 无返回值函数
                                            <br>6.3.2 有返回值函数
                                            <br>6.3.3 返回数组指针
                                            <br>6.4 函数重载
                                            <br>6.4.1 重载与作用域
                                            <br>6.5 特殊用途语言特性
                                            <br>6.5.1 默认实参
                                            <br>6.5.2 内联函数和constexpr函数
                                            <br>6.5.3 调试帮助
                                            <br>6.6 函数匹配
                                            <br>6.6.1 实参类型转换
                                            <br>6.7 函数指针
                                            <br>小结
                                            <br>术语表</p>
                                    </div>
                                </div>
                                <div class="more"><a data-open="0" href="#detail-tag-id-6" clstag="shangpin|keycount|product|muluquanbu_3">查看全部↓</a></div>
                            </div>
                            <div id="detail-tag-id-7" name="detail-tag-id-7" text="精彩书摘" class="book-detail-item">
                                <div class="item-mt">
                                    <h3>精彩书摘</h3>
                                </div>
                                <div class="item-mc">
                                    <div class="book-detail-content" style="height: 314px; overflow: hidden;">
                                        <p>　　7.4.1 名字查找与类的作用域
                                            <br>　　在目前为止，我们编写的程序中，名字查找（ name lookup）（寻找与所用名字最匹配的声明的过程）的过程比较直截了当： 首先，在名字所在的块中寻找其声明语句，只考虑在名字的使用之前出现的声明。
                                            <br>　　如果没找到，继续查找外层作用域。
                                            <br>　　如果最终没有找到匹配的声明，则程序报错。
                                            <br>　　对于定义在类内部的成员函数来说，解析其中名字的方式与上述的查找规则有所区别，不过在当前的这个例子中体现得不太明显。类的定义分两步处理：
                                            <br>　　首先，编译成员的声明。
                                            <br>　　直到类全部可见后才编译函数体。
                                            <br>　　按照这种两阶段的方式处理类可以简化类代码的组织方式。因为成员函数体直到整个类可见后才会被处理，所以它能使用类中定义的任何名字。相反，如果函数的定义和成员的声明被同时处理，那么我们将不得不在成员函数中只使用那些已经出现的名字。
                                            <br>　　用于类成员声明的名字查找 这种两阶段的处理方式只适用于成员函数中使用的名字。声明中使用的名字，包括返回类型或者参数列表中使用的名字，都必须在使用前确保可见。如果某个成员的声明使用了类中尚未出现的名字，则编译器将会在定义该类的作用域中继续查找。
                                            <br>　　……</p>
                                    </div>
                                </div>
                                <div class="more"><a data-open="0" href="#detail-tag-id-7" clstag="shangpin|keycount|product|shuzhaiquanbu_3">查看全部↓</a></div>
                            </div>
                            <div id="detail-tag-id-8" name="detail-tag-id-8" text="前言/序言" class="book-detail-item">
                                <div class="item-mt">
                                    <h3>前言/序言</h3>
                                </div>
                                <div class="item-mc">
                                    <div class="book-detail-content" style="height: 314px; overflow: hidden;">
                                        <p>　　推荐序
                                            <br>　　C++11标准公布之后，C++社群出现了久违的热情，有人甚至叫出“C++的复兴”。指望C++回到20世纪90年代中期那样的地位显然是昧于大势的奢 望，但是C++经历了这么多年的打磨与起伏，其在工业界的地位已经非常稳固，在很多领域里已经是不可取代也没必要被取代的统治者。新标准的出现能够大大提 升C++开发的效率和质量，因此赢得欢呼也是情理之中。在这种氛围之下，编译器实现的速度也令人惊喜。短短两年时间，从开源的GCC、LLVM到专有的 Visual C++和Intel C++，对于新标准的追踪之快，覆盖之全，与当年C++ 98标准颁布之后迟迟不能落地的窘境相比，可谓对比强烈。当年是热情的开发者反复敦促厂商实现完整标准而不得，为此沮丧无奈，那种心情，至今记忆犹新。时 过境迁，今天是编译器实现远远冲在前面，开发者倒是大大地落在了后面。
                                            <br>　　时至今日，能够基本了解C++11标准的程序员恐怕不多，而能够以新的C++风格开发实践的人更是凤毛麟角。因此，今天的C++开发者面临的一个重要任务就是快速掌握新的C++风格和工具。
                                            <br>　　而说到教授“正宗的”C++11编程风格，《C++ Primer（第5版）》如同它之前的版本一样，扮演着法定教科书的角色。
                                            <br>　　一种优秀的编程语言，一定要对于计算这件事情实现一个完整和自洽的抽象。十几年来编程语言领域的竞争，除却实现质量之外，基本上是在比拼抽象的设计。而C 语言之所以四十年长盛不衰，根本在于它对于现代计算机提供了一个最底层的高级抽象：凡是比它低的抽象都过于简陋，凡是比它高的抽象都可以用C语言构造出 来。C++成功的根本原因，恰恰是因为它虽然试图提供一些高级的抽象机制，但是其根基与C在同一层面。正因为如此，每当你需要走下去直接与硬件对话 时，C++成为C之外唯一有效率的选择。我的一个朋友在进行了多年的大型系统软件开发之后，不无感慨地说，C++最大的力量不在于其抽象，恰恰在于其不抽 象。
                                            <br>　　话虽然如此，但是C++之所以脱离C而存在，毕竟还是因为其强大的抽象能力。Bjarne Stroustrup曾经总结说，C++同时支持4种不同的编程风格：C风格、基于对象、面向对象和泛型。事实上，把微软的COM也算进来的话，还可以加 上一种“基于组件”的风格。这么多的风格共存于一种语言，就是其强大抽象机制的证明。但是，在C++11以前，C++的抽象可以说存在若干缺陷，其中最严 重的是缺少自动内存管理和对象级别的消息发送机制。今天看来，C++ 98只能说是特定历史条件造成的半成品，无论是从语言机制，还是标准库完备程度来说，可以说都存在明显的、不容忽略的缺陷。其直接后果，就是优雅性的缺失 和效率的降低。我本人在十年前曾经与当时中国C++社群中不少杰出的人物交流探讨，试图从C++ 98中剪裁出一个小巧、优雅的、自成一体的子集，希望至少在日常编程中，能够在这个子集之内可以写出与当时的Java和C#同样干净明晰的代码。为此我们 尝试了各种古怪的模板技巧，并且到处寻找有启发的代码和经验来构造这个语言子集，结果并不理想，甚至可以说是令人非常失望。后来我在我的博客中发表过好几 篇文章，探讨所谓的C++风格问题，其实就是说，C++不支持简洁明快的面向对象风格，大家还不如回到基于对象甚至C语言的风格，最多加点模板，省一点代 码量。非要面向对象的话，就必须依赖像Qt或者MFC那样的基础设施才可以。
                                            <br>　　C++11出来之后，增强的语言机制和大为完善的标准库，为C++语言的编程风格带来了革命性的变化。如果能够纯熟地运用C++11的新特征、新机制，那 么就能够形成一种简洁优雅的C++编程风格，以比从前更高的效率、更好的质量进行软件开发。对于这种新的风格，我认为“直觉、自然”是最佳的描述。也就是 说，解决任何问题不必拘泥于什么笼盖一切的编程思想，也不再沉溺于各种古怪的模板技巧中无法自拔，而是能够根据那个问题本身采用最自然、最符合直觉的方 式。C++有自己的一套思维方式，比如容器、算法、作为概念抽象的对象等，很大程度上这套思维方式确实是合乎直觉的。只有到了C++11这一代，C++语 言的高级抽象才基本完备，这样一种风格才可能真正落实。因此可以说C++11对于C++ 98而言，不是一次简单的升级，而是一次本质的跃升。
                                            <br>　　学习新的C++风格，并不是轻而易举的事情。即便对于以前已经精通C++的人来说，熟练掌握rvalue reference、move语义，了解unique_ptr、shared_ptr和weak_ptr的完整用法，明智地使用 function/bind和lambda机制，学习C++ Concurrency的新技术，都绝非一朝一夕之功。对于那些初学者来说，这件事情更不简单。
                                            <br>　　本书无论对于初学者还是提高者，都是最经典的教科全书。一直以来，它的特点就是完整而详细，基本上关于语言本身的问题，都可以在这本书里得到解决。而本书 的另一个重要优点，就是其完全基于新的编程风格编写，所有的例子和讲解都遵循C++11标准所体现出来的思路和风格进行，如果能够踏下心来认真学习和练 习，那么就能“一次到位”地掌握C++11，尽管可能会比较慢。有经验的C++开发者阅读这本书当然不用从头到尾，选择自己关心的内容学习C++11的新 特性就可以，是快速升级自身能力的捷径。
                                            <br>　　差不多十年前，我提出一个观点，每一个具体的技术领域，只需要读四五本书就够了。以前的C++是个例外，因为语言设计有缺陷，所以要读很多书才知道如何绕过缺陷。现在的C++11完全可以了，大家读四五本书就可以达到合格的水平，这恰恰是语言进步的体现。
                                            <br>　　本书是这四五本中的一本，而且是“教程+参考书”，扛梁之作，初学者的不二法门。另一本是《C++标准程序库（第2版）》，对于C++熟手来说更为快捷。 Scott Meyers的Effective C++永远是学习C++者必读的，只不过这本书的第4版不知道什么时候出来。Anthony Williams的C++ Concurrency in Action是学习用标准C++开发并发程序的最佳选择。国内的作品，我则高度推荐陈硕的《Linux多线程服务端编程》。这本书的名字赶跑了不少潜在的 读者，所以我要特别说明一下。这本书是C++开发的高水平作品，与其说是教你怎么用C++写服务端开发，不如说是教你如何以服务端开发为例子提升C++开 发水平。前面几本书都是谈标准C++自己的事情，碰到像iostream这样失败的标准组件也不得不硬着头皮介绍。而这本书是接地气的实践结晶，告诉你面 对具体问题时应怎样权衡，C++里什么好用，什么不好用，为什么，等等。
                                            <br>　　今天的C++学习者是非常幸运的，可以在C++11这个基础上大步向前，不必再因为那些语言的缺陷和过度的技巧而烦恼。大家静下心来认真读这本书，可以打下很好的基础。
                                            <br>　　孟岩
                                            <br>　　2013年8月
                                            <br>　　北京</p><img data-lazyload="done" alt="" style="" src="//img10.360buyimg.com/bookDetail/jfs/t3100/359/268817775/181479/602cc28e/57ad6bc3N175e5632.jpg"></div>
                                </div>
                                <div class="more"><a data-open="0" href="#detail-tag-id-8" clstag="shangpin|keycount|product|qianyanquanbu_3" style="display: hidden">查看全部↓</a></div>
                            </div>
                            <br>
                            -->
                        </div>
                    </div>
                </div>
                <!-- 书籍的评价情况 -->
                <div id="comment">
                    <div class="item-mt">
                        <h3>商品评价</h3>
                    </div>
                    <div class="mc">
                        <div id="i-comment">
                            <div class="rate">
                                <strong>97<span>%</span></strong>
                                <br> <span>好评度</span> </div>
                            <div class="percent">
                                <dl> <dt>好评<span>(97%)</span></dt>
                                    <dd>
                                        <div style="width: 97px;"></div>
                                    </dd>
                                </dl>
                                <dl> <dt>中评<span>(02%)</span></dt>
                                    <dd class="d1">
                                        <div style="width: 2%;"></div>
                                    </dd>
                                </dl>
                                <dl> <dt>差评<span>(01%)</span></dt>
                                    <dd class="d1">
                                        <div style="width: 1%;"></div>
                                    </dd>
                                </dl>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 书籍的评价列表 -->
                <div id="comments-list">
                    <div class="item-mt">
                        <h3>全部评价</h3>
                    </div>
                    <div class="com-table-main">
                        <div class="com-item-main clearfix">
                            <div class="column1 clearfix">
                                <div class="grade-star g-star5">(5星)</div>
                                <div class="comment-time type-item">2016-11-16 09:41</div>
                            </div>
                            <div class="column2 clearfix">
                                <div class="p-comment">送货超快，书内容也是很好的！</div>
                            </div>
                            <div class="column3 clearfix">
                                <div class="user-item clearfix fl"> <img src="//storage.360buyimg.com/i.imageUpload/d0a1d1f235383531343635363230363539363136_sma.jpg" width="25" height="25" alt="小***5" class="user-ico">
                                    <div class="user-name fl">小***5</div>
                                </div>
                            </div>
                        </div>
                        <div class="com-item-main clearfix">
                            <div class="column1 clearfix">
                                <div class="grade-star g-star5">(5星)</div>
                                <div class="comment-time type-item">2016-11-16 09:41</div>
                            </div>
                            <div class="column2 clearfix">
                                <div class="p-comment">送货超快，书内容也是很好的！</div>
                                <div class="J-p-show-img p-show-img clearfix" clstag="shangpin|keycount|product|shaipic" style="display: block;">
                                    <ul class="clearfix">
                                        <!--1-->
                                        <!--0-->
                                        <li>
                                            <div class="J-show-more-pic" data-ind="0" data-href="//club.jd.com/bbsDetail/11306138_1274b56b-f0bb-4551-bebc-8bdd28ec70b3_1.html"><img src="//img30.360buyimg.com/n0/s76x76_jfs/t3613/118/1760363369/43972/ac38345a/58316bddNd00144d3.jpg" alt="小***5 的晒单图片"></div>
                                        </li>
                                        <!--2-->
                                        <!--0-->
                                        <li>
                                            <div class="J-show-more-pic" data-ind="1" data-href="//club.jd.com/bbsDetail/11306138_1274b56b-f0bb-4551-bebc-8bdd28ec70b3_1.html"><img src="//img30.360buyimg.com/n0/s76x76_jfs/t3376/278/1755050729/43580/b11ea80a/58316bddN7d804d31.jpg" alt="小***5 的晒单图片"></div>
                                        </li>
                                        <!--3-->
                                        <!--0-->
                                        <li>
                                            <div class="J-show-more-pic" data-ind="2" data-href="//club.jd.com/bbsDetail/11306138_1274b56b-f0bb-4551-bebc-8bdd28ec70b3_1.html"><img src="//img30.360buyimg.com/n0/s76x76_jfs/t3328/61/1733621615/68376/6cd833df/58316bdeNcf8f2787.jpg" alt="小***5 的晒单图片"></div>
                                        </li>
                                        <!--4-->
                                        <!--0-->
                                        <li>
                                            <div class="J-show-more-pic" data-ind="3" data-href="//club.jd.com/bbsDetail/11306138_1274b56b-f0bb-4551-bebc-8bdd28ec70b3_1.html"><img src="//img30.360buyimg.com/n0/s76x76_jfs/t3754/89/1674476782/76380/5ccb5c9d/58316bdfN58f08725.jpg" alt="小***5 的晒单图片"></div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="column3 clearfix">
                                <div class="user-item clearfix fl"> <img src="//storage.360buyimg.com/i.imageUpload/d0a1d1f235383531343635363230363539363136_sma.jpg" width="25" height="25" alt="小***5" class="user-ico">
                                    <div class="user-name fl">小***5</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="disscus"></div>
            </div>
            <!--<div class="left"></div>-->
        </div>
    </div>
    <div id="service-2014">
        <div class="slogen">
            <span class="item fore1"><i></i><b>多</b>品类齐全,轻松购物</span>
            <span class="item fore2"><i></i><b>快</b>多仓直发,极速配送</span>
            <span class="item fore3"><i></i><b>好</b>正品行货,精致服务</span>
            <span class="item fore4"><i></i><b>省</b>天天特价,畅选无忧</span>
        </div>
    </div>
    <div class="copy">
        &copy 高赛航
    </div>
</body>

</html>