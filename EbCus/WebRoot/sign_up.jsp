<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>注册</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="css/sign_up_1.css">
    <link rel="stylesheet" href="css/sign_up_2.css">
    <link rel="stylesheet" href="css/normalize.css">
    <link rel="stylesheet" type="text/css" href="css/xcConfirm.css"/>
    <script src="js/reg_config.js"></script>
    <script src="js/jquery-3.1.1.js"></script>
	<script src="js/xcConfirm.js" type="text/javascript" charset="utf-8"></script>
	<style type="text/css">
			.sgBtn{width: 135px; height: 35px; line-height: 35px; margin-left: 10px; margin-top: 10px; text-align: center; background-color: #0095D9; color: #FFFFFF; float: left; border-radius: 5px;}
	</style>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
		function submitByAjax(){
			/* alert(13);
			alert(checkMessage());
			alert(checkPhone());
			alert(checkPw());
			alert( checkPwc()); */
			//alert(1);
		    if(checkAll()){
			    	$.ajax({
					type: "POST",
					url:"addUser.do",
					data:$('#register_form').serialize(),//序列化
					async: false,
					success: function(data) {
						//alert(data);
						if(data == "yes"){
							//var option={onOk:function(){window.close();}}
							alert("注册成功,请登录");
							//window.close();
							//window.wxc.xcConfirm(data,window.wxc.xcConfirm.typeEnum.success);
						}else{
							alert("网络异常");
							//window.close();
							//window.wxc.xcConfirm("网络异常，请稍后重试", window.wxc.xcConfirm.typeEnum.error);
						}
						
					},
					error: function(err) {
						alert(err);
					}
				});
			}
		    else{
		        alert("请按照要求进行填写");
		        return false;
		    }
		}
	</script>
  </head>
  
 <body>
    <div id="form-header" class="header">
        <div class="logo-con w clearfix">
            <div class="logo-title">欢迎注册</div>
            <div class="have-account">已有账号？ <a href="login.jsp">请登录</a></div>
        </div>

    </div>
    <div class="container w">
        <div class="main clearfix" id="form-main">
            <div class="reg-form fl">
                <form id="register_form">
                    <div class="form-item form-item-account" id="form-item-account">
                        <label>用　户　名</label>
                        <txt onclick="clickName()" style="position: absolute; z-index: 2; line-height: 46px; margin-left: 20px; margin-top: 1px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;,&quot;Hiragino Sans GB&quot;; color: rgb(204, 204, 204); display: inline;" id="txts">您的账户名和登录名 </txt>
                        <input id="form-account" name="regName" class="field" autocomplete="off"
                        onclick="clickName()"
                        onblur="checkName()" maxlength="20" placeholder=" " default="<i class=&quot;i-def&quot;></i>支持中文、字母、数字、“-”“_”的组合，4-20个字符" type="text">
                        <i class="i-status"></i>
                    </div>
                    <div class="input-tip">
                        <span id="name_meg"></span>
                    </div>
                    <div class="form-item" style="z-index: 12;" id="form-item-pw">
                        <label>设 置 密 码</label>

                        <txt onclick="clickPw()" style="position: absolute; z-index: 2; line-height: 46px; margin-left: 20px; margin-top: 1px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;,&quot;Hiragino Sans GB&quot;; color: rgb(204, 204, 204); display: inline;" id = "pw_txt">建议至少使用两种字符组合</txt>
                        <input name="pwd" id="form-pwd" class="field"
                        onclick="clickPw()"
                        onblur="checkPw()" maxlength="20" placeholder=" "  default="<i class=i-def></i>建议使用字母、数字和符号两种及以上的组合，6-20个字符" type="password">
                        <i class="i-status"></i>
                        <div class="capslock-tip tips" style="display: none;">大写已开启<b class="arrow"></b><b class="arrow-inner"></b></div>
                        <div class="capslock-tip tips" style="display: none;">大写已开启<b class="arrow"></b><b class="arrow-inner"></b></div>
                    </div>
                    <div class="input-tip">
                        <span id="pw_meg"></span>
                    </div>
                    <div class="form-item" id="form-item-pwc" style="z-index: 12;">
                        <label>确 认 密 码</label>

                        <txt onclick="clickPwc()" style="position: absolute; z-index: 2; line-height: 46px; margin-left: 20px; margin-top: 1px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;,&quot;Hiragino Sans GB&quot;; color: rgb(204, 204, 204); display: online;" id="pwc_txt">请再次输入密码</txt>
                        <input name="pwdRepeat" id="form-equalTopwd"
                        onclick="clickPwc()"
                        onblur="checkPwc()" class="field" placeholder=" " maxlength="20" default="<i class=&quot;i-def&quot;></i>请再次输入密码" type="password">
                        <i class="i-status"></i>
                        <div class="capslock-tip tips" style="display: none;">大写已开启<b class="arrow"></b><b class="arrow-inner"></b></div>
                        <div class="capslock-tip tips" style="display: none;">大写已开启<b class="arrow"></b><b class="arrow-inner"></b></div>
                    </div>
                    <div class="input-tip">
                        <span id="pwc_meg"></span>
                    </div>
                    <div class="item-phone-wrap">
                        <div class="form-item form-item-phone" id="form-item-phone">
                            <label class="select-country" id="select-country" country_id="0086">中国 0086
                                <a href="javascript:void(0) " tabindex="-1" class="arrow"></a>
                            </label>
                            <txt onclick="clickPhone()"style="position: absolute; z-index: 2; line-height: 46px; margin-left: 7px; margin-top: 1px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;,&quot;Hiragino Sans GB&quot;; color: rgb(204, 204, 204); display: inline;" id="phone_txt">建议使用常用手机</txt>
                            <input id="form-phone" name="phone" class="field"
                            onclick="clickPhone()"
                            onblur="checkPhone()" placeholder=" " autocomplete="off" maxlength="11" default="<i class=&quot;i-def&quot;></i>完成验证后，你可以用该手机登录和找回密码" aria-required="true" aria-invalid="true" aria-describedby="form-phone-error" type="text">
                            <i class="i-status"></i>
                        </div>
                        <div class="input-tip"><span id="phone_meg" ></span></div>
                    </div>


                    <div class="form-item form-item-phonecode">
                        <label>手机验证码</label>
                        <txt onclick="clickPhoneConfig()" style="position: absolute; z-index: 2; line-height: 46px; margin-left: 20px; margin-top: 1px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;,&quot;Hiragino Sans GB&quot;; color: rgb(204, 204, 204); display: inline;" id="phc_txt">请输入手机验证码</txt>
                        <input name="mobileCode" maxlength="6"
                        onclick="clickPhoneConfig()" id="phoneCode" class="field phonecode" placeholder=" " autocomplete="off" type="text">
                        <button id="getPhoneCode" class="btn-phonecode" type="button" onclick="sendMessage()">获取验证码</button>
                        <i class="i-status"></i>
                    </div>
                    <div class="input-tip">
                        <span id="phc_meg"></span>
                    </div>
                    <div class="form-agreen">
                        <div>
                            <input name="agreen" checked="" type="checkbox">阅读并同意<a href="javascript:;" id="protocol">《用户注册协议》</a>
                            <a href="javascript:;" class="blue" id="privacyProtocolTrigger">《隐私政策》</a>
                        </div>
                        <div class="input-tip">
                            <span></span>
                        </div>
                    </div>
                    <div>
                        <button class="btn-register" onclick="submitByAjax()">立即注册</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
