<%@page import="com.cpp.homework.factory.DAOFactory"%>
<%@page import="com.cpp.homework.vo.Student"%>
<%@page import="jxl.Sheet"%>
<%@page import="java.io.File"%>
<%@page import="jxl.Workbook"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
body {
	width: auto;
	margin: 0 auto;
	font-family: 微软雅黑;
	font-size: 14px;
	color: #444;
}

table {
	border-spacing: 0;
	width: 95%;
	margin: 10px auto;
}

.bordered {
	background: white;
	border: solid #ccc 1px;
	-moz-border-radius: 6px;
	-webkit-border-radius: 6px;
	border-radius: 6px;
	-webkit-box-shadow: 0 1px 1px #ccc;
	-moz-box-shadow: 0 1px 1px #ccc;
	box-shadow: 0 1px 1px #ccc;
}

.bordered tr:hover {
	background: #fbf8e9;
	-moz-border-radius: 6px;
	-webkit-border-radius: 6px;
	border-radius: 6px;
	-webkit-box-shadow: 0 1px 1px #ccc;
	-moz-box-shadow: 0 1px 1px #ccc;
	box-shadow: 0 1px 1px #ccc;
}

.bordered tr:hover {
	background: #fbf8e9;
	-o-transition: all 0.1s ease-in-out;
	-webkit-transition: all 0.1s ease-in-out;
	-moz-transition: all 0.1s ease-in-out;
	-ms-transition: all 0.1s ease-in-out;
	transition: all 0.1s ease-in-out;
}

.bordered td, .bordered th {
	border-left: 1px solid #ccc;
	border-top: 1px solid #ccc;
	padding: 10px;
	text-align: left;
}

.bordered th {
	background-color: #dce9f9;
	background-image: -webkit-gradient(linear, left top, left bottom, from(#ebf3fc),
		to(#dce9f9));
	background-image: -webkit-linear-gradient(top, #ebf3fc, #dce9f9);
	background-image: -moz-linear-gradient(top, #ebf3fc, #dce9f9);
	background-image: -ms-linear-gradient(top, #ebf3fc, #dce9f9);
	background-image: -o-linear-gradient(top, #ebf3fc, #dce9f9);
	background-image: linear-gradient(top, #ebf3fc, #dce9f9);
	-webkit-box-shadow: 0 1px 0 rgba(255, 255, 255, .8) inset;
	-moz-box-shadow: 0 1px 0 rgba(255, 255, 255, .8) inset;
	box-shadow: 0 1px 0 rgba(255, 255, 255, .8) inset;
}

.bordered td:first-child, .bordered th:first-child {
	border-left: none;
}

.bordered th:first-child {
	-moz-border-radius: 6px 0 0 0;
	-webkit-border-radius: 6px 0 0 0;
	border-radius: 6px 0 0 0;
}

.bordered th:last-child {
	-moz-border-radius: 0 6px 0 0;
	-webkit-border-radius: 0 6px 0 0;
	border-radius: 0 6px 0 0;
}

.bordered th:only-child {
	-moz-border-radius: 6px 6px 0 0;
	-webkit-border-radius: 6px 6px 0 0;
	border-radius: 6px 6px 0 0;
}

.bordered tr:last-child td:first-child {
	-moz-border-radius: 0 0 0 6px;
	-webkit-border-radius: 0 0 0 6px;
	border-radius: 0 0 0 6px;
}

.bordered tr:last-child td:last-child {
	-moz-border-radius: 0 0 6px 0;
	-webkit-border-radius: 0 0 6px 0;
	border-radius: 0 0 6px 0;
}
}
</style>
</head>
<body>
	<table border="1" class="bordered">
		<thead>
		<tr>
			<th>班级</th>
			<th>学号</th>
			<th>姓名</th>
			<th>年龄</th>
			<th>性别</th>
			<th>学院</th>
		</tr>
		</thead>

		<%
			try {
				Workbook book = Workbook.getWorkbook(new File("/home/su/Desktop/0491301.xls"));
				Sheet sheet = book.getSheet(0);
				int n = sheet.getColumns();
				int m = sheet.getRows();

				Student student = new Student();

				for (int i = 1; i < m; i++) {
		%>

		<%
			String sclass = sheet.getCell(1, i).getContents();
					String sno = sheet.getCell(2, i).getContents();
					String sname = sheet.getCell(3, i).getContents();
					int sage = Integer.parseInt(sheet.getCell(4, i).getContents());
					//String sage = sheet.getCell(4, i).getContents();
					String ssex = sheet.getCell(5, i).getContents();
					String sdept = sheet.getCell(6, i).getContents();
					String spassword = sheet.getCell(7, i).getContents();
					int scall = Integer.parseInt(sheet.getCell(8, i).getContents());
					int slate = Integer.parseInt(sheet.getCell(9, i).getContents());
		%>
		<%
			student.setSno(sno);
					student.setSname(sname);
					student.setSclass(Integer.parseInt(sclass));
					student.setSage(sage);
					student.setSsex(ssex);
					student.setSdept(sdept);
					student.setSpassword(spassword);
					student.setScall(scall);
					student.setSlater(slate);

					boolean flag = DAOFactory.getITeacherDAOInstance().addStudent(student);
					if (flag) {
		%>
		<tr>
			<td><%=sclass%></td>
			<td><%=sno%></td>
			<td><%=sname%></td>
			<td><%=sage%></td>
			<td><%=ssex%></td>
			<td><%=sdept%></td>
		</tr>
		<%
			}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		%>
	</table>
</body>
</html>