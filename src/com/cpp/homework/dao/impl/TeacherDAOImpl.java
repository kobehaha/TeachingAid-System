package com.cpp.homework.dao.impl;

import java.security.interfaces.RSAKey;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.cpp.homework.dao.ITeacherDAO;
import com.cpp.homework.vo.CourseWare;
import com.cpp.homework.vo.Student;
import com.cpp.homework.vo.TaskGrade;
import com.cpp.homework.vo.TaskStudent;
import com.cpp.homework.vo.TaskTeacher;
import com.cpp.homework.vo.Teacher;

public class TeacherDAOImpl implements ITeacherDAO{

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	
	public TeacherDAOImpl(Connection conn) throws Exception{

		try {
			this.conn = conn;
		} catch (Exception e) {
			throw e;
		}
	}
	
	@Override
	public boolean findLogin(Teacher t) throws Exception {
		boolean flag = false;
		
		try {
			String sql = "SELECT tname FROM teacher WHERE tno=? AND tpassword=?";
			
			this.pstmt = this.conn.prepareStatement(sql);    //实例化pstmt
			this.pstmt.setString(1, t.getTno());
			this.pstmt.setString(2, t.getTpassword());
			
			ResultSet rs = this.pstmt.executeQuery();  //执行sql语句
			
			if (rs.next()) {
				t.setTname(rs.getString(1));
				flag = true;          //验证通过
			}
		} catch (Exception e) {
			throw e;
		}
		
		return flag;
	}
	
	@Override
	public boolean addFile(TaskTeacher teacher) throws Exception {
		boolean flag = false;
		
		
		try {
			String sql = "INSERT INTO task_teacher(task_name, task_date, task_url, tno) VALUES(?, ?, ?, ?)";
			this.pstmt = this.conn.prepareStatement(sql);
			
			this.pstmt.setString(1, teacher.getTask_name());
			this.pstmt.setDate(2, teacher.getTask_date());
			this.pstmt.setString(3, teacher.getTask_url());
			this.pstmt.setString(4, teacher.getTno());
			
			int n = this.pstmt.executeUpdate();
			if (n > 0) {
				flag = true;
			}
		} catch (Exception e) {
			throw e; 
		}
		return flag;
	}
	
	@Override
	public ResultSet showFile(TaskStudent student) throws Exception {
		ResultSet rs = null;
		try {
			String sql = "SELECT s.sno, s.sname, ts.hname, ts.hurl "
					+ "FROM task_student ts,student s "
					+ "WHERE ts.sno=s.sno";
			this.pstmt = this.conn.prepareStatement(sql);
			rs = this.pstmt.executeQuery();
		} catch (Exception e) {
			throw e;
		}
		
		return rs;
	}
	
	@Override
	public boolean addStudent(Student student) throws Exception {
		boolean flag = false;
		
		try {
			String sql = "INSERT INTO student"
					+ "(sno, sname, sage, ssex, sdept, sclass, spassword, scall, slate) "
					+ "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)";
			this.pstmt = this.conn.prepareStatement(sql);
			
			this.pstmt.setString(1, student.getSno());
			this.pstmt.setString(2, student.getSname());
			this.pstmt.setInt(3, student.getSage());
			this.pstmt.setString(4, student.getSsex());
			this.pstmt.setString(5, student.getSdept());
			this.pstmt.setInt(6, student.getSclass());
			this.pstmt.setString(7, student.getSpassword());
			this.pstmt.setInt(8, student.getScall());
			this.pstmt.setInt(9, student.getSlater());
			
			int n = this.pstmt.executeUpdate();
			
			if (n > 0) {
				flag = true;
			}
		} catch (Exception e) {
			throw e;
		}
		
		return flag;
	}
	
	@Override
	public boolean addTaskGrade(TaskGrade grade) throws Exception {
		boolean flag = false;
		
		try {
			String sql = "INSERT INTO task_grade(hgrade, sno) VALUES(?, ?)";
			
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setInt(1, grade.getHgrade());
			this.pstmt.setString(2, grade.getSno());
			
			int n = this.pstmt.executeUpdate();
			if (n > 0) {
				flag = true;
			}
		} catch (Exception e) {
			throw e;
		}
		return flag;
	}
	
