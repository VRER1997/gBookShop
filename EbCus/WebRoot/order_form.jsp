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
    
    <title>订单页</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="css/xcConfirm.css"/>
    <script src="js/jquery-1.9.1.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/xcConfirm.js" type="text/javascript" charset="utf-8"></script>
	<style type="text/css">
			.sgBtn{width: 135px; height: 35px; line-height: 35px; margin-left: 10px; margin-top: 10px; text-align: center; background-color: #0095D9; color: #FFFFFF; float: left; border-radius: 5px;}
	</style>
	<link rel="stylesheet" href="css/normalize.css">
	<link type="text/css" rel="stylesheet" href="css/common.css">
    <link type="text/css" rel="stylesheet" href="css/myjd.order2015.css">
    <link type="text/css" rel="stylesheet" href="css/t1.css">
    <link type="text/css" rel="stylesheet" href="css/basePath.css">
    <script type="text/javascript">
    	function checkNone(){
    		//alert(23);
    		var sizes = ${size};
    		//alert(sizes);
    		if(sizes == "0"){
    			var txt=  "最近您还没有下单,快去购物吧";
    			var option = {onOk: function(){window.location.href="getMessageTo.do?url=index.jsp";}};
				window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.warning,option);
				
    		}
    	}
    	function changeStatus(id){
    		var b = document.getElementById("stateButton_"+id).innerText;
    		var orderid=document.getElementById("orderid_"+id).value;
    		//alert(b);
    		if(b == '待付款'){
    			var option = {onOk: function(){window.location.href="changeOrderStatus.do?id="+orderid;}};
    			window.wxc.xcConfirm("已付款", window.wxc.xcConfirm.typeEnum.success,option);
    		}
    		if(b == "待收货"){
    			var option = {onOk: function(){window.location.href="changeOrderStatus.do?id="+orderid;}};
    			window.wxc.xcConfirm("已收货", window.wxc.xcConfirm.typeEnum.success,option);
    		}
			if(b == "待评价"){
    			var option = {onOk: function(){window.location.href="changeOrderStatus.do?id="+orderid;}}; 
    			window.wxc.xcConfirm("已评价", window.wxc.xcConfirm.typeEnum.success,option);
    			/* var obj = new Object();
    			var list = document.getElementsByName("image_"+id).value;
    			alert(list);
				obj.a=list;
				//alert(obj.a);
				var returnValue = window.showModalDialog("modal/comment_modal.jsp",list,"dialogHeight:400px;dialogWidth:800px"); */
    		}    		
    	}
    </script>
  </head>
  
  <body myjd="_MYJD_ordercenter" onload="checkNone()">
    <div id="container">
        <div class="w">
            <div id="content">

                <div id="main">
                    <div id="chunjie" class="mb10"></div>
                    <div class="mod-main mod-comm mod-order" id="order01">
                        <div class="mt">
                            <h3>我的订单</h3>
                            <div class="extra-r"></div>
                        </div>
                    </div>
                    <div class="safety-box hide">
                    </div>

                    <div class="mod-main mod-comm lefta-box" id="order02">
                        <div class="mt">
                            <ul class="extra-l">
                                <li class="fore1"><a href="" class="txt curr">全部订单</a></li>
                                <li><a href="" id="ordertoPay" class="txt">待付款</a></li>
                                <li><a href="" id="ordertoReceive"class="txt">待收货</a></li>
                                <li><a href="" id="ordertoComment" target="_blank" class="txt">待评价</a></li>
                            </ul>
                            <div class="extra-r">
                                <div class="search">
                                    <input id="ip_keyword" class="itxt" placeholder="商品名称/商品编号/订单号" style="color: rgb(204, 204, 204);" type="text">
                                    <a href="javascript:;" class="search-btn">搜索<b></b></a>

                                </div>
                            </div>
                        </div>
                        <div class="mc">
                            <table class="td-void order-tb">
                                <colgroup>
                                    <col class="number-col">
                                        <col class="consignee-col">
                                            <col class="amount-col">
                                                <col class="status-col">
                                                    <col class="operate-col">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th>
                                            <div class="ordertime-cont">
                                                <div class="time-txt">近三个月订单<b></b><span class="blank"></span></div>
                                                <div class="time-list">
                                                    <ul>
                                                        <li><a href="#none" class="curr"><b></b>近三个月订单</a></li>
                                                        <li><a href="#none" ><b></b>今年内订单</a></li>
                                                        <li><a href="#none" ><b></b>2016年订单</a></li>
                                                        <li><a href="#none" ><b></b>2015年订单</a></li>
                                                        <li><a href="#none" ><b></b>2014年订单</a></li>
                                                        <li><a href="#none" ><b></b>2014年以前订单</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="order-detail-txt ac">订单详情</div>
                                        </th>
                                        <th>收货人</th>
                                        <th>金额</th>
                                        <th>
                                            <div class="deal-state-cont" id="orderState">
                                                <div class="state-txt">全部状态<b></b><span class="blank"></span></div>
                                                <div class="state-list">
                                                    <ul>
                                                        <li value="4096">
                                                            <a href="#none"  class="curr"><b></b>全部状态</a>
                                                        </li>
                                                        <li value="1">
                                                            <a href="#none" ><b></b>等待付款</a>
                                                        </li>
                                                        <li value="128" >
                                                            <a href="#none"><b></b>等待收货</a>
                                                        </li>
                                                        <li value="1024">
                                                            <a href="#none" ><b></b>已完成</a>
                                                        </li>
                                                        <li value="-1">
                                                            <a href="#none" ><b></b>已取消</a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </th>
                                        <th>操作</th>
                                    </tr>

                                </thead>
                                
                                
                                <c:forEach items="${orders }"  var="order" varStatus="idx">
                                <tbody id="tb-49601734518">
                                    <tr class="sep-row">
                                        <td colspan="5"></td>
                                    </tr>

                                    <tr class="tr-th">
                                        <td colspan="5">
                                            <span class="gap"></span>
                                            <span class="dealtime" title="2017-02-22 08:41:15">${orders[idx.index].ordertime}</span>
                                            <input id="datasubmit-49601734518" value="2017-02-22 08:41:15" type="hidden">
											<input type="hidden" id="orderid_${idx.index}" value="${orders[idx.index].id}">
                                            <span class="number">订单号：<a name="orderIdLinks" id="idUrl49601734518" target="_blank">${orders[idx.index].id}</a>    
	                                </span>

                                            <div class="tr-operate">
                                                <span class="order-shop">
													    	<!-- <span class="shop-txt">京东</span>  -->                                               
                                                </span>


                                                <a href="#none" class="order-del" style="display: none;" title="删除"></a>

                                            </div>
                                        </td>
                                    </tr>

									
									<!-- 第一行  -->
                                    <tr class="tr-bd" id="track49601734518">
                                        <td>
                                            <div class="goods-item p-10786850607">
                                                <div class="p-img">
                                                    <a href="//item.jd.com/10786850607.html"  target="_blank">
                                                        <img class="" src="image/${bookss[idx.index][0].imagepath }"width="60" height="60">
														<input type="hidden" name="image_${idx.index}" value="image/${bookss[idx.index][0].imagepath}">
                                                    </a>
                                                </div>
                                                <div class="p-msg">
                                                    <div class="p-name"><a href=""target="_blank">${bookss[idx.index][0].name }</a></div>
                                                    <!-- <div class="p-extra">
                                                        <ul class="o-info">
                                                            <li><span class="o-similar J-o-similar" data-sku="10786850607"><i></i><em>相似商品</em></span></li>
                                                        </ul>
                                                    </div> -->
                                                </div>
                                            </div>
                                            <div class="goods-number">
                                                x${numss[idx.index][0] }
                                            </div>


                                            <div class="goods-repair">
                                            </div>
                                            <div class="clr"></div>
                                        </td>

                                        <td rowspan="5">
                                            <div class="consignee tooltip">
                                                <span class="txt">${addresses[idx.index].name}</span><b></b>
                                                <div class="prompt-01 prompt-02" style="display: none;">
                                                    <div class="pc">
                                                        <strong>高赛航</strong>
                                                        <p>吉林长春市朝阳区城区长春理工大学(南校区北门)</p>
                                                        <p>188****8959</p>
                                                    </div>
                                                    <div class="p-arrow p-arrow-left"></div>
                                                </div>
                                            </div>
                                        </td>
                                        <td rowspan="5">
                                            <div class="amount">
                                                <span>￥${order.totalprice}</span>
                                                <br>
                                                <span class="ftx-13">${order.payment}</span>
                                            </div>
                                        </td>
                                        <td rowspan="5">
                                            <div class="status">
                                                <span class="order-status ftx-03">
                                            
            	                                    	${order.orderstate}
            
                                        		</span>
                                                <br>

                                                <a href="//details.jd.com/normal/item.action?orderid=49601734518&amp;PassKey=521C27C4DD405131E15C16770F30D8D9" clstag="click|keycount|orderlist|dingdanxiangqing" target="_blank">订单详情</a>
                                            </div>
                                        </td>
                                        <td rowspan="5">
                                            <div class="operate">
                                                <div id="pay-button-49601734518">
                                                	<button id = "stateButton_${idx.index }"onclick="changeStatus('${idx.index }')" style="height: 30px;width: 66px;font-size: 12px;">${order.orderstate}</button>
                                                </div>
                                                <br>

                                            </div>
                                        </td>
                                    </tr>
									
									<!-- 以后的行 -->
									<c:forEach items="${indexss[idx.index]}" var="indexs">
                                    <tr class="tr-bd" id="" oty="">
                                        <td>
                                            <div class="goods-item p-10787431525">
                                                <div class="p-img">
                                                    <a href="//item.jd.com/10787431525.html" target="_blank">
                                                        <img class="" src="image/${bookss[idx.index][indexs].imagepath }" width="60" height="60">
                                                    	<input type="hidden" name="image_${idx.index}" value="image/${bookss[idx.index][indexs].imagepath}">
                                                    </a>
                                                </div>
                                                <div class="p-msg">
                                                    <div class="p-name"><a href="" class="a-link" target="_blank" >${bookss[idx.index][indexs].name }</a></div>
                                                    <!-- <div class="p-extra">
                                                        <ul class="o-info">
                                                            <li><span class="o-similar J-o-similar" data-sku="10787431525"><i></i><em>相似商品</em></span></li>
                                                        </ul>
                                                    </div> -->
                                                </div>
                                            </div>
                                            <div class="goods-number">
                                                x${numss[idx.index][indexs] }
                                            </div>
                                            <div class="goods-repair">
                                            </div>
                                            <div class="clr"></div>
                                        </td>

                                    </tr>
                                	</c:forEach>
                                </tbody>
                            	</c:forEach>
                            </table>

                           <!--  <div class="mt20">
                                <div class="pagin fr">

                                     <span class="text">共1条记录</span>    <span class="text">共1页</span>
                                    <span class="prev-disabled">上一页<b></b></span>

                                    <span class="prev-disabled">首页</span>
                                    <a class="current">1</a>
                                    <span class="next-disabled">末页</span> 
                                    <span class="next-disabled">下一页<b></b></span>
                                </div>
                                <div class="clr"></div>
                            </div> -->
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
</body>
</html>
