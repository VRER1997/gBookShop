<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>新建收货地址</title>
    
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
	<link rel="stylesheet" href="css/modal_css/base.css">
    <link rel="stylesheet" href="css/modal_css/common.css">
    <link rel="stylesheet" href="css/modal_css/easebuy.css">
    <script src="js/jsAddress.js"></script>
    <script src="js/address_config.js"></script>
  	<script src="js/jquery-3.1.1.js"></script>
    <script type="text/javascript">
		function formSubmitByAjax(){
			/* if(!checkAll()){
				alert("请按照要求进行填写");
				return ;
			} */
			$.ajax({
				cache: true,
				type: "POST",
				url:"addAddress.do",
				data:$('#form_Address').serialize(),// 你的formid
				async: false,
				success: function(data) {
					//alert(data);
					if(data == "添加成功!!!"){
						window.wxc.xcConfirm(data, window.wxc.xcConfirm.typeEnum.success,
										{onOk:function(){window.close();}});
					}else{
						window.wxc.xcConfirm(data, window.wxc.xcConfirm.typeEnum.error,
										{onOk:function(){window.close();}});
					}
					
				},
				error: function(err) {
					alert(err);
				}
			});
		}
    </script>
  </head>
<body>
    <div class="m" id="edit-cont">
        <div class="mc">
            <div class="form">
            
            
            	<form  id="form_Address">
                <div class="item">
                    <span class="label"><em>*</em>收货人：</span>
                    <div class="fl">
                        <input id="consigneeName" name="consigneeName" class="text" onblur="checkConsigneeName()" type="text">
                        <span id="consigneeNameNote" class="error-msg hide" name="error-msg">请您写出收货人的姓名</span>
                    </div>
                    <div class="clr"></div>
                </div>
                <div class="item">
                    <span class="label"><em>*</em>所在地区：</span>
                    <div class="fl">
                        <select id="cmbProvince" name="cmbProvince"class="sele" onblur="loadToAreaname('1')"></select>
                        <select id="cmbCity" name="cmbCity" class="sele"
                            onblur="loadToAreaname('2')"
                        ></select>
                        <select id="cmbArea" name="cmbArea" class="sele"
                            onblur="loadToAreaname('3')"
                        ></select>
                        <script type="text/javascript">                                 
                        	addressInit('cmbProvince','cmbCity','cmbArea');
				        </script>
                        <span class="error-msg" id="areaNote"></span>
                    </div>

                    <div class="clr"></div>
                </div>
                <div class="item">
                    <span class="label"><em>*</em>详细地址：</span>
                    <div class="fl">
                        <span style="float: left;margin-right: 5px;line-height:32px;" id="areaName" ></span>
                        <input id="consigneeAddress" name="consigneeAddress"class="text text1" onblur="checkAddress()" type="text">
                    </div>
                    <span class="error-msg" id="consigneeAddressNote" style="display:none" name="error-msg">请输入您的详细地址</span>
                    <div class="clr"></div>
                </div>
                <div class="item">
                    <div class="fl">
                        <span class="label"><em>*</em>手机号码：</span>
                        <input id="consigneeMobile" name="consigneeMobile" maxlength="11" class="text" onblur="checkMobile()" type="text">
                        <span class="error-msg" id="consigneeMobileNote" style="display:none" name="error-msg">不是正确的11位手机号</span>
                    </div>
                    <div class="clr"></div>
                </div>
                <div class="item">
                </div>
                <div class="btns">
                    <a href="javascript:void(0)" onclick="formSubmitByAjax()" 
                    	class="e-btn btn-9 save-btn">保存收货地址</a>
                </div>
                </form>
                
                
            </div>            
        </div>
    </div>
    <a href="#" class="thickclose" id="">×</a>
</body>
	
</html>