	@Override
	public List<TaskGrade> showGrade() throws Exception {
		List<TaskGrade> arrayGrade = new ArrayList<TaskGrade>();
		
		try {
			String sql = "SELECT student.sno,hgrade, sname, student.slate FROM task_grade, student WHERE task_grade.sno=student.sno";
			
			this.pstmt = this.conn.prepareStatement(sql);
			ResultSet rs = this.pstmt.executeQuery();
			
			while(rs.next()){
				TaskGrade grade = new TaskGrade();
				grade.setSno(rs.getString(1));
				grade.setHgrade(rs.getInt(2));
				grade.setSname(rs.getString(3));
				grade.setSlate(rs.getInt(4));
				
				arrayGrade.add(grade);
			}
		} catch (Exception e) {
			throw e;
		}
		
		return arrayGrade;
	}
	
	@Override
	public List<Student> showStudent() throws Exception {
		List<Student> arrayStudent = new ArrayList<Student>();
		
		try {
			String sql = "SELECT sno, sname, ssex, sclass, sdept, slate FROM student";
			this.pstmt = this.conn.prepareStatement(sql);
			
			ResultSet rs = this.pstmt.executeQuery();
			while(rs.next()){
				Student stu = new Student();
				
				stu.setSno(rs.getString(1));
				stu.setSname(rs.getString(2));
				stu.setSsex(rs.getString(3));
				stu.setSclass(rs.getInt(4));
				stu.setSdept(rs.getString(5));
				stu.setSlater(rs.getInt(6));
				
				arrayStudent.add(stu);
			}
		} catch (Exception e) {
			throw e;
		}
		
		return arrayStudent;
	}
	
	@Override
	public List<CourseWare> showCourseWare() throws Exception {
		List<CourseWare> arrayCourseWare = new ArrayList<CourseWare>();
		
		try {
			String sql = "SELECT file_no, file_name, file_url, file_date, name FROM courseware";
			this.pstmt = this.conn.prepareStatement(sql);
			
			ResultSet rs = this.pstmt.executeQuery();
			while(rs.next()){
				CourseWare courseWare = new CourseWare();
				
				courseWare.setFileNo(rs.getString(1));
				courseWare.setFileName(rs.getString(2));
				courseWare.setFileUrl(rs.getString(3));
				courseWare.setFileDate(rs.getDate(4));
				courseWare.setName(rs.getString(5));
				
				arrayCourseWare.add(courseWare);
			}
		} catch (Exception e) {
			throw e;
		}
		
		return arrayCourseWare;
	}

	@Override
	public boolean addCourseWare(CourseWare courseWare) throws Exception {
		boolean flag = false;
		
		try {
			String sql = "INSERT INTO courseware(file_name, file_url, file_date, name) VALUE(?,?,?,?)";
			this.pstmt = this.conn.prepareStatement(sql);
			
			this.pstmt.setString(1, courseWare.getFileName());
			this.pstmt.setString(2, courseWare.getFileUrl());
			this.pstmt.setDate(3, courseWare.getFileDate());
			this.pstmt.setString(4, courseWare.getName());
			
			int n = this.pstmt.executeUpdate();
			
			if (n > 0) {
				flag = true;
			}
		} catch (Exception e) {
			throw e;
		}
		
		return flag;
	}
	
	@Override
	public void callTask(Student stu) throws Exception {
		try {
			String sql = "UPDATE student SET scall=? WHERE sno=?";
			
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setInt(1, stu.getScall());
			this.pstmt.setString(2, stu.getSno());
			
			this.pstmt.executeUpdate();
		} catch (Exception e) {
			throw e;
		}
	}
	
	@Override
	public void addStudentLate(String sno) throws Exception {
		try {
			String sql = "UPDATE student SET slate=slate+1 WHERE sno=?";
			this.pstmt = this.conn.prepareStatement(sql);
			
			this.pstmt.setString(1, sno);
			this.pstmt.executeUpdate();
		} catch (Exception e) {
			throw e;
		}
	}
}
