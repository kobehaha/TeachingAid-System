package com.cpp.homework.vo;

import java.sql.Date;

public class TaskTeacher {

	private String task_no;     //作业编号
	private String task_name;
	private Date task_date;         //老师上传作业时间
	private String task_url;        //存储老师上传作业的地址
	private String tno;               //上传作业的老师的编号
	
	public void setTask_no(String task_no) {
		this.task_no = task_no;
	}
	public String getTask_no() {
		return task_no;
	}
	
	public void setTask_name(String task_name) {
		this.task_name = task_name;
	}
	public String getTask_name() {
		return task_name;
	}
	
	public void setTask_date(Date task_date) {
		this.task_date = task_date;
	}
	public Date getTask_date() {
		return task_date;
	}
	
	public void setTask_url(String task_url) {
		this.task_url = task_url;
	}
	public String getTask_url() {
		return task_url;
	}
	
	public void setTno(String tno) {
		this.tno = tno;
	}
	public String getTno() {
		return tno;
	}
}