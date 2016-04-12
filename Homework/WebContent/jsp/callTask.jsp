<%@page import="com.cpp.homework.factory.DAOFactory"%>
<%@page import="com.cpp.homework.vo.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<%
		String sno = request.getParameter("sno");
		Student stu = new Student();
		stu.setSno(sno);
		stu.setScall(1);
		
		try {
			DAOFactory.getITeacherDAOInstance().callTask(stu);
			System.out.println(stu.getSno() + stu.getScall());
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
	
	<script>
		history.back();
		window.location.href='teacher?id=text3';
	</script>
</body>
</html>