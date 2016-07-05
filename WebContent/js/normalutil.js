//银行账号格式化
function formatAccount(account,len,split){
	if(account==null||account.length==0){
		return "";
	}
	if(len==null){
		len = 4;
	}
	if(split==null){
		split = " ";
	}
	var result = "";
	var a = 1;
	for (var i = 0; i <account.length; i++) {
		result+=account.charAt(i);
		if (i+1==len*a) {
			result+=split;
			a++;
		}
	}
	return result;
}


//去除字符串中相同的项
function removerepeat(ids,names){
   var values = new Array();
   var idsarray = ids.substring(0,ids.length-1).split(",");
   var namesarray = null;
   if(names!=null&&names.length>0){
   		namesarray = names.substring(0,names.length-1).split(",");
   }
   var retid = new　Array();
   var retname = new　Array();
   var tempid="";
   var tempname ="";
   for(var i=0;i<idsarray.length;i++){
		if(checkItem(retid,idsarray[i])　==　-1){
		   retid.push(idsarray[i]);
		   if(namesarray!=null){
		   		retname.push(namesarray[i]);
		   }
		}
   }
   
   for(var i=0;i<retid.length;i++){
      tempid+=retid[i]+",";
      values[0] = tempid;
   }
   if(namesarray!=null){
	   for(var i=0;i<retname.length;i++){
	      tempname+=retname[i]+",";
	      values[1] = tempname;
	   }
   }
   return values;
}

//去除字符串中相同的项
function removerepeatIds(ids){
   var idsarray = ids.substring(0,ids.length-1).split(",");
   var retid = new　Array();
   var tempid="";

   for(var i=0;i<idsarray.length;i++){
		if(checkItem(retid,idsarray[i])　==　-1){
		   retid.push(idsarray[i]);
		}
   }
   
   for(var i=0;i<retid.length;i++){
      tempid+=retid[i]+";";
   }
   return tempid;
}

//临时的赋值、取值
var tempUrlParameter ={
	setTmpvalue:function(val){
		var obj = window.top.document.getElementById("tempUrlParameter");
		if(obj!=null){
			obj.value = val;
			return;
		}else{
			var input = window.top.document.createElement("input");
			input.setAttribute("type","hidden");
			input.setAttribute("id","tempUrlParameter");
			input.setAttribute("value",val);
			window.top.document.body.appendChild(input);
		}
	},
	getTmpvalue:function(){
		var obj = window.top.document.getElementById("tempUrlParameter");
		if(isNotBlank(obj)){
			var val = obj.value;
			return val;
		}else{
			return null;
		}
	}
};

//
function checkItem(receiveArray,　checkItem){
  var　index　=　-1;　　//　函数返回值用于布尔判断
　　for　(var　i=0;　i<receiveArray.length;　i++){
	　　if　(receiveArray[i]==checkItem){
	　　		index　=　i;
	　　		break;
	　　}
　　}
　　return　index;
}

//通过传入的id，去除该id和对应的名字
function removeItemFromIds(empid,ids,names){
   var values = new Array();
   var idsarray = ids.substring(0,ids.length-1).split(",");
   var namesarray = null;
   if(names!=null&&names.length>0){
   		namesarray = names.substring(0,names.length-1).split(",");
   }
   var retid = new　Array();
   var retname = new　Array();
   var tempid="";
   var tempname ="";
   for(var i=0;i<idsarray.length;i++){
		if(empid != idsarray[i]){
		   retid.push(idsarray[i]);
		   if(namesarray!=null){
		   	retname.push(namesarray[i]);
		   }
		}
   }
   
   for(var i=0;i<retid.length;i++){
      tempid+=retid[i]+",";
      values[0] = tempid;
   }
   if(namesarray!=null){
	   for(var i=0;i<retname.length;i++){
	      tempname+=retname[i]+",";
	      values[1] = tempname;
	   }
   }
   return values;

}


function changebg(obj,borcolor,bgcolor,wd){
	if(wd == 0){
		obj.style.border = "0px";
		obj.style.backgroundColor = "";
		return;
	}
	if(wd==null){
		wd =1;
	}
	obj.style.border =wd+"px solid "+borcolor;
	obj.style.backgroundColor = bgcolor;
}

var dateoldbgcolor = "";
var dateoldcolor = "";
function changDateColorOver(obj,bgcolor,fontcolor){
	dateoldbgcolor = obj.style.backgroundColor;
	dateoldcolor = obj.style.color;
	
	obj.style.backgroundColor = bgcolor;
	obj.style.color = fontcolor;
}

function changDateColorOut(obj){
	obj.style.backgroundColor = dateoldbgcolor;
	obj.style.color = dateoldcolor;
}

//验证码
function changecode(obj){
	if(obj != null)
		obj.src = Sys.getProjectPath()+"/validcode.do?t="+Math.random();
}

function getById(id){
	return document.getElementById(id);
}

// 删除左右两端的空格
function trim(str){   
	return str.replace(/(^\s*)|(\s*$)/g, "");
}

// 删除左边的空格
function ltrim(str){   
	return str.replace(/(^\s*)/g,"");   
}

// 删除右边的空格
function rtrim(str){   
	return str.replace(/(\s*$)/g,"");   
}

