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
import com.cpp.homework.vo.Teacher;

public class TeacherLogin extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		Teacher t = null;
		String tno = req.getParameter("no");       //获取教师用户ID
		String tpassword = req.getParameter("password");
		
		List<String> info = new ArrayList<String>();
		
		if (tno==null || "".equals(tno)) {
			info.add("用户ID不能为空！！！");
		}
		if (tpassword==null || "".equals(tpassword)) {
			info.add("用户密码为空！！！");
		}
		
		if (info.size() == 0) {
			t = new Teacher();
			t.setTno(tno);
			t.setTpassword(tpassword);
			
			HttpSession session = req.getSession();
			
			try {
				boolean flag = DAOFactory.getITeacherDAOInstance().findLogin(t);
				if (flag) {
//					session.setAttribute("tno", tno);
//					session.setAttribute("tname", t.getTname());
					
					session.setAttribute("teacher", t);
					resp.sendRedirect("teacher");
					
//					System.out.println(t.getTname());

//					req.getRequestDispatcher("teacher").forward(req, resp);;
				}else{
					info.add("用户名或密码错误！！！");
					session.setAttribute("info", info);
					resp.sendRedirect("index.html");
					
//					req.getRequestDispatcher("index.html").forward(req, resp);
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
