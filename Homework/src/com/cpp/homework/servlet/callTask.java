package com.cpp.homework.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cpp.homework.factory.DAOFactory;
import com.cpp.homework.vo.Student;

public class callTask extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		String sno = req.getParameter("sno");
		Student stu = new Student();
		stu.setSno(sno);
		stu.setScall(1);
		
		try {
			DAOFactory.getITeacherDAOInstance().callTask(stu);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doGet(req, resp);
	}
}
