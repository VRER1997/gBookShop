<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户登录页</title>
    
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
	<link rel="stylesheet" href="css/longin.css">
    <link rel="stylesheet" href="css/normalize.css">
    <script type="text/javascript">
    //通过ajax进行登录校验
    function check(){
    	var name = document.getElementById("loginname").value;
    	var pw = document.getElementById("nloginpwd").value;
    	if(name.length == 0){
    		var txt=  "用户名或手机号码不能为空";
			window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.error);
			return false;
    	}
    	if(pw.length == 0){
	    	var txt=  "密码不能为空";
			window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.error);
			return false;
    	}
    	var request = new XMLHttpRequest();//创建请求对象
			request.onreadystatechange = function(){
				//alert("1111");
				//alert(request.readyState);
				if(request.readyState==4){
					var returnValue = request.responseText;
					if(returnValue == '登录成功'){
						var option={onOk:function(){window.location.href="getMessageTo1.do?url=index.jsp";}}
						window.wxc.xcConfirm(returnValue,window.wxc.xcConfirm.typeEnum.success,option);
					}else{
						window.wxc.xcConfirm(returnValue, window.wxc.xcConfirm.typeEnum.error);
					}			
				}
			};
			//打开通道
			request.open("post", "checkNameIsExit.do?name="+name+"&pw="+pw, true);
			//设置请求的头部信息
			request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			//把参数发送到servlet
			request.send(null);
    }
    </script>
  </head>
  
  <body>
    <div class="w">
        <div id="logo">

            <b></b>
        </div>

    </div>
    <div id="content">
        <div class="login-wrap">
            <div class="w">
                <div class="login-form">

                    <div class="login-tab login-tab-r">
                        <a href="javascript:void(0)" style="outline: 0px none rgb(109, 109, 109);" class="checked">账户登录</a>
                    </div>
                    <div class="login-box" style="display: block; visibility: visible;margin-left: 28px;">
                        <div class="mt tab-h">
                        </div>
                        <div class="mc">
                            <div class="form">
                                <form id="formlogin" method="post"onsubmit="" style="margin-top: 56px;">
                                    <div class="item item-fore1">
                                        <label for="loginname" class="login-label name-label"></label>
                                        <input id="loginname" class="itxt" name="loginname" tabindex="1" autocomplete="off" placeholder="用户名/已验证手机" type="text">
                                        <span class="clear-btn"></span>
                                    </div>

                                    <div id="entry" class="item item-fore2" style="visibility: visible;">
                                        <label class="login-label pwd-label" for="nloginpwd"></label>
                                        <input id="nloginpwd" name="nloginpwd" class="itxt itxt-error" tabindex="2" autocomplete="off" placeholder="密码" type="password">
                                        <span class="clear-btn"></span>
                                    </div>
                                    <div class="item item-fore4">
                                        <div class="safe">
                                            <span>
                                                <a href="sign_up.jsp" class="">立即注册</a>
                                            </span>
                                            <span class="forget-pw-safe">
											<a href="/uc/links?tag=safe" class="" target="_blank">忘记密码</a>
										</span>
                                        </div>
                                    </div>

                                    <div class="item item-fore5">
                                        <div class="login-btn">
                                            <a href="javascript:void(0);" class="btn-img btn-entry" id="loginsubmit" onclick="check()">登&nbsp;&nbsp;&nbsp;&nbsp;录</a>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="login-banner" style="background-color: #e93854">
                <div class="w">
                    <div id="banner-bg" class="i-inner" style="background: url(pic/login_bg.png) 0px 0px no-repeat;background-color: #e93854"></div>
                
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
