package com.cpp.homework.vo;

public class Course {

	private String cno;
	private String cname;
	private String sno;           //标志学生编号
	private String tno;           //标志老师编号
	private int week;           //用一到七表示周一到周天
	private int time;           //用1-6分别标志一到十二节课
	
	public void setCno(String cno) {
		this.cno = cno;
	}
	public String getCno() {
		return cno;
	}
	
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getCname() {
		return cname;
	}
	
	public void setSno(String sno) {
		this.sno = sno;
	}
	public String getSno() {
		return sno;
	}
	
	public void setTno(String tno) {
		this.tno = tno;
	}
	public String getTno() {
		return tno;
	}
	
	public void setWeek(int week) {
		this.week = week;
	}
	public int getWeek() {
		return week;
	}
	
	public void setTime(int time) {
		this.time = time;
	}
	public int getTime() {
		return time;
	}
}