//验证text radio select checkbox 是否为空
function validvalue(requtid){
	var lb =document.getElementById(requtid);
	var ips = document.getElementsByTagName("input");
	var sels = document.getElementsByTagName("select");
	var tas = document.getElementsByTagName("textarea");
	for(var b=0;b<sels.length;b++){
		if(sels[b].options.length==0){
			var warn = "注意：请确保下拉列表已经初始化!";
			alert(warn);
			lb.innerHTML = "<font color=\"#19437E\">"+warn+"</font>";
			sels[b].focus();
			return false;
		}
	}
	
	//input
	for(var c=0;c<ips.length;c++){
		var cln = ips[c].className;
		if(cln=="numform" || cln == "rmbform"){
			var vl = ips[c].value;
			if(vl!=null&&trim(vl).length>0){
				if(!isDigit(vl)){
					var warn = "注意：数字框只能输入数字!";
					alert(warn);
					lb.innerHTML = "<font color=\"#19437E\">"+warn+"</font>";
					ips[c].focus();
					return false;
				}
			}
		}
	}
	
	for(var a=0;a<ips.length;a++){
		var type = ips[a].type;
		var ms = ips[a].getAttribute("must");
		var msTitle = ips[a].getAttribute("formust");
		if(msTitle != null && msTitle!="" && trim(msTitle).length>0){
			lb = document.getElementById(msTitle);
		}
		if(ms!=null&&ms.length>0){
			if(type=="text" || type == "password"){
				var vl = ips[a].value;
				if(vl==""||trim(vl).length==0){
					lb.innerHTML = "<img src=\""+Sys.getProjectPath()+"/images/grid_images/rowdel.png\">&nbsp;<font color=\"red\">" + ms + "</font>";
					ips[a].focus();
				
					return false;
				}else{
					lb.innerHTML="";
				}
			}
			if(type=="radio"){
				var rn = ips[a].name;
				if(getRadioValueByName(rn)==null){
					lb.innerHTML = ms;
					ips[a].focus();
				
					return false;
				}else{
					lb.innerHTML="";
				}
			}
			if(type=="checkbox"){
				var rn = ips[a].name;
				if(getCheckedCount(rn)==0){
					lb.innerHTML = ms;
					ips[a].focus();
				
					return false;
				}else{
					lb.innerHTML="";
				}
			}
		}
	}
	
	//select
	for(var b=0;b<sels.length;b++){
		var ms = sels[b].getAttribute("must");
		var msTitle = sels[b].getAttribute("formust");
		if(msTitle != null && msTitle!="" && trim(msTitle).length>0){
			lb = document.getElementById(msTitle);
		}
		if(ms!=null&&ms.length>0){
			if(sels[b].value == null||sels[b].value==-1){
				lb.innerHTML = ms;
				sels[b].focus();
			
				return false;
			}else{
				lb.innerHTML="";
			}
		}
	}
	
	//textarea
	for(var a=0;a<tas.length;a++){
		var ms = tas[a].getAttribute("must");
		var msTitle = tas[a].getAttribute("formust");
		if(msTitle != null && msTitle!="" && trim(msTitle).length>0){
			lb = document.getElementById(msTitle);
		}
		if(ms!=null&&ms.length>0){
			var vl = tas[a].value;
			if(vl==""||trim(vl).length==0){
				lb.innerHTML = "<img src=\""+Sys.getProjectPath()+"/images/grid_images/rowdel.png\">&nbsp;<font color=\"red\">" + ms + "</font>";
				tas[a].focus();
			
				return false;
			}else{
				lb.innerHTML="";
			}
		}
	}
	
	return true;
}

//设置提示
function setMustWarn(id,mustTitle){
	document.getElementById(id).innerHTML = "<img src=\""+Sys.getProjectPath()+"/images/grid_images/rowdel.png\">&nbsp;<font color=\"red\">"+mustTitle+"</font>";
}

function setMustWarnByObj(obj,mustTitle){
	obj.innerHTML = "<img src=\""+Sys.getProjectPath()+"/images/grid_images/rowdel.png\">&nbsp;<font color=\"red\">"+mustTitle+"</font>";
}

//可选项提示初始化
function warnInit(chooseArr){
	for(var i = 0 ;i < chooseArr.length;i++){
		document.getElementById(chooseArr[i]).innerHTML = "";
	}
}

//可选项提示
function chooseWarn(chooseArr){
	for(var i = 0 ;i < chooseArr.length;i++){
		document.getElementById(chooseArr[i]).innerHTML = "<img src='"+Sys.getProjectPath()+"/images/fileclear.png' width='13px'>&nbsp;阅读范围部门和人员至少要有一项。";
	}
}

//获得路径 例如：http://localhost:8888/EAZY_BAMS/erp
function getContextPath(){
	var path = self.location+"";
	var psp =path.split("/"); 
	var contextPath = psp[0]+"/"+psp[1]+"/"+psp[2]+"/"+psp[3]+"/"+psp[4];
	return contextPath;
}

//获得当前年月日 2014-07-08
function getCurrentDate(){
	var now = new Date();
	var year = now.getFullYear();
	var month = now.getMonth() + 1;
	var date = now.getDate();
	var timeValue = "";
	timeValue += year + "-";
	timeValue += ((month < 10) ? "0" : "") + month + "-";
	timeValue += ((date < 10) ? "0" : "") + date;
	return timeValue;
}

