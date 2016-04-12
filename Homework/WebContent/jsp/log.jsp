<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>

<html>
<head>
  	<meta http-equiv="content-type" content="text/html"; charset="utf-8" />
   
    <title>登录页面</title>
    <link href="css/log.css" rel="stylesheet" type="text/css" />
    <script src="js/log.js" type="text/javascript"></script>
    <%
    	request.setCharacterEncoding("utf8");
    %>
</head>
<body>
	<div id="background">
		<div id="content">
		    <div id="welcome">
            	<p>欢迎使用教学辅助系统</p>
        	</div>
		    <div id="log_in">
		        <div id="choose">
		            <span><a id="bottom_one" onclick="bottom_change1(this)" class="now" herf="#">学生登录</a></span>
		            <span><a id="bottom_two" onclick="bottom_change2(this)" class="other" herf="#">教师登录</a></span>
		        </div>
		        
		        <form id="form_student" action="StudentLogin" name="student" method="post"
		        style="display:block" onSubmit="return validate(this)">
			        <div id="input">
			            <input class="num" type="number" name="no" placeholder="请输入学号">
			            <input class="password" type="password" name="password" placeholder="请输入密码">
			            <input class="btnSub" type="submit" value="登  录"> 
			        </div>
		        </form>
		        
		        <form id="form_teacher" action="TeacherLogin" name="teacher" method="post"
		        style="display:none" onSubmit="return validate(this)">
			        <div id="input">
			            <input class="num" type="number" name="no" placeholder="请输入学号">
			            <input class="password" type="password" name="password" placeholder="请输入密码">
			            <input class="btnSub" type="submit" value="登  录"> 
			        </div>
		        </form>
		        
		        <%
		        	List<String> info = (List<String>)session.getAttribute("info");
		        	if(info != null)
		        	{
		        		Iterator iter = info.iterator();
		        		while(iter.hasNext())
		        		{
		        %>
		        			<h4 align="center"><%=iter.next() %></h4>	
		        <%
		        		}
		        	}
		        %>
		    </div>
		</div>
	</div>
	
    <div id="bottom">
        <span>版权所有</span> |
        <span>面向对象程序设计</span> | 
        <span>项目经理：张志远</span>
        <span id="bottom_control">组员:苏童,帅昌炽,杜司棋,郭湛彬</span>
    </div>
</body>
</html>