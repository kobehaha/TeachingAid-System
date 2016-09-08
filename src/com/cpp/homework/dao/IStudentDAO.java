package com.cpp.homework.dao;

import java.sql.ResultSet;

import com.cpp.homework.vo.Student;
import com.cpp.homework.vo.TaskStudent;
import com.cpp.homework.vo.TaskTeacher;

/**
 * 定义一个接口，用于定义一些用于处理student表的方法
 * */
public interface IStudentDAO {

	/**
	 * 用户登录验证
	 * */
	public boolean findLogin(Student stu) throws Exception;

	/**
	 * 学生提交作业，将其插入到数据库
	 * */
	public boolean addFile(TaskStudent tStudent) throws Exception;
	
	/**
 	 * 查询出学生未完成的作业清单
 	 * */
 	public ResultSet showIncomplete(String sno) throws Exception;
 	/**
 	 * 查询出学生已完成的作业清单
 	 * */
 	public ResultSet showCompleted(String sno) throws Exception;
 	
 	/**
 	 * 判断是否被提醒交作业或修改作业
 	 * */
 	public boolean isCalled(Student stu) throws Exception;
 	/**
 	 * 查询成绩
 	 * */
 	public ResultSet showStudentGrade(Student stu) throws Exception;
 	
 	/**
 	 * 修改密码
 	 * */
 	public boolean alterPassword(Student stu) throws Exception;
}
