<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.* ,java.text.SimpleDateFormat,entity.Question"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
li{margin:0; padding:0; list-style-type:none}
a{text-decoration:none}
</style>
<script type="text/javascript" src="js/base.js"></script>
<script type="text/javascript" src="js/my.js"></script>

<script type="text/javascript">
	//处理点赞 
	function dianZan(index){
		
		var xhr=getXhr();//获取ajax对象
		
		xhr.open('post','dianZan.do',false);
		xhr.setRequestHeader('content-type','application/x-www-form-urlencoded');
		xhr.onreadystatechange=function(){
			if(xhr.readyState==4){
				var txt=xhr.responseText;
				
				if(txt=='ok'){
					alert("点赞成功!");
					var zan=$$("zan_"+index);
					zan.parentNode.innerHTML="已赞";
					
				}
			}
		}
		xhr.send("index="+index);

	}
	//处理选项选择
	function chose(v,id,checked){
		//获取所有选项
		var options=$(".option_"+id);
		
		//清空所有选中
		for(var i=0 ;i<options.length();i++){
			//alert(options.ge(i))
			options.ge(i).checked=false;
		}
		//将点击的选项选中
		for(var i=0 ;i<options.length();i++){
			if(options.ge(i).value==v){
				options.ge(i).checked=true;
			}
		}
		var answer=$("#"+id).ge(0).value
		
		var msg=$$("msg_"+id);
		if(!checked){
			return ;
		}
		msg.innerHTML="你选择的答案是："+v+",正确答案是:"+answer;
		msg.style.display="";
	}

	//处理选项选择
	function chose(v,id,checked,index){
		//获取答案
		var answer=$("#"+id).ge(0).value;
		
		//获取所有选项
		var options=$(".option_"+id);
		
		//清空所有选中
		for(var i=0 ;i<options.length();i++){
			//alert(options.ge(i))
			options.ge(i).checked=false;
		}
		//将点击的选项选中
		for(var i=0 ;i<options.length();i++){
			
			if(options.ge(i).value==answer){
				var next=getNextElement(options.ge(i).nextSibling);
				//alert(options.ge(i).value+","+next.tagName)
				var img=document.createElement('img');
					img.className="check";
					img.src="images/check_alt.png";
					next.appendChild(img);	
			}
				
			
			if(options.ge(i).value==v){
				options.ge(i).checked=true;

				//显示对错
				var next=getNextElement(options.ge(i).nextSibling);
				//alert(options.ge(i).value+","+next.tagName)
				var img;
					
				if(v!=answer){
					img=document.createElement('img');
					img.className="check";
					img.src="images/x_alt.png";
				}
				next.appendChild(img);
			}
		}

		//判断得分
		if(v==answer){
			score++;
			
		}
		//延时显示下一题
		setTimeout(nextT,2000);
		
		function nextT(){
			var share=$(".share");
		
			//如果是最后一题就跳转
			if(index>=share.length()){
				//alert(index+","+share.length())
				window.location.href="tongji.do?score="+score;
			}
			
			for(var i=0;i<share.length();i++){
				share.ge(i).style.display="none";
			}
			//显示下一道题目
			for(var i=0;i<share.length();i++){
				share.ge(index).style.display="block";
			}
		}
	
	}
</script>
</head>

<body>

<c:forEach items="${questions}" var="question" varStatus="s">
 <ul >
 	<li >${s.count}:${question.title }&nbsp;<span><a href="#"  id="zan_${s.count}" onclick="dianZan(${s.count})">赞 <img src="images/zan.jpg"/></a></span></li>
 	<input id="${question.id }" type="hidden" value="${question.answer }" />
 	<li>&nbsp;<input type="checkbox" class="option_${question.id }" value="A" onclick="chose(this.value,${question.id },this.checked)"></input>A:${question.optionA }</li>
 	<li>&nbsp;<input type="checkbox" class="option_${question.id }" value="B" onclick="chose(this.value,${question.id },this.checked)"></input>B:${question.optionB }</li>
 	<li>&nbsp;<input type="checkbox" class="option_${question.id }" value="C" onclick="chose(this.value,${question.id },this.checked)"></input>C:${question.optionC }</li>
 	<li>&nbsp;<input type="checkbox" class="option_${question.id }" value="D" onclick="chose(this.value,${question.id },this.checked)"></input>D:${question.optionD }</li>
 	<li><span id="msg_${question.id }" style="display:none">你选择的答案是：，正确答案是</span></li>
 </ul>
 </c:forEach>
 
</body>
</html>