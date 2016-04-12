package com.cpp.homework.vo;

import org.apache.tomcat.util.descriptor.web.ServletDef;

public class Student {

	private String sno;
	private String sname;
	private int sage;
	private String ssex;
	private int sclass;
	private String sdept;
	private String spassword;
	private int scall;
	private int slater;
	
	
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
	
	public void setSage(int sage) {
		this.sage = sage;
	}
	public int getSage() {
		return sage;
	}
	
	public void setSsex(String ssex) {
		this.ssex = ssex;
	}
	public String getSsex() {
		return ssex;
	}
	
	public void setSclass(int sclass) {
		this.sclass = sclass;
	}
	public int getSclass() {
		return sclass;
	}
	
	public void setSdept(String sdept) {
		this.sdept = sdept;
	}
	public String getSdept() {
		return sdept;
	}
	
	public void setSpassword(String spassword) {
		this.spassword = spassword;
	}
	public String getSpassword() {
		return spassword;
	}
	
	public void setScall(int scall) {
		this.scall = scall;
	}
	public int getScall() {
		return scall;
	}
	
	public void setSlater(int slater) {
		this.slater = slater;
	}
	public int getSlater() {
		return slater;
	}
}
