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
    
    <title>商品结算页</title>
    
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
	<link rel="stylesheet" href="css/total_page.css">
    <link rel="stylesheet" href="css/normalize.css">
    <link rel="stylesheet" href="css/showBo.css">
    <script src="js/jquery-3.1.1.js"></script>
    <script type="text/javascript">
    	//计算总价
    	function totalPrice(){
    		var cell_sums = document.getElementsByName("cell_sum");
    		var total = 0;
    		for(var i = 0; i < cell_sums.length; i++){
    			total += parseFloat(cell_sums[i].value);
    		}
    		//Showbo.Msg.confirm
    		//alert(total);
    		//Showbo.Msg.alert(total);
    	}
    	//打开地址的模态窗体
    	function openAddressModal(){
			var obj = new Object();
			obj.a=null;
			var returnValue = window.showModalDialog("modal/Address_add.jsp",obj,"dialogHeight:400px;dialogWidth:800px");
    		window.location.reload();
    	}
    	//选择改变时的样式
    	function changeSelectClick(id){
    		var divv = document.getElementById(id);
    		divv.style.border='2px solid #e4393c';
    		divv.style.padding='4px 23px;';
    		if(id=="1") {
    			changeSelectConcel('2');
    			document.getElementById("payment").value="货到付款";
    		}
    		if(id=="2") {
    			changeSelectConcel('1');
    			document.getElementById("payment").value="在线付款";
    		}
    	}
    	//选择其他时样式取消
    	function changeSelectConcel(id){
    		var divv = document.getElementById(id);
    		divv.style.border='';
    		divv.style.padding='';
    	}
    	//通过Ajax技术提交订单
    	function orderSubmitByAjax(){
    		//alert(123);
    		$.ajax({
				type: "POST",
				url:"addOrder.do",
				data:$('#order_form').serialize(),//序列化
				async: false,
				success: function(data) {
					//alert(data);
					//window.close();
					var option = {onOk:function(){window.opener=null;window.open('','_self');window.close();}};
					window.wxc.xcConfirm(data, window.wxc.xcConfirm.typeEnum.success,option); 
				},
				error: function(err) {
					alert(err);
				}
			});
    	}
    	//展现所有的地址
    	function show_ConsigneeAll(){
    		var divv = document.getElementById('consignee1');
    		divv.style.height = 54 * ${otheraddresses.size()+1};
    	}
    	function changeAddress(id){
    		var num = parseInt(id);
    		var size = parseInt(${otheraddresses.size()+1});
    		//$("#address_"+id).addClass("item-selected"); //添加样式
    		for(var i = 0; i < size; i++){
    			//alert(i);
    			if(i == num){
    				//alert(i);
    				$("#address_"+i).addClass("item-selected"); //添加样式
    			}
    			else{
    				$("#address_"+i).removeClass("item-selected"); //删除样式
    			}
    		}
    		var addressID = document.getElementById("addressID");
    		if(num > 0){
    			var tem = document.getElementById("addressflag_"+num).value;
    			//alert(tem);
    			addressID.value=tem;
    		}
    	}
    </script>
  </head>
  
  <body id="mainframe" onload="totalPrice()">
    <div class="w w1 header clearfix">
        <div class="stepflex" id="#sflex03">
            <dl class="first done">
                <dt class="s-num">1</dt>
                <dd class="s-text">1.我的购物车<s></s><b></b></dd>
            </dl>
            <dl class="normal doing">
                <dt class="s-num">2</dt>
                <dd class="s-text">2.填写核对订单信息<s></s><b></b></dd>
            </dl>
            <dl class="normal last">
                <dt class="s-num">3</dt>
                <dd class="s-text">3.成功提交订单<s></s><b></b></dd>
            </dl>
        </div>
    </div>
    <div id="container">
        <div id="content" class="w">
            <!-- <div class="m"> -->
            <div class="checkout-tit">
                <span class="tit-txt">填写并核对订单信息</span>
            </div>
            
            <form  id="order_form">
            <div class="checkout-steps">
                <!--  /widget/consignee-step/consignee-step.tpl -->
                <div class="step-tit">
                    <h3>收货人信息</h3>
                    <div class="extra-r">
                        <a href="javascript:void(0)" class="ftx-05" onclick="openAddressModal()" >新增收货地址</a>
                        <input id="del_consignee_type" value="0" type="hidden">
                    </div>
                </div>
                <div class="step-cont">
                    <div id="consignee-addr" class="consignee-content">
                        <div class="consignee-scrollbar">
                            <div class="ui-scrollbar-main">
                                <div class="consignee-scroll">
                                    <div class="consignee-cont" id="consignee1" style="height: 50px;">
                                        <ul id="consignee-list">
                                            <li class="ui-switchable-panel ui-switchable-panel-selected" style="display: list-item;" id="consignee_index_137978497" selected="selected">
                                                <div class="consignee-item item-selected" id="address_0" onclick="changeAddress('0')">
                                                    <span >${morenAddress.name }</span><b></b>
                                                </div>
                                                <div class="addr-detail">                          
                                                    <span class="addr-name" >${morenAddress.name }</span>
                                                    <span class="addr-info" >${morenAddress.province }&nbsp; ${morenAddress.city }&nbsp; ${morenAddress.area }&nbsp;${morenAddress.details} </span>
                                                    <span class="addr-tel">${morenAddress.phonenum}</span>
                                                    <span class="addr-default">默认地址</span>
                                                </div> 
                                                <input type="hidden" name="addressID" id="addressID" value="${morenAddress.ID }">                                   
                                            </li>
                                            
                                            
                                            <c:forEach items="${otheraddresses }" var="address" varStatus="idx">
                                            <li class="ui-switchable-panel ui-switchable-panel-selected" style="display: list-item;" id="consignee_index_137978497" selected="selected">
                                                <div class="consignee-item" id="address_${idx.index+1}" onclick="changeAddress('${idx.index+1}')">
                                                    <span >${address.name }</span><b></b>
                                                </div>
                                                <div class="addr-detail">                          
                                                    <span class="addr-name" >${address.name }</span>
                                                    <span class="addr-info" >${address.province }&nbsp; ${address.city }&nbsp; ${address.area }&nbsp;${address.details} </span>
                                                    <span class="addr-tel">${address.phonenum}</span>
                                                </div> 
                                                <input type="hidden" id="addressflag_${idx.index+1}" value="${address.ID }">                                   
                                            </li>
                                            </c:forEach>
                                            
                                            
                                        </ul>
                                       
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="addr-switch switch-on" id="consigneeItemAllClick" onclick="show_ConsigneeAll()">
                        <span>更多地址</span><b></b>
                    </div>
                    
                </div>
                <div class="hr"></div>
                <div id="shipAndSkuInfo">
                    <div id="payShipAndSkuInfo">
                        <div class="step-tit">
                            <h3>支付方式</h3>
                        </div>
                        <div class="step-cont">
                            <div class="payment-list" id="">
                                <div class="list-cont">
                                    <ul id="payment-list">
                                        <li style="cursor: pointer;" onclick="save_Pay(1,0,1);">

                                            <div class="payment-item  online-payment" id="1" onclick="changeSelectClick('1')"> 
                                            	货到付款
                                                <span class="qmark-icon qmark-tip"></span> 
                                            </div>
                                        </li>
                                        <li style="cursor: pointer;" onclick="save_Pay(4,0,1);" >
                                            <div class=" payment-item  online-payment " id="2" onclick="changeSelectClick('2')">
                                            	在线支付 
                                            <span id="cod" class="qmark-icon qmark-tip" >
                                            </span> </div>
                                        </li>
                                        <input type="hidden" name="payment" id="payment" value="在线支付">
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="hr"></div>
                        <!--/ /widget/payment-step/payment-step.tpl -->
                        <div class="step-tit">
                            <h3>送货清单</h3>
                            <div class="extra-r">
                                <a href="selectBooksByUserID.do" id="cartRetureUrl" class="return-edit ftx-05">返回修改购物车</a>
                            </div>
                        </div>
                        <div class="step-cont" id="skuPayAndShipment-cont">
                            <!--添加商品清单  zhuqingjie -->
                            <div class="shopping-lists" id="shopping-lists">
                                <!--定义大商品清单LIST-->
                                <div class="shopping-list ABTest">
                                    <div class="goods-list">
                                        <div class="goods-items"> </div>
                                        <div class="goods-items 196376006">
                                            <div class="goods-suit goods-last">
                                            
                                            	<!-- 购书清单 开始  -->
                                            	<c:forEach items="${books }"  var="book" varStatus="idx">
                                                <div class="goods-item goods-item-extra">
                                                    <div class="p-img">
                                                        <a target="_blank" href="queryInfoByISBN.do?ISBN=${book.ISBN }"><img src="image/${book.imagepath}" alt=""></a>
                                                    </div>
                                                    <div class="goods-msg">
                                                        <div class="goods-msg-gel">
                                                            <div class="p-name">
                                                                <a href="queryInfoByISBN.do?ISBN=${book.ISBN }" target="_blank">
		  					                                       ${book.name}	     
		  					                                      </a>
                                                            </div>
                                                            <div class="p-price">

                                                                <strong class="jd-price">
                                                                          	￥ ${book.price}
                                                                </strong>
                                                                <span class="p-num">
				                                                         x${booksnum[idx.index]}
    				              								</span>
                                                                <span id="pre-state" class="p-state" skuid="11345721">有货</span>

                                                            </div>
                                                        </div>
                                                    </div>
                                                    <input type="hidden" name="booksnumString" value="${booksnumString }">
                                                    <input type="hidden" name="booksISBN" value="${booksISBN }">
                                                    <input type="hidden" name="cell_sum" value=" ${book.price*booksnum[idx.index] }">
                                                    <div class="clr"></div>
                                                </div>
                                                </c:forEach>
                                                
                                                <!-- 购书清单 结束  -->
                                            </div>
                                        </div>
                                    </div>
                                    <div class="dis-modes">
                                        <div class="mode-item mode-tab">
                                            <div class="mode-item-tit">
                                                <h4>配送方式</h4>

                                            </div>
                                            <div class="mode-tab-nav">
                                                <select name="express" id="" style="width: 74px;height: 28px;border: 2px  solid gray; position: relative; top: 15px; left: -6px;">
                                                    <option>申通快递</option>
                                                    <option>圆通快递</option>
                                                    <option>顺丰快递</option>
                                                </select>
                                               <!-- <ul>
                                                    <li class="mode-tab-item curr" id="jd_shipment_item" onclick="doSwithTab('pay')" clstag="pageclick|keycount|trade_201602181|11">
                                                        <span id="jdShip-span-tip" class="m-txt">京东快递<i class="qmark-icon qmark-tip" data-tips="由京东公司负责配送，速度很快，还接受上门刷卡付款服务"></i></span><b></b>
                                                    </li>                                                    
                                                </ul>-->
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clr"></div>
                                </div>
                            </div>
                            <!--shopping-lists 结束-->
                        </div>
                    </div>
                </div>
                <!--添加商品清单结束-->
                <!--添加备注信息-->
                <div class="order-remarks hide" id="orderRemarkItem" style="display: block;">
                    <div class="remark-tit">添加订单备注</div>
                    <div id="remarkId" style="margin-bottom:7px">
                        <div class="form remark-cont">
                            <input id="remarkText" maxlength="45" size="15" class="itxt itxt01" name="remark"
                            		style="height: 30px;"
                            		value=""
                            		placeholder="限45个字（定制类商品，请将购买需求在备注中做详细说明）" 
                            		onblur="if(this.value==''||this.value=='限45个字（定制类商品，请将购买需求在备注中做详细说明）'){this.value='限45个字（定制类商品，请将购买需求在备注中做详细说明）';this.style.color='#cccccc'}" 
                            		onfocus="if(this.value=='限45个字（定制类商品，请将购买需求在备注中做详细说明）') {this.value='';};this.style.color='#000000';"
                            		type="text"> <span class="ftx-03 ml10">&nbsp;&nbsp;提示：请勿填写有关支付、收货、发票方面的信息</span>
                            </div>
                    </div>
                </div>
                <div class="hr"></div>
                <!-- 发票信息 
                <div class="step-tit" id="invoice-step">
                    <h3>发票信息</h3>
                </div>
                <div class="step-content">
                    <div id="part-inv" class="invoice-cont">
                        <span class="mr10"> 普通发票（纸质） &nbsp; </span>
                        <span class="mr10"> 个人&nbsp; </span>

                    </div>
                </div>-->
                <div class="clr"></div>

                <!--<div class="hr"></div>-->
            </div>
            <div class="order-summary">
                <!--  预售 计算支付展现方式 begin -->
                <div class="statistic fr">
                    <div class="list" id="warePriceId">
                        <span><em class="ftx-01">4</em> 件商品，总商品金额：</span>
                        <em class="price">${totalPrice }</em>
                    </div>
                    <div class="list">
                        <span>(79元免运费)运费：</span>
                        <em class="price" id="freightPriceId"><i class="freight-icon"></i><font color="#000000"> ￥${cost }</font></em>
                    </div>
                    <div class="list" id="showPeriodFee" style="display:none;">
                        <span>分期手续费(由分期银行收取)：</span><em class="price" id="periodFee">￥${cost }</em>
                    </div>
                </div>
                <div class="clr"></div>
            </div>
            <div class="trade-foot">
                <div class="trade-foot-detail-com">
                    <div class="fc-price-info">
                        <span class="price-tit">应付总额：</span>
                        <span class="price-num" id="sumPayPriceId">${totalPrice+cost }</span>
                        <input type="hidden" name="totalPrice" value="${totalPrice+cost }">
                    </div>
                    <div class="fc-consignee-info" style="display:none">
                        <span class="mr20" id="sendAddr">寄送至： 吉林 长春市 朝阳区 城区  长春理工大学(南校区北门)</span>
                        <span id="sendMobile">收货人：高赛航 188****8959</span>
                    </div>
                </div>
                <div id="checkout-floatbar" class="group">
                    <div class="ui-ceilinglamp checkout-buttons">
                        <div class="sticky-wrap">
                            <div class="inner">
                                <a class="checkout-submit" id="order-submit" onclick="orderSubmitByAjax()"
                                style="text-decoration: none;">
                                    		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;提交订单
                                </a> 
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </form>
            
            
        </div>
        
    </div>
</body>
</html>
