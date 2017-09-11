<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>基本信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="css/myjd.info.css">
    <link rel="stylesheet" href="css/t3.css">
    <link rel="stylesheet" href="css/t4.css">
    <link rel="stylesheet" type="text/css" href="css/xcConfirm.css"/>
 	<script src="js/info_config.js"></script>
   	<script src="js/jquery-3.1.1.js"></script>
	<script src="js/jquery-1.9.1.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/xcConfirm.js" type="text/javascript" charset="utf-8"></script>
	<style type="text/css">
			.sgBtn{width: 135px; height: 35px; line-height: 35px; margin-left: 10px; margin-top: 10px; text-align: center; background-color: #0095D9; color: #FFFFFF; float: left; border-radius: 5px;}
	</style>
   	 <script type="text/javascript">
   	 	//获取性别
   	 	function getSex(msg){
   	 		var sex = document.getElementById("sexUser");
   	 		sex.value = msg;
   	 	}
   	 	function submitByAjax(){	 	
   	 		//alert(123);
   	 		var sex = document.getElementById("sexUser").value;
   	 		//alert(sex);
   	 		if(sex.length == 0){
   	 			alert(123);
   	 			var txt=  "请先选择性别";
				window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.error);
				return ;
   	 		}
   	 		var realname = document.getElementById("realName").value;
   	 		if(realname.length == 0){
   	 			var txt=  "请先填写真实姓名";
				window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.error);
				return ;
   	 		}
   	 		$.ajax({
				type: "POST",
				url:"updateUser.do",
				data:$('#info_form').serialize(),//序列化
				async: false,
				success: function(data) {
					//alert(data.d);
					if(data=="保存成功"){
						window.wxc.xcConfirm(data, window.wxc.xcConfirm.typeEnum.success);
					}else{
						window.wxc.xcConfirm(data, window.wxc.xcConfirm.typeEnum.error);
					}
					//window.close();
				},
				error: function(err) {
					alert(err);
				}
			});
   	 	}
   	 </script>
  </head>
  
  <body >
    <!--container start-->
    <div id="container">
        <div class="w">
            <div id="content">
                <div id="main">
                    <form id="info_form">
                    
                    <div class="mod-main">
                        <div class="mt">
                            <ul class="extra-l">
                                <li class="fore-1"><a class="curr" href="//i.jd.com/user/info">基本信息</a></li>
                            </ul>
                        </div>
                        <div class="mc">
                            <div class="user-set userset-lcol">
                                <div class="form">
                                    <div class="item">
                                        <span class="label">用户名：</span>
                                        <div class="fl">
                                            <div><strong>${user.username}</strong></div>
                                        </div>
                                    </div>
                                    <!--
                                    <div class="item">
                                        <span class="label"><em>*</em>登录名：</span>
                                        <div class="fl" id="aliasBefore">
                                            <strong>myprague123</strong>
                                            <a href="javascript:void(0)" class="ftx-05 ml10" onclick="changeAliasName()" clstag="pageclick|keycount|201602251|1">修改</a>
                                            <span class="ftx03">可用于登录，请牢记哦~</span>
                                            <div class="clr"></div>
                                            <div class="prompt-06"><span id="aliasNameBefore_msg"></span></div>
                                        </div>
                                        <div class="fl" id="aliasAfter" style="display: none">
                                            <input class="itxt" maxlength="20" id="aliasName" name="aliasName" value="myprague123" type="text">
                                            <input id="hiddenAliasName" value="myprague123" type="hidden">
                                            <span class="ftx03">可用于登录，请牢记哦~</span>
                                            <div class="clr"></div>
                                            <div class="prompt-06"><span id="aliasName_msg"></span></div>
                                        </div>
                                    </div>
                                    -->
                                    <div class="item">
                                        <span class="label"><em>*</em>性别：</span>
                                        <div class="fl">
                                            <input name="sex" class="jdradio" value="0" type="radio" onclick="getSex('man')">
                                            <label class="mr10">男</label>
                                            <input name="sex" class="jdradio" value="1" type="radio" onclick="getSex('woman')">
                                            <label class="mr10">女</label>
                                            <input name="sex" class="jdradio" value="2" type="radio" onclick="getSex('secret')">
                                            <label class="mr10">保密</label>
                                            <input type="hidden" id="sexUser" value="" name="sexUser">
                                        </div>
                                    </div>
                                    <div class="item">
                                        <span class="label">生日：</span>
                                        <div class="fl birthday-info">
                                            <select name="birthdayYear" class="selt selt1" id="birthdayYear" onchange="changeSelectBrithdayDay()">
                                                <option value="0" disabled="" selected="selected">请选择：</option>
                                            </select>
                                            <label class="ml5 mr5">年</label>
                                            <select name="birthdayMonth" class="selt selt1" id="birthdayMonth"                     
                                            onchange="changeSelectBrithdayDay()">
                                            </select>
                                            <label class="ml5 mr5">月</label>
                                            <select name="birthdayDay" class="selt selt1" id="birthdayDay">
                                            </select>
                                            <label class="ml5 mr5">日</label>
                                            <span class="ftx03">填生日有惊喜哦~</span>
                                        </div>
                                    </div>
                                    <div class="item" clstag="pageclick|keycount|201602251|3">
                                        <span class="label"><em>*</em>真实姓名：</span>
                                        <div class="fl">
                                            <input class="itxt" maxlength="20" name="realName" id="realName" value="${user.realname }" type="text" onblur="checkRealname()">
                                            <div class="clr"></div>
                                            <div class="prompt-06"><span id="realName_msg"></span></div>
                                        </div>
                                    </div>
                                    <div class="item">
                                        <span class="label">&nbsp;</span>
                                        <div class="fl">
                                            <input id="code" value="390808" style="display:none">
                                            <input id="rkey"  style="display:none">
                                            <a href="javascript:void(0)" class="btn-5" onclick="submitByAjax()">提交</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="clr"></div>
                        </div>
                    </div>
                    </form>
                    
                </div>
            </div>
        </div>
    </div>
    <!--container end-->
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
