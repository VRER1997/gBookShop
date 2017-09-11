//点击input,提示语消失
function clickNo(){  document.getElementById("txts").style.display='none';
}
//input为空时，提示语出现
function clickYes(){                document.getElementById("txts").style.display='inline';                    
}
function clickName(){
    clickNo();
    document.getElementById("name_meg").innerHTML = "<i class=&quot;i-def&quot;></i >支持中文、字母、数字、“-”“_”的组合，4-20个字符";
}
// 校验用户名
function checkName(){
    var name = document.getElementById("form-account").value;
    //alert(123);
    var meg = document.getElementById("name_meg");
    var divv = document.getElementById("form-item-account");
    if(name.length == 0){
        clickYes();
        meg.innerHTML = "";
        return false;
    }
    if(name.length < 4 || name.length > 20){
        meg.innerHTML = "<i class=&quot;i-def&quot;></i >用户名必须在4-20字符之间";
        meg.style.color='#e22';
        divv.style.border='solid 1px #e22';
        return false;
    }
    //alert(111);
    meg.innerHTML = '';
    divv.style.border='';
    //唯一性校验
    $.ajax({
	        url:"isExit.do",
	        data:{name:name},//给服务器的参数  
	        type:"POST",
	        async:false,//是否异步请求，如果是异步，那么不会等服务器返回，我们这个函数就向下运行了。  
	        cache:false,  
	        success:function(result){
		//alert(result);
	            if(result == 'no'){//如果校验失败 
					//alert("校验失败");
	                meg.innerHTML = "<i class=&quot;i-def&quot;></i >用户名已被注册！";
	                meg.style.color='#e22';
	                divv.style.border='solid 1px #e22';
	                			return  false; 
		}else{
			meg.innerHTML = '';
		    divv.style.border='';
			return true;
		}
		}}
	 );
    
}


//密码部分事件

//点击input,提示语消失
function clickPwNo(){  document.getElementById("pw_txt").style.display='none';
}
//input为空时，提示语出现
function clickPwYes(){                document.getElementById("pw_txt").style.display='inline';                    
}
//密码强度检测
function checkPwHow(pw){
    var OnlyNum = new RegExp(/^\d+$/);
    var Onlychar = new RegExp(/^[@#$%^&]+$/);
    var Onlyabc = new RegExp(/^[a-zA-Z]+$/);
    
    if(OnlyNum.test(pw)) return true;
    if(Onlychar.test(pw)) return true;
    if(Onlyabc.test(pw)) return true;
    return false;
}
function clickPw(){
    clickPwNo();
    document.getElementById("pw_meg").innerHTML = "<i class=&quot;i-def&quot;></i >建议使用字母、数字和符号两种及以上的组合，6-20个字符";
}

//校验密码
function checkPw(){
    
    var pw = document.getElementById('form-pwd').value;
    //alert(pw);
    var meg = document.getElementById("pw_meg");
    var divv = document.getElementById("form-item-pw");
    var ret = checkPwHow(pw);
    //alert(ret);
    if(pw.length == 0){
        clickPwYes();
        meg.innerHTML = "";
        return false;
    }
    if(pw.length < 6 || pw.length > 20){
        meg.innerHTML='<i class=&quot;i-def&quot;></i >请保证密码在6-20个字符之间';
        meg.style.color='#e22';
        divv.style.border='solid 1px #e22';
        return false;
        
    }
    if(ret){
        meg.innerHTML='<i class=&quot;i-def&quot;></i >有被盗风险,建议使用字母、数字和符号两种及以上组合';
        meg.style.color='#e22';
        divv.style.border='solid 1px #e22';
        return false;
    }
    
    meg.innerHTML = '';
    divv.style.border='';
    return true;
}

//确认密码事件


//点击input,提示语消失
function clickPwcNo(){  document.getElementById("pwc_txt").style.display='none';
}
//input为空时，提示语出现
function clickPwcYes(){                document.getElementById("pwc_txt").style.display='inline';                    
}
function clickPwc(){
    clickPwcNo();
    document.getElementById("pwc_meg").innerHTML = "<i class=&quot;i-def&quot;></i>请再次输入密码";
}
function checkPhone(){
    var pw = document.getElementById('form-pwd').value;
    var pwc = document.getElementById('form-equalTopwd').value;
    var meg = document.getElementById("pwc_meg");
    var divv = document.getElementById("form-item-pwc");
    //alert(pw+' '+pwc);
    if(pwc.length == 0){
        clickPwcYes();
        meg.innerHTML = "";
        return false;
    }
    if(pw != pwc){
        meg.innerHTML='<i class=&quot;i-def&quot;></i >两次输入的密码不相同';
        meg.style.color='#e22';
        divv.style.border='solid 1px #e22';
        return false;
    }
    meg.innerHTML = '';
    divv.style.border='';
    return true;
}

//手机校验事件


//点击input,提示语消失
function clickPhoneNo(){  document.getElementById("phone_txt").style.display='none';
}
//input为空时，提示语出现
function clickPhoneYes(){                document.getElementById("phone_txt").style.display='inline';                    
}
//点击事件
function clickPhone(){
    clickPhoneNo();
    document.getElementById("phone_meg").innerHTML = "<i class=&quot;i-def&quot;></i>完成验证后，可以用来手机登录和找回密码";
}
//手机号码验证
function checkPhone(){
    
    //验证规则
    var reg = /^1[3|4|5|7|8][0-9]{9}$/; 
    
    var meg = document.getElementById("phone_meg");
    var divv = document.getElementById("form-item-phone");
    var phoneNum = document.getElementById("form-phone").value;
    var flag = reg.test(phoneNum);
    //alert(flag);
    if(phoneNum.length == 0){
        clickPhoneYes();
        meg.innerHTML = "";
        return false;
    }
    if(!flag){
        meg.innerHTML='<i class=&quot;i-def&quot;></i >格式有误';
        meg.style.color='#e22';
        divv.style.border='solid 1px #e22';
        return false;
    }
    meg.innerHTML = '';
    divv.style.border='';
    return true;
}

//手机验证码事件


//点击input,提示语消失
function clickPhoneConfigNo(){  document.getElementById("phc_txt").style.display='none';
}
//input为空时，提示语出现
function clickPhoneConfigYes(){                document.getElementById("phc_txt").style.display='inline';                    
}
//点击事件
function clickPhoneConfig(){
    clickPhoneConfigNo();
}

function sendMessage(){
    alert("已发送验证短信到您的手机上");
}
function checkMessage(){
    return true;
}
function checkAll(){
	if(checkMessage() && checkPhone() && checkPhone() && checkPw()){
		return true;
	}else{
		return false;
	}
	
}