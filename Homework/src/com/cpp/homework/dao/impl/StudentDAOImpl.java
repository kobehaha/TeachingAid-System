package com.cpp.homework.dao.impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.cpp.homework.dao.IStudentDAO;
import com.cpp.homework.vo.Student;
import com.cpp.homework.vo.TaskStudent;
import com.cpp.homework.vo.TaskTeacher;
/**
 * DAO实现类，用于处理连接的数据表
 * */
public class StudentDAOImpl implements IStudentDAO{

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	
	public StudentDAOImpl(Connection conn) {
		this.conn = conn;
	}
	
	@Override
	public boolean findLogin(Student stu) throws Exception {
		
		boolean flag = false;         //作为用户名和密码是否正确的标志
		try {
			String sql = "SELECT sname,sage,ssex,sdept,sclass FROM student WHERE sno=? AND spassword=?";    //设置查询语句
			this.pstmt = conn.prepareStatement(sql);      //实例化PreparedStatement对象
			this.pstmt.setString(1, stu.getSno());   //设置学好sno
			this.pstmt.setString(2, stu.getSpassword());     //设置密码
			
			ResultSet rs = this.pstmt.executeQuery();   //取得查询结果
			if (rs.next()) {
				stu.setSname(rs.getString(1));       //取得学生姓名
				stu.setSage(Integer.parseInt(rs.getString(2)));
				stu.setSsex(rs.getString(3));
				stu.setSdept(rs.getString(4));
				stu.setSclass(rs.getInt(5));
				
				flag = true;                         //表示用户名密码合法，登录成功
			}
		} catch (Exception e) {
			throw e;
		}
		return flag;
	}
	
	@Override
	public boolean addFile(TaskStudent tStudent) throws Exception {
		boolean flag = false;
		
		try {
			String sql = "INSERT INTO task_student(hname, hurl, task_no, sno) VALUES(?,?,?,?)";
			this.pstmt = this.conn.prepareStatement(sql);
			
			this.pstmt.setString(1, tStudent.getHname());
			this.pstmt.setString(2, tStudent.getHurl());
			this.pstmt.setString(3, tStudent.getTask_no());
			this.pstmt.setString(4, tStudent.getSno());
			
			System.out.println(tStudent.getSno());
			if (this.pstmt.executeUpdate()>0) {
				flag = true;
			}       //执行SQL 语句
		} catch (Exception e) {
			throw e;
		}
		return flag;
	}
	
	@Override
	public ResultSet showIncomplete(String sno) throws Exception {
		ResultSet rs = null;
		
		try {
//			String sql = "SELECT tt.task_no , tt.task_name, tt.task_url, tt.task_date, t.tname "
//					+ "FROM teacher t, task_teacher tt WHERE t.tno=tt.tno AND tt.task_no in "
//					+ "(SELECT tt.task_no FROM task_student ts, task_teacher  "
//					+ "WHERE tt.task_no = ts.task_no AND ts.sno!=?)";
			
			String sql = "select tt.task_no, tt.task_name, tt.task_url, tt.task_date, t.tname "
					+ "from teacher t, task_teacher tt "
					+ "where t.tno=tt.tno and tt.task_no not in "
					+ "(select ts.task_no from task_student ts where ts.sno=?)";
			
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setString(1, sno);
			
			rs = this.pstmt.executeQuery();
		} catch (Exception e) {
			throw e;
		}
		
		return rs;
	}
	
	@Override
	public ResultSet showCompleted(String sno) throws Exception {
		ResultSet rs = null;
		
		try {
			String sql = "select tt.task_name, t.tname, ts.hname, ts.hurl, tt.task_url "
					+ "from teacher t, task_teacher tt, task_student ts "
					+ "where t.tno=tt.tno and tt.task_no=ts.task_no and ts.sno=?";
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setString(1, sno);
			
			rs = this.pstmt.executeQuery();
		} catch (Exception e) {
			throw e;
		}
		
		return rs;
	}
	
	@Override
	public boolean isCalled(Student stu) throws Exception {
		boolean flag = false;
		
		try {
			String sql = "SELECT scall FROM student WHERE sno=?";
			this.pstmt = this.conn.prepareStatement(sql);
			
			this.pstmt.setString(1, stu.getSno());
			ResultSet rs = this.pstmt.executeQuery();
			while(rs.next()){
				int n = rs.getInt(1);
				if (n >= 1) {
					flag = true;
				}
			}
		} catch (Exception e) {
			throw e;
		}
		
		return flag;
	}
	
	@Override
	public ResultSet showStudentGrade(Student stu) throws Exception {
		ResultSet rs = null;
		try {
			String sql = "select student.sno, sname, sclass, slate, hgrade "
					+ "from student, task_grade where student.sno=task_grade.sno and student.sno=?";
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setString(1, stu.getSno());
			
			rs = this.pstmt.executeQuery();
		} catch (Exception e) {
			throw e;
		}
		
		return rs;
	}
	
	@Override
	public boolean alterPassword(Student stu) throws Exception {
		boolean flag = false;
		
		try {
			String sql = "UPDATE student SET spassword=? WHERE sno=?";
			this.pstmt = this.conn.prepareStatement(sql);
			
			this.pstmt.setString(1, stu.getSpassword());
			this.pstmt.setString(2, stu.getSno());
			
			int n = this.pstmt.executeUpdate();
			if (n > 0) {
				flag = true;
			}
		} catch (Exception e) {
			throw e;
		}
		
		return flag;
	}
}