//获得当前年月日 时分秒 2014-07-08 19:54:22
function getFullCurrentDate(){
	var now = new Date();
	var year = now.getFullYear();
	var month = now.getMonth() + 1;
	var date = now.getDate();
	var minutes = now.getMinutes();
	var second = now.getSeconds();
	var hour = now.getHours();
	var timeValue = "";
	timeValue += year + "-";
	timeValue += ((month < 10) ? "0" : "") + month + "-";
	timeValue += ((date < 10) ? "0" : "") + date+" ";
	timeValue += ((hour < 10) ? "0" : "") + hour+":";
	timeValue += ((minutes < 10) ? "0" : "") + minutes+":";
	timeValue += ((second < 10) ? "0" : "") + second;
	return timeValue;
}

//获得当前年月日 时分秒 毫秒 20140708195422115 共17位
function getFullDate(){
	var now = new Date();
	var year = now.getFullYear();
	var month = now.getMonth() + 1;
	var date = now.getDate();
	var hour = now.getHours();
	var minutes = now.getMinutes();
	var second = now.getSeconds();
	var mill = now.getMilliseconds();
	var timeValue = "";
	timeValue += year;
	timeValue += ((month < 10) ? "0" : "") + month;
	timeValue += ((date < 10) ? "0" : "") + date;
	timeValue += ((hour < 10) ? "0" : "") + hour;
	timeValue += ((minutes < 10) ? "0" : "") + minutes;
	timeValue += ((second < 10) ? "0" : "") + second;
	timeValue += ((mill < 10) ? "0" : "") + mill;
	return timeValue;
}

function setSelectOption(selectid,data){
	var selectObj = document.getElementById(selectid);
	if(selectObj!=null){
		selectObj.options.length=0;
	}
	var rlen = data.resultList.length;
	for ( var i = 0; i < rlen; i++) {
		var name = data.resultList[i].name;
		var pid = data.resultList[i].id;
		var option = new Option(name,pid);
		option.setAttribute("title",name);
		selectObj.options.add(option);
	}
}

function setRadioOption(radioid,data){
	var radioObj = document.getElementById(radioid);

	var rlen = data.resultList.length;
	var radioText = "";
	var radioName = radioid+"Radio";
	for ( var i = 0; i < rlen; i++) {
		var name = data.resultList[i].name;
		var pid = data.resultList[i].id;

		var radioIndex = radioName+i;
		if(pid != "-1"){
			radioText += "<input type='radio' name='"+radioName+"' id='"+radioIndex+"' value='"+pid+"'/><label for='"+radioIndex+"'>"+name+"</label>&nbsp;&nbsp;&nbsp;&nbsp;";
		}
	}
	
	radioObj.innerHTML = radioText;
}

function setList(obj,data){
	obj.options.length=0;
	var rlen = data.resultList.length;
	for ( var i = 0; i < rlen; i++) {
		var name = data.resultList[i].name;
		var pid = data.resultList[i].id;
		var optionItem=new Option(name,pid);
		obj.options.add(optionItem);
	}
}

function selectAll(obj,checkname) {
	var flag = obj.checked;
	var checks = document.getElementsByName(checkname);
	for ( var i = 0; i < checks.length; i++) {
		checks[i].checked = flag;
	}
}

function selectAllTree(flag,checkname) {
	var checks = document.getElementsByName(checkname);
	for ( var i = 0; i < checks.length; i++) {
		checks[i].checked = flag;
	}
}

function controlCheckBox(obj,checkname) {
	var checks = document.getElementsByName(checkname);
	for ( var i = 0; i < checks.length; i++) {
		checks[i].checked = obj;
	}
}

function getCheckCount(checkname){
	var count = 0;
	var Areas = document.getElementsByName(checkname);
	if(Areas!=null){
		count=Areas.length;
	}
	return count;
}

/**
 * 根据表格绑定checkbox名称得到选择数量
 * @param checkboxname
 * @return count
 * */
function getCheckedCount(checkname) {
	var count = 0;
	var Areas = document.getElementsByName(checkname);
	for ( var i = 0; i < Areas.length; i++) {
		if (Areas[i].checked == true) {
			count++;
		}
	}
	return count;
}

/**
 * 根据表格绑定checkbox名称得到选择values
 * @param checkboxname
 * @return values
 * */
function getCheckedValues(checkname){
	var val=new Array();
	var checks = document.getElementsByName(checkname);
	var a=0;
	for ( var i = 0; i < checks.length; i++) {
		if (checks[i].checked == true) {
			val[a]=checks[i].value;
			a++;
		}
	}
	return val;
}

/**
 * 根据checkbox名称得到所有values
 * @param checkboxname
 * @return values
 * */
function getCheckBoxValues(checkname){
	var val=new Array();
	var checks = document.getElementsByName(checkname);
	for ( var i = 0; i < checks.length; i++) {
		val[i]=checks[i].value;
	}
	return val;
}

//得到父窗体所有checkvalues
function getParentCheckedValues(checkname){
	var val=new Array();
	var checks = parent.document.getElementsByName(checkname);
	var a=0;
	for ( var i = 0; i < checks.length; i++) {
		if (checks[i].checked == true) {
			val[a]=checks[i].value;
			a++;
		}
	}
	return val;
}

//得到父窗体文本框值
function getParentTextValue(txtid){
	if(parent.document.getElementById(txtid)==null){
		return "no";
	}
	return parent.document.getElementById(txtid).value;
}

function getCheckedValuesByObj(obj){
	var val=new Array();
	var a=0;
	for ( var i = 0; i < obj.length; i++) {
		if (obj[i].checked == true) {
			val[a]=obj[i].value;
			a++;
		}
	}
	return val;
}

