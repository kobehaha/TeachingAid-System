package com.cpp.homework.dao.proxy;

import java.sql.ResultSet;

import com.cpp.homework.dao.IStudentDAO;
import com.cpp.homework.dao.impl.StudentDAOImpl;
import com.cpp.homework.dbc.DatabaseConnection;
import com.cpp.homework.vo.Student;
import com.cpp.homework.vo.TaskStudent;
import com.cpp.homework.vo.TaskTeacher;

/**
 * 定义DAO 代理类，用于获取数据库连接，并处理链接请求的关闭等操作，
 * 具体实现需调用DAO实现类对象
 * */
public class StudentDAOProxy implements IStudentDAO{

	private DatabaseConnection dbc = null;
	private IStudentDAO dao = null;
	
	public StudentDAOProxy() {
		try {
			this.dbc = new DatabaseConnection();             //创建数据库连接
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		this.dao = new StudentDAOImpl(this.dbc.getConnection());        //实例化StudentDAOImpl对象
	}
	
	@Override
	public boolean findLogin(Student stu) throws Exception {
		
		boolean flag = false;
		try {
			flag = this.dao.findLogin(stu);
		} catch (Exception e) {
			throw e;
		}finally {
			this.dbc.close();
		}
		return flag;
	}
	
	@Override
	public boolean addFile(TaskStudent tStudent) throws Exception {
		boolean flag = false;
		try {
			flag = this.dao.addFile(tStudent);
		} catch (Exception e) {
			throw e;
		}finally {
			this.dbc.close();
		}
		return flag;
	}
	
	@Override
	public ResultSet showIncomplete(String sno) throws Exception {
		ResultSet rs = null;
		try {
			rs = this.dao.showIncomplete(sno);
		} catch (Exception e) {
			throw e;
		}
		
		return rs;
	}
	
	@Override
	public ResultSet showCompleted(String sno) throws Exception {
		ResultSet rs = null;
		try {
			rs = this.dao.showCompleted(sno);
		} catch (Exception e) {
			throw e;
		}
		
		return rs;
	}
	
	@Override
	public boolean isCalled(Student stu) throws Exception {
		boolean flag = false;
		try {
			flag = this.dao.isCalled(stu);
		} catch (Exception e) {
			throw e;
		}
		
		return flag;
	}
	
	@Override
	public ResultSet showStudentGrade(Student stu) throws Exception {
		
		ResultSet rs = null;
		try {
			rs = this.dao.showStudentGrade(stu);
		} catch (Exception e) {
			throw e;
		}
		
		return rs;
	}
	
	@Override
	public boolean alterPassword(Student stu) throws Exception {
		boolean flag = false;
		
		try {
			flag = this.dao.alterPassword(stu);
		} catch (Exception e) {
			throw e;
		}
		
		return flag;
	}
}
