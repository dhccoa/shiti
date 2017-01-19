//获得aja对象
function getXhr(){
		var xhr=null;
		if(window.XMLHttpRequest){
		//非ie浏览器
		xhr=new XMLHttpRequest();
		}else{
			xhr=new ActiveXObject("Microsoft.XMLHttp")
		}
		return xhr;
	}

var $$ = function(id) {
	return "string" == typeof id ? document.getElementById(id) : id;
};

function StringBuffer(){
	this._strings_=new  Array;
}
StringBuffer.prototype.append=function (str){
	this._strings_.push(str);
};
StringBuffer.prototype.toString=function(){
	return this._strings_.join("");
};
String.prototype.Trim = function(){
	return this.replace(/(^\s*)|(\s*$)/g,""); 
};