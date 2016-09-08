<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.cpp.homework.factory.DAOFactory"%>
<%@page import="com.cpp.homework.vo.Student"%>
<%@page import="java.util.List"%>
<%@page import="com.cpp.homework.vo.Teacher" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta http-equiv="content-type" content="text/html"; charset="utf-8" />
    <title>教师管理</title>
    <link href="css/teacher.css" rel="stylesheet" type="text/css" />
    <script src="js/teacher.js" type="text/javascript"></script>
</head>

<%
	Teacher t = (Teacher)session.getAttribute("teacher");
	String tno = t.getTno();
	String tname = t.getTname();
%>

<body>
    <div id="background">
    	<div id="back">
            <a href="index.html"><img src="img/back.png" /></a>
        </div>
        
        <div id="main">
            <div id="school_left">
                <div id="userInfobox">
                    <div id="userportrait">
                       <img alt="教师头像" src="img/teacher_user.jpg" />
                    </div>
                    <div id="username">
                        <a>
                            <%=tname %>
                        </a>
                    </div>
                    <span>
                        这里是教师端
                    </span>
                </div>
                <div id="catalog">
                    <ul>
                        <li onclick="catalog_change(this)" id="catalog1" class="now"><p id="p1" class="p_now">考勤</p></li>
                        <li onclick="catalog_change(this)" id="catalog2" class="other"><p id="p2" class="p_other">作业</p></li>
                        <li onclick="catalog_change(this)" id="catalog3" class="other"><p id="p3" class="p_other">成绩</p></li>
                        <li onclick="catalog_change(this)" id="catalog4" class="other"><p id="p4" class="p_other">课件</p></li>
                    </ul>
                </div>
            </div>
            <div id="text">
                    <div id="text1" class="text_visible">
                        <div class="text_top">
                        
                        </div>
                        <div class="text_nav">
                            
                        </div>
                        	<form action="" method="post" enctype="multipart/form-data">
                        		<input type="file" name="addStudent">
                        	</form>
		                   	<input type="button" onclick="addStudent()" value="导入"> 
                        	
        	                <input type="button" onclick="showStudent()" value="考勤"> 
                        <style type="text/css">
					        body{
					            width: auto;
					            margin: 0 auto;
					            font-family: 微软雅黑;
					            font-size: 14px;
					            color: #444;
					        }
					        table{
					            border-spacing: 0;
					            width: 95%;
					            margin: 10px auto;
					        }
					        .bordered{
					        	background: white;
					            border: solid #ccc 1px;
					            -moz-border-radius: 6px;
					            -webkit-border-radius: 6px;
					            border-radius: 6px;
					            -webkit-box-shadow: 0 1px 1px #ccc; 
					            -moz-box-shadow: 0 1px 1px #ccc; 
					            box-shadow: 0 1px 1px #ccc;      
					        }
					        .bordered tr:hover{
					            background: #fbf8e9;
					            -moz-border-radius: 6px;
					            -webkit-border-radius: 6px;
					            border-radius: 6px;
					            -webkit-box-shadow: 0 1px 1px #ccc; 
					            -moz-box-shadow: 0 1px 1px #ccc; 
					            box-shadow: 0 1px 1px #ccc;    
					        }
					        .bordered tr:hover{
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
					        .bordered th{
					            background-color: #dce9f9;
					            background-image: -webkit-gradient(linear, left top, left bottom, from(#ebf3fc), to(#dce9f9));
					            background-image: -webkit-linear-gradient(top, #ebf3fc, #dce9f9);
					            background-image:    -moz-linear-gradient(top, #ebf3fc, #dce9f9);
					            background-image:     -ms-linear-gradient(top, #ebf3fc, #dce9f9);
					            background-image:      -o-linear-gradient(top, #ebf3fc, #dce9f9);
					            background-image:         linear-gradient(top, #ebf3fc, #dce9f9);
					            -webkit-box-shadow: 0 1px 0 rgba(255,255,255,.8) inset; 
					            -moz-box-shadow:0 1px 0 rgba(255,255,255,.8) inset;  
					            box-shadow: 0 1px 0 rgba(255,255,255,.8) inset; 
					        }
					        .bordered td:first-child,.bordered th:first-child{
					            border-left: none;
					        }
					
					        .bordered th:first-child{
					            -moz-border-radius: 6px 0 0 0;
					            -webkit-border-radius: 6px 0 0 0;
					            border-radius: 6px 0 0 0;
					        }
					        .bordered th:last-child{
					            -moz-border-radius: 0 6px 0 0;
					            -webkit-border-radius: 0 6px 0 0;
					            border-radius: 0 6px 0 0;
					        }
					        .bordered th:only-child{
					            -moz-border-radius: 6px 6px 0 0;
					            -webkit-border-radius: 6px 6px 0 0;
					            border-radius: 6px 6px 0 0;
					        }
					        .bordered tr:last-child td:first-child{
					            -moz-border-radius: 0 0 0 6px;
					            -webkit-border-radius: 0 0 0 6px;
					            border-radius: 0 0 0 6px;
					        }
					        .bordered tr:last-child td:last-child{
					            -moz-border-radius: 0 0 6px 0;
					            -webkit-border-radius: 0 0 6px 0;
					            border-radius: 0 0 6px 0;
					        }
					}
					    </style>
                        <div id="student_list">
                        	<table border="1" class="bordered">
								<thead>
								<tr>
									<th>班级</th>
									<th>学号</th>
									<th>姓名</th>
									<th>性别</th>
									<th>学院</th>
									<th>旷课次数</th>
									<th>旷到</th>
								</tr>
								</thead>
								
								`<%
									List<Student> arrayStudents = DAOFactory.getITeacherDAOInstance().showStudent();
									Iterator iter = arrayStudents.iterator();
									
									while(iter.hasNext()){
										Student stu = (Student)iter.next();
								%>
										<tr>
											<td><%=stu.getSclass() %></td>
											<td><%=stu.getSno() %></td>
											<td><%=stu.getSname() %></td>
											<td><%=stu.getSsex() %></td>
											<td><%=stu.getSdept() %></td>
											<td><%=stu.getSlater() %></td>
											<td>
												<a href="addStudentLate?sno=<%=stu.getSno() %>">
													<input type="button" value="旷到">
												</a>
											</td>
										</tr>					
								<%
									}
								%>		
								<tr>提交</tr>
							</table>
                        </div>
                    </div>
                    
                    <div id="text2" class="text_hidden">
                        <div class="text_top">
                        
                        </div>
                        <div class="text_nav">
                            
                        </div>
                        <div>
                        	<form action="TeacherAddTask" method="post" enctype="multipart/form-data">
								<table border="1">
									<tr>
										<td></td>
										<td><input type="button" value="添加文件" onclick="addfiles()" /></td>
										<td></td>
									</tr>
									<tr>
										<td></td>
										<td><div id="files"></div></td>
										<td></td>
									</tr>
									<tr>
										<td><input type="reset" value="重置" /></td>
										<td><input type="submit" value="上传" /></td>
										<td></td>
									</tr>
								</table>
							</form>
							<input type="button" onclick="showFile()" value="批改作业" />
							<div id="showFile"></div>
                        </div>
                    </div>
                    
                    
                    <div id="text3" class="text_hidden">
                        <div class="text_top">
                        
                        </div>
                        <div class="text_nav">
                            
                        </div>
                       
                        <div>
                        	<input type="button" onclick="showGrade()" value="显示成绩">
                        </div>
                        <div id="showGrade"></div>
                    </div>
                    
                    
                    <div id="text4" class="text_hidden">
                        <div class="text_top">
                        
                        </div>
                        <div class="text_nav">
                            
                        </div>
                        
                        <div>
                        	<form action="uploadCourseWareTeacher" method="post" enctype="multipart/form-data">
								<input type="file" name="liulan">
								<input type="submit" value="上传课件">
                        	</form>
                        	<input type="button" onclick="showCourseWare()" value="显示课件"> 
                        </div>
                        
                        <div id="showCourseWare"></div>
                    </div>
                    
            </div>
        </div>
        <div id="bottom">
            <span>版权所有</span> |
            <span>面向对象程序设计</span> | 
            <span>项目经理：张志远</span>
            <span id="bottom_control">组员:苏童,帅昌炽,杜司棋,郭湛彬</span>
        </div>
    </div>
</body>
</html>