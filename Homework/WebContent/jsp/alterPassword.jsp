<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.cpp.homework.vo.*" %>
<%@page import="com.cpp.homework.factory.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<%
	Student stu = (Student)session.getAttribute("stu");

	String oldPassword = request.getParameter("oldPassword");
	String newPassword = request.getParameter("newPassword");
	String definePassword = request.getParameter("definePassword");
	
	if(newPassword.equals(definePassword) && oldPassword.equals(stu.getSpassword())){
		stu.setSpassword(newPassword);
		if(DAOFactory.getIStudentDAOInstance().alterPassword(stu)){
			response.sendRedirect("student");
		}
	}
%>

</body>
</html>