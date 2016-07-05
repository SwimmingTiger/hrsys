var formStylePath ={
	imgpath			:"../images/",
	requtitle		:"小贴士:&nbsp;",
	//设置图片路径
	setImagePath:function(path){
		if(path == null) path = "../images/";
		if(path.charAt(path.length-1) != '/') path += "/";
		this.imgpath = path;
	},
	getImagePath:function(){
		return this.imgpath;
	},
	getrequTitle:function(){
		return this.requtitle;
	}
};

var currentInputObject ={
	object:null,
	setobject:function(obj){
		this.object = obj;
	},
	getobject:function(){
		return this.object;
	}
};

function initInput(requid,title){
	if(title == undefined){
		document.getElementById(requid).innerHTML = formStylePath.getrequTitle() + "&nbsp;<em>*</em>&nbsp;表示为必填项&nbsp;<font color='blue'>•&nbsp;为选填其中一项</font>";
	}else{
		document.getElementById(requid).innerHTML = formStylePath.getrequTitle() + title;
	}
}

function setselectStyle() {
	//textarea
	var areas = document.getElementsByTagName("textarea");
	var al = areas.length;
	for(var i=0;i<al;i++){
		var area = areas[i];
		var cn = area.className;
		if (cn == null || cn == "undefined" || cn == undefined || cn.length == 0) {
			area.className = "areaniceform";
		}
		if(area.getAttribute("readonly")){
			area.style.cssText ="background: #ffffff url("+formStylePath.getImagePath()+"takeimg.png) 3px no-repeat;color:#3a3a3a;font:13px '宋体';line-height:16px;height:35px;padding-left:10px;";
			area.onselectstart = function(){
				return false;
			}
		}
		if(area.getAttribute("readonly")){
			area.title += " 点击右键清除";
			initContextMenu(area);//注册右击事件
		}
	}
	//文本框
	var txts = document.getElementsByTagName("input");
	var tl = txts.length;
	for (var i = 0; i <tl ; i++) {
		var bl = false;
		var txt = txts[i];
		var ta = txt.getAttribute("type");
		if ( ta== "text" || ta == "password") {
			var cn = txt.className;
			if (cn == null || cn == "undefined" || cn == undefined || cn.length == 0) {
				txt.className = "niceform";
			}else if(cn == "numform" || cn == "rmbform"){
				txt.title ="只能输入数字";
				txt.onkeyup = function(){
					input_validnumOrrmb(this);
				}
			}else if(cn == "takeform"){
				if(txt.getAttribute("readonly")){
					txt.style.cssText +=";color:#3a3a3a;";
					txt.onselectstart = function(){
						return false;
					}
				}
				txt.title += " 点击右键清除";
				if(txt.getAttribute("readonly")){
					initContextMenu(txt);//注册右击事件
				}
			}
			
		} 
	} 
}
//==============================

function input_validnumOrrmb(obj){
	var num = obj.value;
	
	//第一个负号不处理
	if(num == "-"){
		return false;
	}
	
	var re=num.match(/-?\d+\.?\d*|\.\d+/);
	var tmp ="";
	if(re!=null){ 
		tmp=re; 
	}else{
		if(num.length>0){
			tmp=num.substring(0,num.length-1);
		}
	}
	
	obj.value= tmp;
}

function initContextMenu(obj){
	$(obj).contextMenu('clearMenu',{
	    bindings: {
	    	'clear':function(t){clearInput(t.id)}
	    },
	    menuStyle:{width:'60px'},
	    itemStyle:{padding:'1px'}
	});
}

function clearInput(id){
	var obj = document.getElementById(id);
	if(obj!=null){
		obj.value = "";
		var link =obj.getAttribute("linkclear");
		if(link!=null&&link != "undefined" && link != undefined && link.length > 0){
			var linkobj=document.getElementById(link);
			if(linkobj!=null&&linkobj != "undefined" && linkobj != undefined){
				linkobj.value ="";
			}
		}
	}
}

//注册事件
if (document.all) {
	window.attachEvent("onload", setselectStyle);
} else {
	window.addEventListener("load", setselectStyle, false);
}
