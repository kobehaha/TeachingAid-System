package com.cpp.homework.dao.proxy;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.cpp.homework.dao.ITeacherDAO;
import com.cpp.homework.dao.impl.TeacherDAOImpl;
import com.cpp.homework.dbc.DatabaseConnection;
import com.cpp.homework.vo.CourseWare;
import com.cpp.homework.vo.Student;
import com.cpp.homework.vo.TaskGrade;
import com.cpp.homework.vo.TaskStudent;
import com.cpp.homework.vo.TaskTeacher;
import com.cpp.homework.vo.Teacher;

public class TeacherDAOProxy implements ITeacherDAO{

	private DatabaseConnection dbc = null;
	private ITeacherDAO dao = null;
	
	public TeacherDAOProxy(){
		try {
			this.dbc = new DatabaseConnection();
			this.dao = new TeacherDAOImpl(this.dbc.getConnection());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public boolean findLogin(Teacher t) throws Exception {
		
		boolean flag = false;
		try {
			flag = this.dao.findLogin(t);
		} catch (Exception e) {
			throw e;
		}
		
		return flag;
	}
	
	@Override
	public boolean addFile(TaskTeacher teacher) throws Exception {

		boolean flag = false;
		try {
			flag = this.dao.addFile(teacher);
		} catch (Exception e) {
			throw e;
		}
		
		return flag;
	}
	
	
	@Override
	public ResultSet showFile(TaskStudent student) throws Exception {
		ResultSet rs = null;
		try {
			rs = this.dao.showFile(student);
		} catch (Exception e) {
			throw e;
		}
		
		return rs;
	}
	
	@Override
	public boolean addStudent(Student student) throws Exception {
		boolean flag = false;
		
		try{
			flag = this.dao.addStudent(student);
		}catch(Exception e){
			throw e;
		}
		
		return flag;
	}
	
	public void close() throws Exception
	{
		if (dbc != null) {
			try {
				dbc.close();
			} catch (Exception e) {
				throw e;
			}
		}
	}
	
	@Override
	public boolean addTaskGrade(TaskGrade grade) throws Exception {
		boolean flag = false;
		
		try {
			flag = this.dao.addTaskGrade(grade);
		} catch (Exception e) {
			throw e;
		}
		
		return flag;
	}
	
	@Override
	public List<TaskGrade> showGrade() throws Exception {
		List<TaskGrade> arrayGrade = null;
		
		try {
			arrayGrade = (ArrayList<TaskGrade>) this.dao.showGrade();
		} catch (Exception e) {
			throw e;
		}
		
		return arrayGrade;
	}
	
	@Override
	public List<Student> showStudent() throws Exception {
		List<Student> arrayStudent = null;
		
		try {
			arrayStudent = this.dao.showStudent();
		} catch (Exception e) {
			throw e;
		}
		
		return arrayStudent;
	}
	
	@Override
	public List<CourseWare> showCourseWare() throws Exception {
		List<CourseWare> arrayCourseWare = null;
		
		try {
			arrayCourseWare = this.dao.showCourseWare();
		} catch (Exception e) {
			throw e;
		}
		
		return arrayCourseWare;
	}
	
	@Override
	public boolean addCourseWare(CourseWare courseWare) throws Exception {
		boolean flag = false;
		
		try {
			flag = this.dao.addCourseWare(courseWare);
		} catch (Exception e) {
			throw e;
		}
		
		return flag;
	}
	
	@Override
	public void callTask(Student stu) throws Exception {
		try {
			this.dao.callTask(stu);
		} catch (Exception e) {
			throw e;
		}
	}
	
	@Override
	public void addStudentLate(String sno) throws Exception {
		try {
			this.dao.addStudentLate(sno);
		} catch (Exception e) {
			throw e;
		}
	}
}
