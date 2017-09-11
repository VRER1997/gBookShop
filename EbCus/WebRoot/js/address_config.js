var result = 0;
function checkConsigneeName(){
    var name = document.getElementById('consigneeName').value;
    var error_msg= document.getElementById('consigneeNameNote');
    if(name.length == 0){
        error_msg.style.display='inline';
        result += 1;
    }
    error_msg.style.display='none';
    result -= 1;
}
function loadToAreaname(num){
    var id = parseInt(num);
    var province = document.getElementById('cmbProvince').value;
    var city = document.getElementById('cmbCity').value;
    var area = document.getElementById('cmbArea').value;
    if(id<2) city='';
    if(id<3) area='';
    var areaName = document.getElementById('areaName');
    areaName.innerText=province+city+area;
}
function checkAddress(){
    
    var details=document.getElementById('consigneeAddress').value;
    var msg = document.getElementById('consigneeAddressNote');
    if(details.length == 0){
        msg.style.display='inline';
        result += 1;
        return ;
    }
    msg.style.display='none';
    result -= 1;
}
function checkMobile(){
     var sMobile = document.getElementById('consigneeMobile').value;
    var msg = document.getElementById('consigneeMobileNote');
    if(!(/^1[3|4|5|8][0-9]\d{4,8}$/.test(sMobile))){ 
        		msg.style.display='inline';
		result += 1;
        	return ;
    }
    msg.style.display='none';
    result -= 1;
}
function checkAll(){
	alert(123);
	if(result == 0) return true;
	else return false;
}