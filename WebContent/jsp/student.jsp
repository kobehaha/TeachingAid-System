<%@page import="com.cpp.homework.factory.DAOFactory"%>
<%@page import="com.cpp.homework.vo.Student"%><%@ page language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="content-type" content="text/html" ; charset="utf-8" />
<title>学生管理</title>
<link href="css/student.css" rel="stylesheet" type="text/css" />
<script src="js/student.js" type="text/javascript"></script>
</head>
<body>
	<%
		//String sno = (String)session.getAttribute("sno");
		//String sname = (String)session.getAttribute("sname");

		Student stu = (Student) session.getAttribute("stu");
		boolean flag = DAOFactory.getIStudentDAOInstance().isCalled(stu);
		if (flag) {
	%>
	<script type="text/javascript">
		alert("请尽快完成作业或修改已提交的作业！！！");
	</script>
	<%
		stu.setScall(0);
			DAOFactory.getITeacherDAOInstance().callTask(stu);
		}
	%>
	<%
		if(stu.getSpassword().equals("111111")){
	%>
			<script type="text/javascript">
				alert("请修改密码！！！");
			</script>
<%
		}
%>			
	<div id="background">
		<div id="back">
			<a href="index.html"><img src="img/back.png" /></a>
		</div>
		<div id="main">
			<div id="school_left">
				<div id="userInfobox">
					<div id="userportrait">
						<img alt="学生头像" src="img/student_user.jpg" />
					</div>
					<div id="username">
						<a> <%=stu.getSname()%>
						</a>
					</div>
					<span> 这里是学生端 </span>
				</div>
				<div id="catalog">
					<ul>
						<li onclick="catalog_change(this)" id="catalog1" class="now"><p
								id="p1" class="p_now">修改密码</p></li>
						<li onclick="catalog_change(this)" id="catalog2" class="other"><p
								id="p2" class="p_other">作业管理</p></li>
						<li onclick="catalog_change(this)" id="catalog3" class="other"><p
								id="p3" class="p_other">答题作业</p></li>
						<li onclick="catalog_change(this)" id="catalog4" class="other"><p
								id="p4" class="p_other">查看课件</p></li>
					</ul>
				</div>
			</div>
			<div id="text">
				<div id="text1" class="text_visible">
					<div class="text_top"></div>
					<div class="text_nav"></div>
					<div id="alt_text">
						<p>修改您的密码</p>
					</div>
					<div id="alt">
						<form action="alterPassword">
							<div class="alt_div" id="Old_password">
								<span class="input_left">
									<p>旧密码： *</p>
								</span> <span class="input_right"> <input class="alt_password"
									type="password" name="oldPassword" placeholder="输入旧密码">
								</span>
							</div>
							<div class="alt_div" id="New_password">
								<span class="input_left">
									<p>新密码： *</p>
								</span> <span class="input_right"> <input class="alt_password"
									class="alt_password" type="password" name="newPassword" placeholder="输入新密码">
								</span>
							</div>
							<div class="alt_div" id="New_password2">
								<span class="input_left">
									<p>再次输入新密码： *</p>
								</span> <span class="input_right"> <input class="alt_password"
									type="password" name="definePassword" placeholder="重新输入新密码">
								</span>

							</div>
							<input id="alt_sure" type="submit" value="确定">
						</form>

					</div>
				</div>

				<div id="text2" class="text_hidden">
					<div class="text_top"></div>
					<div class="text_nav"></div>

					<div>
						<input type="button" onclick="showIncomplete()" value="未完成">
						<input type="button" onclick="showCompleted()" value="已完成">
					</div>

					<div id="showTask"></div>
				</div>


				<div id="text3" class="text_hidden">
					<div class="text_top"></div>
					<div class="text_nav"></div>
				</div>
				<div id="text4" class="text_hidden">
					<div class="text_top"></div>

					<div class="text_nav"></div>


					<div>
						<form action="uploadCourseWare" method="post"
							enctype="multipart/form-data">
							<input type="file" name="liulan"> <input type="submit"
								value="上传课件">
						</form>
						<input type="button" onclick="showCourseWare()" value="显示课件">
					</div>

					<div id="showCourseWare"></div>
				</div>
			</div>
		</div>
		<div id="bottom">
			<span>版权所有</span> | <span>面向对象程序设计</span> | <span>项目经理：张志远</span> <span
				id="bottom_control">组员:苏童,帅昌炽,杜司棋,郭湛彬</span>
		</div>
	</div>
</body>
</html>