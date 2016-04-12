<%@page import="com.cpp.homework.factory.DAOFactory"%>
<%@page import="com.cpp.homework.vo.TaskGrade"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>

<%
	String grade = request.getParameter("grade");
	String sno = request.getParameter("sno");
	System.out.println(grade);
	
	int iGrade = 0;
	switch(grade){
	case "A":
		iGrade = 10;
		break;
	case "B":
		iGrade = 8;
		break;
	case "C":
		iGrade = 6;
		break;
	case "D":
		iGrade = 4;
		break;
		
	default:
		break;
	}
	
	TaskGrade tg = new TaskGrade();
	tg.setHgrade(iGrade);
	tg.setSno(sno);
	
	//插入成绩成功
	if(DAOFactory.getITeacherDAOInstance().addTaskGrade(tg)){
		response.sendRedirect("../teacher");
	}
%>
</body>
</html>