function listmove(selectfrom,selectto){
    var list1 = document.getElementById(selectfrom);
    var list2 = document.getElementById(selectto);
    var list2length = list2.length;
	var sel	= list1.selectedIndex;
	if (sel!=-1){
	     var b=0;
	     var indexarr = new Array();
	     for (var a=0;a<list1.length;a++){
	     if (list1.options[a].selected){
	             list2length = list2.length;
	             list2.options[list2length] = new Option(list1.options[a].text,list1.options[a].value);
	             indexarr[b]= a;
	             b++;
	       }
	     }
	     for (var c=0;c<b;c++){
	    	 list1.options[indexarr[c]-c] = null;
	     }
	}else{
		alert ("请选择要移动的内容！");
	}
}

function getSelectListBack(obj){
	var val=new Array();
	var a=0;
	for ( var i = 0; i < obj.options.length; i++) {
			val[a]=obj.options[i].value;
			a++;
	}
	return val;
}

//根据value设置下拉框选中值
function setSelectValue(selectid,datavalue){
	var option=document.getElementById(selectid).options;
	var index=0;
	for(var i=0;i<option.length;i++){
		if(option[i].value==datavalue){
			index=i;
		}
	}
	document.getElementById(selectid).selectedIndex = index;
}


function getCheckBox(index,name){
	var checkBoxs = document.getElementsByName(name);
	if(checkBoxs[index].checked == true){
		checkBoxs[index].checked = false;
	}else{
		checkBoxs[index].checked = true;
	}
}

//点击tr，选中checkbox
function clickCheckBox(id){
	var checkBoxs = document.getElementById(id);
	if(checkBoxs.checked == true){
		checkBoxs.checked = false;
	}else{
		checkBoxs.checked = true;
	}
}

//判断所有的select是否初始化完成，true为完成
function checkSelectInit(selectArray){
	for(var i = 0 ;i<selectArray.length;i++){
		if(document.getElementById(selectArray[i]) == null){
			return false;
		}
	}
	return true;
}

//获取radio的值
function getRadioValueByName(RadioName){
    var obj;    
    obj=document.getElementsByName(RadioName);
    if(obj!=null){
        var i;
        for(i=0;i<obj.length;i++){
            if(obj[i].checked){
                return obj[i].value;            
            }
        }
    }
    return null;
}

//set radio的值
function setRadioValueByName(RadioName,value){
    var obj;    
    obj=document.getElementsByName(RadioName);
    if(obj!=null){
        var i;
        for(i=0;i<obj.length;i++){
            if(obj[i].value == value){    
                obj[i].checked = true; 
            }else{
               obj[i].checked = false;  
            }
        }
    }
}

//获取checkbox的值
function getCheckboxValueByName(checkboxName){
	var strnums = "";
    var obj=document.getElementsByName(checkboxName);
    if(obj!=null){
        for(var i=0;i<obj.length;i++){
            if(obj[i].checked){
                strnums+=obj[i].value+",";;            
            }
        }
    }
    return strnums.substring(0,strnums.length-1);
}

//set checkbox的值
function setCheckboxValueByName(checkboxName,value){
	var values = new Array();
	if(value != null && value != ""){
		values = value.split(",");
	}
    var obj =document.getElementsByName(checkboxName);
    if(obj!=null && values.length > 0){
        for(var i=0;i<obj.length;i++){
			for(var j=0;j<values.length;j++){
			   if(obj[i].value == values[j]){
	                obj[i].checked = true; 
	            }
			}
		}
    }
}


/***
 * 格式化数据显示
 * @param 数字
 * @param 小数位数
 ***/
function FormatNumber(srcStr,nAfterDot)        //nAfterDot小数位数
{
   var srcStr,nAfterDot;
   var resultStr,nTen;
   srcStr = ""+srcStr+"";
   strLen = srcStr.length;
   dotPos = srcStr.indexOf(".",0);
   if (dotPos == -1){
     resultStr = srcStr+".";
     for (i=0;i<nAfterDot;i++){
       resultStr = resultStr+"0";
     }
     return resultStr;
   }
   else{
     if ((strLen - dotPos - 1) >= nAfterDot){
       nAfter = dotPos + nAfterDot + 1;
       nTen =1;
       for(j=0;j<nAfterDot;j++){
　        nTen = nTen*10;
       }
       resultStr = Math.round(parseFloat(srcStr)*nTen)/nTen;
       return resultStr;
     }
     else{
       resultStr = srcStr;
       for (i=0;i<(nAfterDot - strLen + dotPos + 1);i++){
　        resultStr = resultStr+"0";
       }
       return resultStr;
     }
   }
 } 
 
function fmoney(s, n){//将数字转换成逗号分隔的样式,保留两位小数s:value,n:小数位数
	if(s == null || s == undefined){
		return 0;
	}
	
	var tmp = s.toString().toLowerCase();
   	if(tmp.length>0&&tmp.indexOf('e')>0){
   		return tmp;
   	}
    s = parseFloat(s).toFixed(12);
    s = parseFloat(s);
    
    if(s<=0){
    	return s;
    }
    
    if(n>0){
    	n = n > 0 && n <= 20 ? n : 2;
    	s = parseFloat((s + "").replace(/[^\d\.-]/g, "")).toFixed(n) + "";   
    }else{
    	s = parseFloat((s + "").replace(/[^\d\.-]/g, "")).toString();   
    }
    var l = s.split(".")[0].split("").reverse();
    var len = s.split(".").length;
    var r="";
    if(len>1){
    	r = s.split(".")[1];
    }
    t = "";   
    for(i = 0; i < l.length; i ++ ){   
   		t += l[i] + ((i + 1) % 3 == 0 && (i + 1) != l.length ? "," : "");   
    }
    if(len>1){
    	return t.split("").reverse().join("") + "." + r;   
    }else{
    	return t.split("").reverse().join("");
    }
    
} 

