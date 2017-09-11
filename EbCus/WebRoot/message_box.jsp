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
    
    <title>消息盒子</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="css/maylike.css">
    <link rel="stylesheet" href="css/ui_page.css">
    <link rel="stylesheet" href="css/basePath.css">
    <link rel="stylesheet" href="css/my_hb.css">
    <link rel="stylesheet" href="css/myjd_message.css">
  </head>

<body>
    <div id="container">
        <div class="w" style="width:990px;padding:10px">
            <div id="content">
                <div id="main" style="height: 600px;">
                    <div class="mod-main mod-comm message-box">
                        <form action="" id="queryMsgFrom" method="post">
                            <div class="mc">
                                <div class="mg-left" style="padding-top:0px">
                                    <div class="ui-scrollbar-wrap" style="position: relative; overflow: hidden; width: 253px; height: 600px; z-index: 0;">
                                        <div class="mg-noticelist" style="position: absolute; left: 0px; top: 0px; overflow: hidden; height: 456px;">
                                            <div class="ui-scrollbar-main">
                                                <ul>
                                                    <li onclick="queryByType(1)" class="mg-types mg-types-cur">
                                                        <span class="mg-timg actimg">
        													<s id="unsubscribe_icon_1" class="hide"></s>
        								        		</span>
                                                        <div class="mg-tcont">
                                                            <div class="mg-ttitle">
                                                                <div style="float:left;width:80px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;">
                                                                    <a href="javascript:void(0);" title="系统通知">
            										                       	 系统通知
            									                    </a>
                                                                </div>
                                                                <span class="mg-ttime"></span>
                                                            </div>
                                                            <span class="mg-illus">
            								<div style="overflow:hidden;text-overflow:ellipsis;white-space:nowrap;width:135px;float:left">
            								    <font color="grey">${total}未读消息</font>
            								        </div>
            							        </span>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="ui-scrollbar-bg" style="position: absolute; left: 247px; top: auto; width: 6px; z-index: 1; height: 340px; display: none;"></div>
                                        <div class="ui-scrollbar-item3" style="position: absolute; left: 247px; top: 0px; width: 4px; z-index: 2; display: none; height: 253px;"></div>
                                    </div>
                                </div>
                                <div class="mg-right" style="padding-bottom: 10px; height: 600px;">

                                    <div class="ui-scrollbar-wrap" style="position: relative; overflow: hidden; width: 600px; height: 600px; z-index: 0;">
                                        <div class="mg-noticeshow" style="position: absolute; left: 0px; top: 0px; overflow: hidden;">
                                            <div class="ui-scrollbar-main" style="margin-top:10px">
                                            
                                            	<c:forEach items="${messages }"  var="message">
                                                <ul id="msg-node-13883772950" class="mg-coupon">
                                                    <li>
                                                        <span class="mg-time" style="width:125px;margin-left:230px">${message.send_time }</span>
                                                        <div class="mg-box">
                                                            <div class="mg-title">
                                                                <h4 style="float: left">${message.title}</h4>
                                                                <s style="cursor:pointer" onclick="logicDeleteMessage(13883772950)"></s>
                                                            </div>
                                                            <div class="mg-content clearfix">
                                                                <div>${message.content}</div>
                                                                <a target="_blank" href="${message.urlstring }" class="mg-details">查看详情&nbsp;&gt;&nbsp;</a>
                                                            </div>
                                                        </div>
                                                    </li>
                                                </ul>
                                                </c:forEach>
                                                <br>
                                            </div>
                                        </div>
                                        <div class="ui-scrollbar-bg" style="position: absolute; left: 594px; top: auto; width: 6px; z-index: 1; height: 267px; display: none;"></div>
                                        <div class="ui-scrollbar-item3" style="position: absolute; left: 594px; top: 0px; width: 4px; z-index: 2; display: none;"></div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>
</html>
