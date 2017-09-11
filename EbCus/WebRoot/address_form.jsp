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
    
    <title>收货地址</title>
    
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
	<link rel="stylesheet" href="css/myjd.easebuy.css">
    <link rel="stylesheet" href="css/t2.css">
    <link rel="stylesheet" href="css/t4.css">
    <link rel="stylesheet" href="css/foot.css">
    <script type="text/javascript">
    	function openAddressModal(){
			var obj = new Object();
			obj.a=null;
			var returnValue = window.showModalDialog("modal/Address_add.jsp",obj,"dialogHeight:400px;dialogWidth:800px");
			window.location.reload();
    	}
    </script>
  </head>
  <body>

    <div id="container">
        <div class="w">
            <div id="content">
                <input id="whereFrom" value="" type="hidden">
                <div id="main">
                    <div id="addressList" class="mod-main mod-comm">
                        <div class="mt">
                            <a onclick="openAddressModal()" class="e-btn add-btn btn-5" href="javascript:void(0);">新增收货地址</a>
                            <span class="ftx-03">您已创建<span id="addressNum_top" class="ftx-02">${addresses.size()}</span>个收货地址，最多可创建<span class="ftx-02">3</span>个</span>
                        </div>

						
						<div class="sm easebuy-m ">
                                <div class="smt">
                                    <h3>
                	                					${morenAddress.name }
					                        <a onclick="modifyAliasTips(137978497,event);" id="alias-edit-137978497" class="alias-edit" href="javascript:;"></a>
                							<span class="ftx-04 ml10">默认地址</span>
					               	</h3>
                                    <div class="extra">
                                        <a class="del-btn" href="deleteAddress.do?id=${morenAddress.ID }">删除</a>
                                    </div>
                                    <div id="alias-form-137978497" class="alias-form hide">
                                        <div class="alias-new">
                                            <input class="ipt-text" id="ipt-text-137978497" value="高赛航" onblur="checkConsigneeAlias('ipt-text-137978497')" maxlength="20" type="text">
                                            <button type="button" class="btn-save" onclick="saveAddessAlias(137978497,event)">保存</button>
                                        </div>
                                        <div class="alias-common">
                                            <div class="ac-tip">建议填写常用名称：</div>
                                            <div class="ac-con">
                                                <a href="javascript:setAddressAilas(137978497,'home-137978497');" id="home-137978497" class="item">家里</a>
                                                <a href="javascript:setAddressAilas(137978497,'parentHome-137978497');" id="parentHome-137978497" class="item">父母家</a>
                                                <a href="javascript:setAddressAilas(137978497,'company-137978497');" id="company-137978497" class="item">公司</a>
                                            </div>
                                            <span class="error-msg" id="error_ipt-text-137978497"></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="smc">
                                    <div class="items new-items">
                                        <div class="item-lcol">
                                        	<input type="hidden" id="addressID" value="${morenAddress.ID }">
                                            <div class="item">
                                                <span class="label">收货人：</span>
                                                <div class="fl">
                                                   		 ${morenAddress.name }
                                                </div>
                                                <div class="clr"></div>
                                            </div>
                                            <div class="item">
                                                <span class="label">所在地区：</span>
                                                <div class="fl">
                                                    	${morenAddress.province }${morenAddress.city }${morenAddress.area }
                                                </div>
                                                <div class="clr"></div>
                                            </div>
                                            <div class="item">
                                                <span class="label">地址：</span>
                                                <div class="fl">
                                                   	 ${morenAddress.details }
                                                </div>
                                                <div class="clr"></div>
                                            </div>
                                            <div class="item">
                                                <span class="label">手机：</span>
                                                <div class="fl">
                                                    ${morenAddress.phonenum }
                                                </div>
                                                <div class="clr"></div>
                                            </div>
                                        </div>

                                        <div class="item-rcol">
                                            <div class="extra">
                                                <a class="ml10 ftx-05" href="javascript:;" onclick="alertUpdateAddressDiag(137978497);">编辑</a>
                                            </div>
                                        </div>
                                        <div class="clr"></div>
                                    </div>
                                </div> 
                                
					 <c:forEach items="${othersAddresses }" var="address">
                        <div class="mc">
                            <div class="sm easebuy-m">
                                <div class="smt">
                                	
                                    <h3>
                	     					${address.name }
					                        <a onclick="modifyAliasTips(137928291,event);" id="alias-edit-137928291" class="alias-edit" href="javascript:;"></a>
                	                	     
                	                </h3>
                                    <div class="extra">
                                        <a class="del-btn" href="deleteAddress.do?id=${address.ID }">删除</a>
                                    </div>
                                    <div id="alias-form-137928291" class="alias-form hide">
                                        <div class="alias-new">
                                            <input class="ipt-text" id="ipt-text-137928291" value="高自的 河北" onblur="checkConsigneeAlias('ipt-text-137928291')" maxlength="20" type="text">
                                            <button type="button" class="btn-save" onclick="saveAddessAlias(137928291,event)">保存</button>
                                        </div>
                                        <div class="alias-common">
                                            <div class="ac-tip">建议填写常用名称：</div>
                                            <div class="ac-con">
                                                <a href="javascript:setAddressAilas(137928291,'home-137928291');" id="home-137928291" class="item">家里</a>
                                                <a href="javascript:setAddressAilas(137928291,'parentHome-137928291');" id="parentHome-137928291" class="item">父母家</a>
                                                <a href="javascript:setAddressAilas(137928291,'company-137928291');" id="company-137928291" class="item">公司</a>
                                            </div>
                                            <span class="error-msg" id="error_ipt-text-137928291"></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="smc">
                                    <div class="items new-items">
                                        <div class="item-lcol">
                                            <div class="item">
                                            	<input type="hidden" id="addressID" value="${address.ID }">
                                                <span class="label">收货人：</span>
                                                <div class="fl">
                                                   		 ${address.name }
                                                </div>
                                                <div class="clr"></div>
                                            </div>
                                            <div class="item">
                                                <span class="label">所在地区：</span>
                                                <div class="fl">
                                                    	${address.province }${address.city }${address.area }
                                                </div>
                                                <div class="clr"></div>
                                            </div>
                                            <div class="item">
                                                <span class="label">地址：</span>
                                                <div class="fl">
                                                    	${address.details }
                                                </div>
                                                <div class="clr"></div>
                                            </div>
                                            <div class="item">
                                                <span class="label">手机：</span>
                                                <div class="fl">
                                                    	${address.phonenum }
                                                </div>
                                                <div class="clr"></div>
                                            </div>
                                        </div>
                                        <div class="item-rcol">
                                            <div class="extra">
                                                <a class="ml10 ftx-05" href="setAsMoren.do?id=${address.ID}">设为默认</a>
                                                <a class="ml10 ftx-05" href="javascript:;" onclick="alertUpdateAddressDiag(137928291);">编辑</a>
                                            </div>
                                        </div>
                                        <div class="clr"></div>
                                    </div>
                                </div>
                            </div>
                            </c:forEach>
                            
                            
                            
                                
                            </div>
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
