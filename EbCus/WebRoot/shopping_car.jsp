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
    
    <title>我的购物车</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="css/normalize.css">
    <link rel="stylesheet" href="css/shopcar.css">
    <link rel="stylesheet" type="text/css" href="css/xcConfirm.css"/>
	<script src="js/jquery-1.9.1.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/xcConfirm.js" type="text/javascript" charset="utf-8"></script>
	<style type="text/css">
	.sgBtn{width: 135px; height: 35px; line-height: 35px; margin-left: 10px; margin-top: 10px; text-align: center; background-color: #0095D9; color: #FFFFFF; float: left; border-radius: 5px;}
	</style>
    <script type="text/javascript">
    	//计算购物车的总价
    	function BooksPriceSum(){
    		var cells = document.getElementsByName("cell_sumsss");
    		var sum = 0;
    		//alert(cells.length);
    		for(var i = 0; i < cells.length; i++){
    			//alert(parseFloat(cells[i].value));
    			sum += parseFloat(cells[i].value);
    		}
    		//alert(sum);
    		document.getElementById("sums").value = sum;
    	}
    	//全选反选
    	var is_checked = true;
		function checkall(){
			var list = document.getElementsByName("cb");
			var listb = document.getElementsByName("cbb");
			//alert(list.length);
			for(i = 0; i < list.length; i++)
				list[i].checked = is_checked;
			for(i = 0; i < listb.length; i++)
				listb[i].checked = is_checked;
			is_checked = !is_checked;
		}
		//增加商品的数量
		function AddBookNum(id){
			//alert(id);
			var num = document.getElementById('num'+id).value;
			var maxnum = document.getElementById('max'+id).value;
			if(num < parseInt(maxnum)){
				document.getElementById('num'+id).value++;
				var add_price = document.getElementById('price'+id).value;
				//alert(add_price);
				//计算小计
				var cell_sum = document.getElementById('cell_sum'+id).value;
				var tem = parseFloat(add_price) + parseFloat(cell_sum);
				document.getElementById('cell_sum'+id).value = tem;
				//计算总计
				var sums = document.getElementById('sums').value;
				var tems = parseFloat(add_price) + parseFloat(sums);
				document.getElementById("sums").value = tems;
			}			
		}
		//减少书籍的数量(一定要大于零)
		function SubBookNum(id){
			var num = document.getElementById('num'+id).value;
			if(num>1){
				document.getElementById('num'+id).value--;
				
				var add_price = document.getElementById('price'+id).value;
				//alert(add_price);
				//计算小计
				var cell_sum = document.getElementById('cell_sum'+id).value;
				var tem = parseFloat(cell_sum) - parseFloat(add_price);
				document.getElementById('cell_sum'+id).value = tem;
				//计算总计
				var sums = document.getElementById('sums').value;
				var tems = parseFloat(sums) - parseFloat(add_price);
				document.getElementById("sums").value = tems;
				
			}
		}
		//通过Ajax技术  购物车批量删除
		function deleteBooksFormCar(){
			var request = new XMLHttpRequest();//创建请求对象
			var list = document.getElementsByName("cb");
			var meg = '';
			var flag = false;
			for(var i = 0; i < list.length; i++){
				if(list[i].checked == true){
					if(flag) meg += '&';
					meg += 'booksISBN=';
					meg += list[i].id;
					flag = true;
				}
			}
			//alert(meg);
			//alert("deleteBooksFormCar.do?"+meg);
			request.open("post", "deleteBooksFormCar.do?"+meg, true);
			request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			request.send(null);
			request.onreadystatechange = function(){
				if(request.readyState==4){
					var returnValue = request.responseText;
					if(returnValue == "Yes"){
						alert("已经从购物车中删除");
						document.location.reload();
					}						
				}
			};
		}
		//进入结算界面
		function ToTotalPage(){
			
			//组合ISBN字符串和数量字符串
			var list = document.getElementsByName("cb");
			var meg = '';
			var meg_num = '';
			var flag = false;
			for(var i = 0; i < list.length; i++){
				if(list[i].checked == true){
					if(flag){
						meg += ';';
						meg_num += ';';
					}
					meg += list[i].id;
					meg_num += document.getElementById('num'+i).value;
					flag = true;
				}
			}
			if(flag==false){
				var txt=  "请选择要进行结算的书籍 ";
				window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.error);
				return ;
			}
			//alert(meg+"  "+meg_num);
			window.location.href="ToTotalPage.do?booksISBN="+meg+"&booksnum="+meg_num;
		}
    </script>
    
  </head>
  
  <body onload="BooksPriceSum()">
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
                    <input type="text" class="search_text" id="queryMeg" value="${page.message }">
                    <!--  
                    	<input type="hidden" class="" id = "meghid" value="${lastmeg }">
                     -->
                    <input type="button" value="" class="search_b" onclick="queryBookByName()">
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
    <div class="cart">
        <div class="jd-car w">
            <div class="main-new">
                <div class="car-head">
                    <div class="column t-checkbox">
                        <input type="checkbox" onclick="checkall()" name="cbb"> 全选
                    </div>
                    <div class="column t-goods">商品</div>
                    <div class="column t-props"></div>
                    <div class="column t-price">单价</div>
                    <div class="column t-quantity">数量</div>
                    <div class="column t-sum">小计</div>
                    <div class="column t-action">操作</div>
                </div>
                <div class="car-list">
                    <div class="wrap">
                        <div class="item-list">
                        	<c:forEach items="${books }"  var="book" varStatus="idx">
	                            <div class="item-form">
	                                <div class="cell p-checkbox">
	                                    <input type="checkbox" name="cb" id="${book.ISBN }">
	                                </div>
	                                <div class="cell p-goods" style="width: 420px;">
	                                    <div class="p-img" style="width: 60px">
	                                        <a href="">
	                                            <img src="image/${book.imagepath}" alt="" height="60" width="60">
	                                        </a>
	                                    </div>
	                                    <div class="item-msg" style="width: 350px;height: 70px">
	                                        <div class="p-name">
	                                            <a href="//item.jd.com/11345721.html" target="_blank">${book.name}</a>
	                                        </div>
	                                    </div>
	                                </div>
	                                <!-- 单价 -->
	                                <div class="cell p-price">
	                                    <input type="text" readOnly="readonly" name = "cell_sum"value="${book.price}" id="price${idx.index }" 
	                                    		style="width: 50px;text-align: center;border: 0px;background-color: transparent;font-weight: bold;"/>
	                                </div>
	                                <!-- 数量 -->
	                                <div class="cell p-quantity">
	                                    <div class="quantity-form">
	                                        <a href="javascript:void(0)" class="fl" onclick="SubBookNum('${idx.index}')">-</a>
	                                        <input class="fl" type="text" name = "booknum" value="${cars[idx.index].num }" id="num${idx.index }">
	                                        <input type="hidden" id="max${idx.index }" value="${book.num }">
	                                        <a href="javascript:void(0)" class="fl" onclick="AddBookNum('${idx.index}')">+</a>
	                                    </div>
	                                    <div class="state">
	                                        <span>有货</span>
	                                    </div>
	                                </div>	                
	                                <!-- 小计 -->
	                                <div class="cell p-sum">
	                                    <input type="text" readOnly="readonly" name = "cell_sumsss" value="${book.price * cars[idx.index].num }" id="cell_sum${idx.index }"
	                                    		style="width: 50px;text-align: center;border: 0px;background-color: transparent;font-weight: bold;"/>
	                                </div>
	                                <div class="cell p-ops">
	                                    <a href="deleteBooksFormCar.do?booksISBN=${book.ISBN }">删除</a>
	                                    <!-- <a href="">移到我的关注</a>  -->
	                                </div>
	                            </div>
	                    	</c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="cart-foot"></div>
    </div>
    <div class="toolbar" style="width: 1519px; height: 50.4px;">
        <div class="toolbar-wrap">
            <div class="options-box fl">
                <div class="select-all  fl">
                    <div class="cart-checkbox fl">
                        <input onclick="checkall()" id="toggle-checkboxes_down" name="cbb" class="jdcheckbox" type="checkbox">
                    </div>
                    <div class="fl">全选</div>
                </div>
                <div class="operation  fl">
                    <a href="javascript:void(0)" class="remove-batch" onclick="deleteBooksFormCar()">删除选中的商品</a>
                    <!-- <a href="javascript:void(0)" class="follow-batch">移到我的关注</a> -->
                </div>
                <div class="toolbar-right">
                    <div class="comm-right">
                        <div class="btn-area fr">
                            <a href="javascript:void(0)" onclick="ToTotalPage()" class="common-submit-btn">
								            结算
								   <b></b>
							</a>
                        </div>
                        <div class="price-sum fr">
                            <span class="txt">总价：</span>
                            <span class="sumPrice">
                            		<strong>￥</strong>
                                   <input type="text" id="sums" readOnly="readonly"
                                   		style="width: 50px;text-align: center;border: 0px;background-color: transparent;font-weight: bold;">
                            </span>
                        </div>
                        <div class="amount-sum fr">
                            已选择<em>3</em>件商品<b class="up"></b>
                        </div>
                    </div>
                </div>

            </div>
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
