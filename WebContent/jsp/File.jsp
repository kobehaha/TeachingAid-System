<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>文件</title>

<script type="text/javascript">
	var xmlHttp;
	function createXMLHttp()
	{
		if(window.XMLHttpRequest)
		{
			xmlHttp  = new XMLHttpRequest();    //使用的是FireFox内核的浏览器
		}else{
			xmlHttp = new ActiveXObject("Microsoft.XMLHTTP"); //使用的是IE 内核的浏览器
		}
	}
	
	function showMsg(){
		createXMLHttp();       //建立XMLHttp核心
		xmlHttp.open("POST", "addFile.jsp");
		xmlHttp.onreadystatechange = showMsgCallback;   //设置请求完成之后处理的回调函数
		xmlHttp.send(null);    //发送请求，不传递任何参数
	}
	
	function showMsgCallback(){
		if(xmlHttp.readyState == 4){
			if(xmlHttp.status == 200){
				var text = xmlHttp.responseText;      //接收返回的内容
				
				document.getElementById("msg").innerHTML = text;
			}
		}
	}
</script>
</head>
<body>
	<input type="button" onclick="showMsg()" value="调用Ajax显示内容">
	<br>
	<div id="msg"></div>
</body>
</html>