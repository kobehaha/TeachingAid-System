package com.cpp.homework.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cpp.homework.factory.DAOFactory;
import com.cpp.homework.vo.Student;

public class StudentLogin extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		String path = "/student";
		String sno = req.getParameter("no");
		String spassword = req.getParameter("password");     //从请求页的form表单中获取用户ID和密码
		
		List<String> info = new ArrayList<String>();              //定义一个List变量，用于存储信息
		
		if (sno==null || "".equals(sno)) {
			info.add("用户ID不能为空！！！");
		}
		if (spassword==null || "".equals(spassword)) {
			info.add("密码不能为空！！！");
		}
		
		//用户ID和密码验证通过
		if (info.size() == 0) {
			Student stu = new Student();   //创建一个Student对象
			stu.setSno(sno);      //将客户端的用户ID封装到student对象中
			stu.setSpassword(spassword);
			
			//设置Session
			HttpSession session = req.getSession();
			
			try {
				//如果用户ID和密码通过验证
				if (DAOFactory.getIStudentDAOInstance().findLogin(stu)) {
//					System.out.println("用户名和密码正确！！！");
//					req.getRequestDispatcher(path).forward(req, resp);    //跳转到student界面
					
					//使用客户端跳转
//					session.setAttribute("sno", sno);
//					session.setAttribute("sname", stu.getSname());
					
					session.setAttribute("stu", stu);
					resp.sendRedirect("student");
				}else{
//					System.out.println("用户名或密码错误！！！");
//					req.getRequestDispatcher("/login").forward(req, resp);     //用户ID或密码错误，跳转回原界面
				
					info.add("用户名或密码错误！！！");
					session.setAttribute("info", info);
					resp.sendRedirect("index.html");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
			
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		doGet(req, resp);
	}
	
	
}
