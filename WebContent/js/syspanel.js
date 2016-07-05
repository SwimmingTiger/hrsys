var panelStylePath ={
	panelDown	:this.imgpath+"ddn.png",
	panelUp		:this.imgpath+"uup.png",
	setImagePath:function(path){
		if(path == null) path = "js/images/";
		if(path.charAt(path.length-1) != '/') path += "/";
		this.panelDown = path+"ddn.png";
		this.panelUp = path+"uup.png";
	}
};

var Panel ={
	clickPanel:function(){
		var fs = document.getElementsByTagName("legend");
		for(var i=0;i<fs.length;i++){
			
			if(fs[i].parentNode.tagName == "FIELDSET"){
				fs[i].onclick = function () {
					showorhiddenfieldset(this);
				};
			}
		}
	}
};
function showorhiddenfieldset(obj){
	var ns = obj.nextSibling;
	if(ns.style.display !="none"){
		ns.style.display ="none";
		obj.style.backgroundImage = "url('"+panelStylePath.panelUp+"')";
	}else{
		ns.style.display ="";
		obj.style.backgroundImage = "url('"+panelStylePath.panelDown+"')";
	}
}