function forPackMoney(price,point){
	return "<font color='blue'>￥"+fmoney(price,point)+"</font>";
}

function forPackMoneyColor(price,point,color){
	return "<font color='"+color+"'>￥"+fmoney(price,point)+"</font>";
}

function forPackNumberColor(num,point,color,unit){
	if(color == null){
		color = "blue";
	}
	if(unit == null){
		unit = "";
	}
	return "<font color='"+color+"'>"+fmoney(num,point)+"</font> " + unit;
}

function showQueryInfo(id,text){
	document.getElementById(id).innerHTML=text;
}

// 1.判断select选项中是否存在Value="paraValue"的Item       
function jsSelectIsExitItem(objSelect, objItemValue) {       
    var isExit = false;       
    for (var i = 0; i < objSelect.options.length; i++) {       
        if (objSelect.options[i].value == objItemValue) {       
            isExit = true;       
            break;       
        }       
    }       
    return isExit;       
}        
  
// 2.向select选项中加入一个Item       
function jsAddItemToSelect(objSelect, objItemText, objItemValue) {       
    //判断是否存在       
    if (jsSelectIsExitItem(objSelect, objItemValue)) {       
        alert("该Item的Value值已经存在");       
    } else {       
        var varItem = new Option(objItemText, objItemValue);     
        objSelect.options.add(varItem);    
        alert("成功加入");    
    }       
}       
  
// 3.从select选项中删除一个Item       
function jsRemoveItemFromSelect(objSelect, objItemValue) {       
    //判断是否存在       
    if (jsSelectIsExitItem(objSelect, objItemValue)) {       
        for (var i = 0; i < objSelect.options.length; i++) {       
            if (objSelect.options[i].value == objItemValue) {       
                objSelect.options.remove(i);       
                break;       
            }       
        }       
        alert("成功删除");       
    } else {       
        alert("该select中不存在该项");       
    }       
}   
  
  
// 4.删除select中选中的项   
function jsRemoveSelectedItemFromSelect(objSelect) {       
    var length = objSelect.options.length - 1;   
    for(var i = length; i >= 0; i--){   
        if(objSelect[i].selected == true){   
            objSelect.options[i] = null;   
        }   
    }   
}     
  
// 5.修改select选项中 value="paraValue"的text为"paraText"       
function jsUpdateItemToSelect(objSelect, objItemText, objItemValue) {       
    //判断是否存在       
    if (jsSelectIsExitItem(objSelect, objItemValue)) {       
        for (var i = 0; i < objSelect.options.length; i++) {       
            if (objSelect.options[i].value == objItemValue) {       
                objSelect.options[i].text = objItemText;       
                break;       
            }       
        }       
        alert("成功修改");       
    } else {       
        alert("该select中不存在该项");       
    }       
}       
  
// 6.设置select中text="paraText"的第一个Item为选中       
function jsSelectItemByValue(objSelect, objItemText) {           
    //判断是否存在       
    var isExit = false;       
    for (var i = 0; i < objSelect.options.length; i++) {       
        if (objSelect.options[i].text == objItemText) {       
            objSelect.options[i].selected = true;       
            isExit = true;       
            break;       
        }       
    }             
    //Show出结果       
    if (isExit) {       
        alert("成功选中");       
    } else {       
        alert("该select中不存在该项");       
    }       
}       

function loadKeycode(){
   document.onkeydown = keyListener;
}

function keyListener(){
	var keycode;
	if(window.event) {
		keycode  = window.event.keyCode;
	}
	
	//屏蔽 ctrl + W 关闭当前页面
	if((window.event.ctrlKey)&&(keycode==87)){
		window.event.returnValue=false; //表示按后不出现W字符，不然在text内会自动加上W
	}
	keyListenerCallback(keycode);
}

/**
function keyListenerCallback(keycode){
  //回车
  if(keycode == 13){
  }
  //ESC
  if(keycode == 27){
  }
  //ctrl + S
  if((window.event.ctrlKey)&&(keycode==83)){
  	window.event.returnValue=false; 
  }
  //ctrl + N
  if((window.event.ctrlKey)&&(keycode==78)){
  	window.event.returnValue=false; 
  }
  //ctrl + E
  if((window.event.ctrlKey)&&(keycode==69)){
  	window.event.returnValue=false; 
  }
  //ctrl + F
  if((window.event.ctrlKey)&&(keycode==70)){
  	window.event.returnValue=false; 
  }
  //ctrl + O
  if((window.event.ctrlKey)&&(keycode==79)){
  	window.event.returnValue=false; 
  }
}
**/

//给tr设置orderby顺序，默认为10列
var orderByArray = new Array();
for(var i=0;i<10;i++){
	orderByArray[i] = 0;
}

//清除箭头
function clearArrow(num){
	for(var i=1;i<=num;i++){
		document.getElementById("arrow"+i).innerHTML = "";
	}
}

/**
 * 用来使table的第一列具有排序功能
 * name为字段名称
 * num为当前第几个字段
 * param为隐藏表单域，用来往后台传order by的值
 * fun为点击后调用的查询方法
 * arrowNum为总共列数，用来清除其他不用的箭头
 **/
