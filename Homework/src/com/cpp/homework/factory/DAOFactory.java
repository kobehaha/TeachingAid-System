package com.cpp.homework.factory;

import com.cpp.homework.dao.IStudentDAO;
import com.cpp.homework.dao.ITeacherDAO;
import com.cpp.homework.dao.proxy.StudentDAOProxy;
import com.cpp.homework.dao.proxy.TeacherDAOProxy;

public class DAOFactory {

	public static IStudentDAO getIStudentDAOInstance()
	{
		return new StudentDAOProxy();
	}
	public static ITeacherDAO getITeacherDAOInstance()
	{
		return new TeacherDAOProxy();
	}
}
