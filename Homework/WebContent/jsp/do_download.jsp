<%@page import="com.jspsmart.upload.SmartUpload"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>执行下载</title>
</head>
<body>
	<%
		String hurl = request.getParameter("url");
		SmartUpload download = new SmartUpload();
	//初始化
		download.initialize(pageContext);
		//System.out.println(hurl);
	//下载文件
		download.downloadFile(hurl);
		response.getOutputStream().close();
		response.sendRedirect("teacher");
	%>
	
</body>
</html>