function orderByHelper(name,num,param,fun,arrowNum){	
	//清除其他箭头
	clearArrow(arrowNum);
		
	if(orderByArray[num] == 0){
		DWRUtil.setValue(param,name);
		document.getElementById("arrow"+num).innerHTML = "&nbsp;<img src='"+Sys.getProjectPath()+"/images/arrow_up.gif'/>";
		orderByArray[num] = 1;
	}else{
		DWRUtil.setValue(param,name+" desc");
		document.getElementById("arrow"+num).innerHTML = "&nbsp;<img src='"+Sys.getProjectPath()+"/images/arrow_down.gif'/>";
		orderByArray[num] = 0;
	}
	eval(fun);
}
	
// 7.设置select中value="paraValue"的Item为选中   
//document.all.objSelect.value = objItemValue;   
      
// 8.得到select的当前选中项的value   
//var currSelectValue = document.all.objSelect.value;   
      
// 9.得到select的当前选中项的text   
//var currSelectText = document.all.objSelect.options[document.all.objSelect.selectedIndex].text;   
      
// 10.得到select的当前选中项的Index   
//var currSelectIndex = document.all.objSelect.selectedIndex;   
      
// 11.清空select的项   
//document.all.objSelect.options.length = 0;  


function nocontextmenu(){
	event.cancelBubble = true;
	event.returnValue = false;
	return false;
}
 
function norightclick(e) {
	if (event.button == 2 || event.button == 3){
		event.cancelBubble = true;
		event.returnValue = false;
		return false;
	}
}

function getReportMessages(){
	var msg = "?";
	msg += "PBarLoadingText=加载图标.&";
	msg += "XMLLoadingText=正在载入数据.&";
	msg += "ParsingDataText=正在初始化数据.&";
	msg += "ChartNoDataText=没有相关数据.&";
	msg += "RenderingChartText=正在加载报表数据.&"; 
	msg += "LoadDataErrorText=数据加载错误,请重试.&";
	msg += "InvalidXMLText=数据错误,请重试.&";
	return msg;
}


//弹出会话框，用于多页面弹出操作
function modelesswin(url,wid,hei){
	if (document.all&&window.print){
		eval('window.showModelessDialog(url,window,"help:0;edge:sunken;resizable:1;dialogWidth:'+wid+'px;dialogHeight:'+hei+'px")');
	}else{
		var iTop = (window.screen.availHeight-30-hei)/2;         //获得窗口的水平位置
    	var iLeft = (window.screen.availWidth-10-wid)/2;      //获得窗口的高度位置
		eval('window.open(url,"","width='+wid+'px,height='+hei+'px,top='+iTop+',left='+iLeft+',toolbar=no, menubar=no, scrollbars=no, resizable=yes,location=no,status=no,alwaysRaised=yes,depended=yes")');
	}
}

//弹出会话框，用于多页面弹出操作，确认大小
function modelesswin(url,type){
	var wid;//子屏幕宽度
	var hei;//子屏幕高度
	
	if(type == 1){
		//小屏
		wid = screen.width * 0.5;
		hei = screen.height * 0.4;	
	}else if(type == 1){
		//中屏
		wid = screen.width * 0.6;	
		hei = screen.height * 0.5;	
	}else{
		//大屏
		wid = screen.width * 0.7;	
		hei = screen.height * 0.6;	
	}
	
	if (document.all&&window.print){
		eval('window.showModelessDialog(url,window,"help:0;edge:sunken;resizable:1;dialogWidth:'+wid+'px;dialogHeight:'+hei+'px")');
	}else{
		var iTop = (window.screen.availHeight-30-hei)/2;         //获得窗口的水平位置
    	var iLeft = (window.screen.availWidth-10-wid)/2;      //获得窗口的高度位置
		eval('window.open(url,"","width='+wid+'px,height='+hei+'px,top='+iTop+',left='+iLeft+',toolbar=no, menubar=no, scrollbars=no, resizable=yes,location=no,status=no,alwaysRaised=yes,depended=yes")');
	}
}

//显示、隐藏明细
function showSliderDetail(obj,divid){
	if(document.getElementById(divid).style.display == "" || document.getElementById(divid).style.display == "block"){
		$("#"+divid).animate({height: 'hide',   opacity: 'hide'  }, 'slow');
		obj.src = Sys.getProjectPath()+"/images/scroll_down.gif";
	}else{
		$("#"+divid).animate({height: 'show',opacity: 'show'  }, 'slow');
		obj.src = Sys.getProjectPath()+"/images/scroll_up.gif";
	}
}

//获得tab页id
function getMDITab(){
	return window.top.getNowWindow()
}

//刷新tab页
function refreshMDITab(id,frame,tree){
	if(isNotBlank(id)){
		var frm = window.top.getMDIFrame(id);
		
		if(isNotBlank(frm)){
			if(isBlank(frm.location)) 
				frm = frm.contentWindow;//兼容IE CHROME FIREFOX，返回window对象
			
			if(isNotBlank(frame)){
				frm.document.getElementById(frame).contentWindow.queryData()
			}else{
		    	frm.queryData();//调用原页面查询方法
			}
			
			if(isNotBlank(tree)){
				frm.tree.reload();//刷新树
			}
		}
	}
}

//关闭tab页
function closeMDITab(id,frame,tree){
	refreshMDITab(id,frame,tree);//关闭前刷新
	window.top.MDIClose();
}


