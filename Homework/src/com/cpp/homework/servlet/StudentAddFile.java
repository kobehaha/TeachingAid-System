package com.cpp.homework.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cpp.homework.factory.DAOFactory;
import com.cpp.homework.vo.Student;
import com.cpp.homework.vo.TaskStudent;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

public class StudentAddFile extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		try 
		{
		
			SmartUpload smart = new SmartUpload();
			smart.initialize(this.getServletConfig(), req, resp);       //初始化上传
			smart.upload();
			
			String FilePath = req.getSession().getServletContext().getRealPath("/") + "student/";
			try {
				if (!(new File(FilePath).isDirectory())) {
					new File(FilePath).mkdir();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
//			String FilePath = "/home/su/Documents/JavaEE/WorkSpace_1/Homework/student/";
			
//			String sno = smart.getRequest().getParameter("sno");
			//String sno = "2013211522";
			Student stu = (Student) req.getSession().getAttribute("stu");
			String sno = stu.getSno();
			String task_no = smart.getRequest().getParameter("task_no");
			
			TaskStudent tStu = new TaskStudent();
			tStu.setSno(sno);
			tStu.setTask_no(task_no);
			
			String ext = smart.getFiles().getFile(0).getFileExt();
			String file = smart.getFiles().getFile(0).getFileName();

			int i = file.indexOf(".");
			String fileName = file.substring(0,i);
			
			String FileUrl = FilePath + fileName + "_" + sno + "." + ext;
			tStu.setHname(fileName+ "_" + sno + "." + ext);
			tStu.setHurl(FileUrl);
			
			smart.getFiles().getFile(0).saveAs(FileUrl);
			
			System.out.println(FileUrl);
			String info = new String();      //存储一些相关信息
			
			//将文件相关信息存储在数据库中
			boolean flag = false;      //标志文件是否成功上传
			flag = DAOFactory.getIStudentDAOInstance().addFile(tStu);
			
			if (!flag) {
				req.setAttribute("flag", "false"); 
				info = "文件上传失败，请检查网络状况！！！";
			}else{
				req.setAttribute("flag", "true");
			}
			
			req.setAttribute("info", info);
			req.getRequestDispatcher("student").forward(req, resp);     
		} catch (SmartUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
//		System.out.println(sno+task_no);		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		doGet(req, resp);
	}
}
