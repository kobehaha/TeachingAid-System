<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%
	String flag = (String)request.getAttribute("flag");
	String info = (String)request.getAttribute("info");
%>
<body>
	<form action="StudentAddFile" method="post" enctype="multipart/form-data">
		<table border="1">
			<tr>
				<td>教师编号</td>
				<td>作业编号</td>
				<td>选择文件</td>
				<td>上传</td>
			</tr>
			<tr>
				<td><input name="sno" value="012345"></td>
				<td><input name="task_no" value="22222"></td>
				<td><input type="file" name="浏览"></td>
			<%
				if(flag==null || flag.equals("false")){
			%>
				<%
					if(info!=null){
				%>
					<script language="javaScript">
						alert(info);
					</script>
				<%
					}
				%>
					<td><input type="submit" value="提交"></td>
			<%
				}else{
			%>
				<td><button type="button" disabled="disabled">提交</button></td>
			<%
				}
			%>
			</tr>
		</table>
	</form>
	
	<h1><%=flag %></h1>
	<h1><%=info %></h1>
</body>
</html>