//打开tab页
function openMDITab(url){
	window.top.MDIOpen(url);//调用tab插件方法
}

//提供比较精确的js四则运算
//说明：javascript的四则运算结果会有误差，在两个浮点数四则运算的时候会比较明显。
//以下函数返回较为精确的运算结果。

//加法
function accAdd(arg1,arg2){
	var r1,r2,m;
	try{r1=arg1.toString().split(".")[1].length}catch(e){r1=0}
	try{r2=arg2.toString().split(".")[1].length}catch(e){r2=0}
	m=Math.pow(10,Math.max(r1,r2));
	return (arg1*m+arg2*m)/m;
}
//减法
function Subtr(arg1,arg2){
     var r1,r2,m,n;
     try{r1=arg1.toString().split(".")[1].length}catch(e){r1=0}
     try{r2=arg2.toString().split(".")[1].length}catch(e){r2=0}
     m=Math.pow(10,Math.max(r1,r2));
     n=(r1>=r2)?r1:r2; //动态控制精度长度
     return ((arg1*m-arg2*m)/m).toFixed(n);
}
//乘法
function accMul(arg1,arg2){
	var m=0,s1=arg1.toString(),s2=arg2.toString();
	try{m+=s1.split(".")[1].length}catch(e){}
	try{m+=s2.split(".")[1].length}catch(e){}
	return Number(s1.replace(".",""))*Number(s2.replace(".",""))/Math.pow(10,m);
}
//除法(arg1除以arg2的精确结果)
function accDiv(arg1,arg2){
	var t1=0,t2=0,r1,r2;
	try{t1=arg1.toString().split(".")[1].length}catch(e){}
	try{t2=arg2.toString().split(".")[1].length}catch(e){}
	with(Math){
		r1=Number(arg1.toString().replace(".",""));
		r2=Number(arg2.toString().replace(".",""));
		return (r1/r2)*pow(10,t2-t1); 
	}
}

//检查输入的Email信箱格式是否正确 
function isEmail(strEmail) {
    var regu = /^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$/;
    return regu.test(strEmail)
};

//判断是否为数字  可以为负数 小数
function isDigit(str){
	var regu = /^-?[0-9]+.?[0-9]*$/;
	return regu.test(str);
}

//判断是否为整数
function isInteger(str){
    var regu = /^[-]{0,1}[0-9]{1,}$/;
    return regu.test(str);
};

//判断是否为正整数  可以为0
function isNumberZero(str){
    var regu = /^[0-9]+$/;
    return regu.test(str);
};

//判断是否为正整数 不能为0
function isNumber(str){
	var regu = /^[1-9]+[0-9]*]*$/;
	return regu.test(str);
}

//判断是否中文 true表示有汉字
function isChinese(str){ 
	var ret = false; 
	for(var i=0;i<str.length;i++) {
		if(str.charCodeAt(i)>=10000){
			ret = true;
		}
	} 
	return ret; 
}

//js对象、值 不为空
function isNotBlank(obj){
	if(obj != null && obj != "" && obj != "undefined" && obj != undefined)
		return true;
	else
		return false;
}

//js对象、值 为空
function isBlank(obj){
	if(obj == null || obj == "" || obj == "undefined" || obj == undefined)
		return true;
	else
		return false;
}

//是否为office文件
function isOffice(attachName){
	var typeArray = new Array(".docx",".doc",".xlsx",".xls");
	for(var i=0;i<typeArray.length;i++){
		if(attachName.indexOf(typeArray[i]) > 0){
			return true;
			break;
		}
	}
	return false;
}

//是否为图片文件
function isImg(attachName){
	var typeArray = new Array(".jpg",".gif",".png",".bmp");
	for(var i=0;i<typeArray.length;i++){
		if(attachName.indexOf(typeArray[i]) > 0){
			return true;
			break;
		}
	}
	return false;
}

function isTxt(attachName){
	var typeArray = new Array(".txt",".sql",".js",".css",".java");
	for(var i=0;i<typeArray.length;i++){
		if(attachName.indexOf(typeArray[i]) > 0){
			return true;
			break;
		}
	}
	return false;
}

//右上角出现加载状态
function useLoadingMassage(par, massage) {
	var loadingmsg;
	var pt;
	if (isBlank(massage)) {
		loadingmsg = "数据处理中,请稍候...";
	}

	if (isBlank(par)) {
		pt = window.top;
	}

	dwr.engine.setPreHook(function() {
		var disabledZone = pt.document.getElementById("disabledZone");
		var imageZone = pt.document.getElementById("imageZone");
		if (!disabledZone) {

			disabledZone = pt.document.createElement('div');
			disabledZone.setAttribute('id', 'disabledZone');
			disabledZone.style.position = "absolute";
			disabledZone.style.left = "0px";
			disabledZone.style.top = "0px";
			disabledZone.style.zIndex = "100";
			disabledZone.style.width = "100%";
			disabledZone.style.height = "100%";
			disabledZone.style.background = "#ffffff";
			disabledZone.style.opacity = 0.1; //FF阴影层透明度
			disabledZone.style.filter = "alpha(opacity=10)"; //IE阴影层透明度
			pt.document.body.appendChild(disabledZone);

			imageZone = pt.document.createElement('div');
			imageZone.setAttribute('id', 'imageZone');
			imageZone.style.position = "absolute";
			imageZone.style.fontFamily = "宋体";
			imageZone.style.zIndex = "999";
			imageZone.style.top = "100px";
			imageZone.style.right = "50px";
			imageZone.style.color = 'red';
			imageZone.style.border = '1px solid #dddddd';
			imageZone.style.backgroundColor = '#ffffbe';
			imageZone.style.padding = "3px";
			imageZone.style.paddingLeft = "15px";
			imageZone.style.paddingRight = "15px";
			imageZone.innerHTML = "<img src='" + Sys.getProjectPath() + "/images/dataload.gif' border='0' style='vertical-align:middle;'/>&nbsp;" + loadingmsg;
			pt.document.body.appendChild(imageZone);
		} else {
			pt.document.getElementById("imageZone").innerHTML = "<img src='" + Sys.getProjectPath() + "/images/dataload.gif' style='vertical-align:middle;' border='0'/>&nbsp;" + loadingmsg;
			imageZone.style.visibility = "visible";
			disabledZone.style.visibility = "visible";
		}
	});

	dwr.engine.setPostHook(function() {
		pt.document.getElementById("imageZone").style.visibility = "hidden";
		pt.document.getElementById("disabledZone").style.visibility = "hidden";
	});
}

