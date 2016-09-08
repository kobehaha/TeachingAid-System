package com.cpp.homework.servlet;

import java.io.File;
import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cpp.homework.factory.DAOFactory;
import com.cpp.homework.vo.TaskStudent;
import com.cpp.homework.vo.TaskTeacher;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

public class TeacherAddTask extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		try 
		{
		
			SmartUpload smart = new SmartUpload();
			smart.initialize(this.getServletConfig(), req, resp);       //初始化上传
			smart.upload();
			
			String FilePath = req.getSession().getServletContext().getRealPath("/") + "teacher/";
			try {
				if (!(new File(FilePath).isDirectory())) {
					new File(FilePath).mkdir();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
//			String sno = smart.getRequest().getParameter("sno");
			//String sno = "2013211522";
			String tno = (String) req.getSession().getAttribute("tno");
			
			TaskTeacher t = new TaskTeacher();
			t.setTno(tno);
			
//			System.out.println(tno);
//			System.out.println(smart.getFiles().getCount());
//			
			
			String info = new String();      //存储一些相关信息
			boolean flag = false;      //标志文件是否成功上传
			
			for (int i = 0; i < smart.getFiles().getCount(); i++) {
				
				String ext = smart.getFiles().getFile(i).getFileExt();
				String file = smart.getFiles().getFile(i).getFileName();
				
				int n = file.indexOf(".");
				String fileName = file.substring(0,n);
				
				String TaskUrl = FilePath + fileName + "_" + tno + "_" + i + "." + ext;
				Date date = new Date(new java.util.Date().getTime());
				t.setTask_date(date);
				t.setTask_url(TaskUrl);
				t.setTask_name(fileName + "_" + tno + "_" + i + "." + ext);
				
				smart.getFiles().getFile(0).saveAs(TaskUrl);
				
				//将文件相关信息存储在数据库中
				flag = DAOFactory.getITeacherDAOInstance().addFile(t);
			
			}
			if (!flag) {
				req.setAttribute("flag", "false"); 
				info = "文件上传失败，请检查网络状况！！！";
			}else{
				req.setAttribute("flag", "true");
			}
			
			req.setAttribute("info", info);
			req.getRequestDispatcher("teacher").forward(req, resp);     
		} catch (SmartUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		doGet(req, resp);
	}
}
