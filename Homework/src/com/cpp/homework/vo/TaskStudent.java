package com.cpp.homework.vo;

public class TaskStudent {

	private String hno;        //学生提交作业的编号
	private String hname;    //学生提交的作业名称
	private String hurl;     //存储学生提交作业的路径
	private String task_no;       //存储这个作业对应的老师上传的作业编号
	private String sno;        //对应学生编号
	
	public void setHno(String hno) {
		this.hno = hno;
	}
	public String getHno() {
		return hno;
	}
	
	public void setHname(String hname) {
		this.hname = hname;
	}
	public String getHname() {
		return hname;
	}
	
	public void setHurl(String hurl) {
		this.hurl = hurl;
	}
	public String getHurl() {
		return hurl;
	}
	
	public void setTask_no(String task_no) {
		this.task_no = task_no;
	}
	public String getTask_no() {
		return task_no;
	}
	
	public void setSno(String sno) {
		this.sno = sno;
	}
	public String getSno() {
		return sno;
	}
}
