package com.cpp.homework.dao;

import java.sql.ResultSet;
import java.util.List;

import com.cpp.homework.vo.CourseWare;
import com.cpp.homework.vo.Student;
import com.cpp.homework.vo.TaskGrade;
import com.cpp.homework.vo.TaskStudent;
import com.cpp.homework.vo.TaskTeacher;
import com.cpp.homework.vo.Teacher;

/**
 * 定义一个接口，用于定义一些用于处理student表的方法
 * */
public interface ITeacherDAO {

	public boolean findLogin(Teacher t) throws Exception;
	
	/**
	 * 老师布置作业，将其插入到数据库
	 * */
	public boolean addFile(TaskTeacher teacher) throws Exception;
	
	/**
	 * 提取出学生提交的作业，以供下载
	 * */
	public ResultSet showFile(TaskStudent student) throws Exception;
	
	/**
	 * 从excel中带入所带学生名单
	 * */
 	public boolean addStudent(Student student) throws Exception;
 	
 	/**
 	 * 给学生的作业评分（A到D）
 	 * */
 	public boolean addTaskGrade(TaskGrade grade) throws Exception;
 	
 	/**
 	 * 显示学生的成绩
 	 * */
 	public List<TaskGrade> showGrade() throws Exception;
 	
 	/**
 	 * 显示学生的基本信息
 	 * */
 	public List<Student> showStudent() throws Exception;
 	
 	/**
 	 * 显示一上传的课件
 	 * */
 	public List<CourseWare> showCourseWare() throws Exception;
 	
 	/**
 	 * 添加可见资料
 	 * */
 	public boolean addCourseWare(CourseWare courseWare) throws Exception;
 	
 	/**
 	 * 提醒学生提交作业
 	 * */
 	public void callTask(Student stu) throws Exception;
 	
 	/**
 	 * 处理学生旷到的情况
 	 * */
 	public void addStudentLate(String sno) throws Exception;
}