function initRows(nums, tableId) {
	
	if(isBlank(tableId)) tableId = "tableResult";
	
	var tab = document.getElementById(tableId);//得到table对象
	if (!tab) return;
	
	for ( var n = 0; n < nums.length; n++) {
		
		var num = nums[n];
		var startRow = 1;//从第二行开始，排除标题行
		var tdTempV = "";//循环记录表格中td的内容,用来判断td中的value是否发生了改变
		var rowCount = 1;//如果td的值相同,那么变量加1, 否则将临时变量加入集合中
		var totalcount = new Array();//得到相同内容的行数的集合
	
		for ( var i = 1; i < tab.rows.length; i++) {
			var tdText;//首先拿出来td的值
			if(isBlank(tab.rows[i].cells[num].innerText))
				tdText = tab.rows[i].cells[num].textContent;//火狐不支持innerText属性
			else
				tdText = tab.rows[i].cells[num].innerText;
			
			//如果是第一次走循环,直接continue; 
			if (i == startRow) {
				tdTempV = tdText;
				continue;//结束本次循环，继续下次循环
			}
			//如果当前拿出来的值和出处的值相同,那么将临时数量加1，否则添加到集合里面
			if (trim(tdText).length > 0 && tdTempV == tdText) {
				rowCount++;
			} else {
				totalcount.push(rowCount);
				tdTempV = tdText;
				rowCount = 1;
			}
	
			//判断是否是循环的最后一次,如果是最后一次那个直接将当前的数量存储到集合里面
			if (i == tab.rows.length - 1) {
				totalcount.push(rowCount);
			}
		}
		
		var tNum = 0;//临时变量,再循环中判断是否和数组中的一项值相同  
		//注意这个循环是倒着来的
		for ( var i = tab.rows.length - 1; i >= startRow; i--) {
			var tTd = tab.rows[i].cells[num];//临时变量,存储td  
			tNum++;
			//如果发现tNum和数组中最后一个值相同,那么就可以断定相同的td已经结束[只是其中一个] 
			if (tNum == totalcount[totalcount.length - 1]) {
				tTd.setAttribute("rowSpan", totalcount[totalcount.length - 1]);//给当前td添加rowSpan属性
				tTd.style.background = "#FFFFFF";
				totalcount.pop();//将数组的最后一个元素弹出
				tNum = 0;
			} else {
				tab.rows[i].removeChild(tTd);//删除当前td  
			}
		}
	}
}


/**
 * 右侧浮动，临时保存按钮
 * id 你要滚动的内容的id
 * l 横坐标的位置 不写为紧贴右边
 * t 你要放在页面的那个位置默认是贴着底边 0是贴着顶边
 * f 1表示固定 不写或者0表示滚动
 **/
function scrollx(p){
	var d = document,dd = d.documentElement,db = d.body,w = window,o = d.getElementById(p.id),ie6 = /msie 6/i.test(navigator.userAgent),style,timer;
	if(o){
		o.style.cssText +=";position:"+(p.f&&!ie6?'fixed':'absolute')+";"+(p.l==undefined?'right:0;':'left:'+p.l+'px;')+(p.t!=undefined?'top:'+p.t+'px':'bottom:0;right:10px;');
		if(p.f&&ie6){
			o.style.cssText +=';left:expression(documentElement.scrollLeft + '+(p.l==undefined?dd.clientWidth-o.offsetWidth:p.l)+' + "px");top:expression(documentElement.scrollTop +'+(p.t==undefined?dd.clientHeight-o.offsetHeight:p.t)+'+ "px" );';
			dd.style.cssText +=';background-image: url(about:blank);background-attachment:fixed;';
		}else{
			if(!p.f){
				w.onresize = w.onscroll = function(){
					clearInterval(timer);
					timer = setInterval(function(){
					//双选择为了修复chrome 下xhtml解析时dd.scrollTop为 0
					var st = (dd.scrollTop||db.scrollTop),c;
					c = st - o.offsetTop + (p.t!=undefined?p.t:(w.innerHeight||dd.clientHeight)-o.offsetHeight);
					if(c!=0){
						o.style.top = o.offsetTop + Math.ceil(Math.abs(c)/10)*(c<0?-1:1) + 'px';
					}else{
						clearInterval(timer);
					}
					},10)
				}
			}
		}
	}
}
