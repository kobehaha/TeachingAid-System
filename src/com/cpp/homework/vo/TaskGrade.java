package com.cpp.homework.vo;

public class TaskGrade {

	private int hgrade;   //作业完成等级，（A-D）
	private String sno;      //对应某个学生
	private String sname;
	private int slate;
	
	public void setHgrade(int hgrade) {
		this.hgrade = hgrade;
	}
	public int getHgrade() {
		return hgrade;
	}
	
	public void setSno(String sno) {
		this.sno = sno;
	}
	public String getSno() {
		return sno;
	}
	
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getSname() {
		return sname;
	}

	public void setSlate(int slate) {
		this.slate = slate;
	}
	public int getSlate() {
		return slate;
	}
}
