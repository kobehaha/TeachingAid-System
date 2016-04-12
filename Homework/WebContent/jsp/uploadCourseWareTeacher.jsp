<%@page import="java.sql.Date"%>
<%@page import="com.jspsmart.upload.SmartUploadException"%>
<%@page import="com.cpp.homework.vo.CourseWare"%>
<%@page import="com.cpp.homework.vo.Student"%>
<%@page import="com.cpp.homework.vo.Teacher"%>
<%@page import="com.cpp.homework.factory.DAOFactory"%>
<%@page import="java.io.File"%>
<%@page import="com.jspsmart.upload.SmartUpload"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>

	
<%
	try 
	{
		SmartUpload upload = new SmartUpload();
		//初始化
		upload.initialize(pageContext);
		upload.upload();
		
		response.getOutputStream().close();
		//response.sendRedirect("teacher");
		
		String FilePath = request.getSession().getServletContext().getRealPath("/") + "courseWare/";
		try {
			if (!(new File(FilePath).isDirectory())) {
				new File(FilePath).mkdir();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		Teacher t = (Teacher) request.getSession().getAttribute("teacher");

		CourseWare courseWare = new CourseWare();
		
		String ext = upload.getFiles().getFile(0).getFileExt();
		String file = upload.getFiles().getFile(0).getFileName();

		int i = file.indexOf(".");
		String fileName = file.substring(0,i);
		
		String FileUrl = FilePath + fileName + "." + ext;
		courseWare.setName(t.getTname());
		courseWare.setFileName(file);
		courseWare.setFileUrl(FileUrl);
		courseWare.setFileDate(new Date(new java.util.Date().getTime()));
		
		upload.getFiles().getFile(0).saveAs(FileUrl);
		
		System.out.println(FileUrl);
		String info = new String();      //存储一些相关信息
		
		//将文件相关信息存储在数据库中
		boolean flag = false;      //标志文件是否成功上传
		flag = DAOFactory.getITeacherDAOInstance().addCourseWare(courseWare);
		
		if (!flag) {
			request.setAttribute("flag", "false"); 
			info = "文件上传失败，请检查网络状况！！！";
		}else{
			request.setAttribute("flag", "true");
		}
		
		request.setAttribute("info", info);
		response.sendRedirect("teacher");
	} catch (SmartUploadException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
%>
</body>
</html>