package com.cpp.homework.vo;

import java.sql.Date;

public class CourseWare {

	/**
	 * file_no int(11) primary key,
	file_name varchar(100),
	file_url varchar(300),
	file_date date,
	name varchar(45)
	 * */
	private String fileNo;
	private String fileName;
	private String fileUrl;
	private Date fileDate;
	private String name;         //表示上传人的名字
	
	
	public void setFileNo(String fileNo) {
		this.fileNo = fileNo;
	}
	public String getFileNo() {
		return fileNo;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	public String getName() {
		return name;
	}
	
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFileName() {
		return fileName;
	}
	
	public void setFileUrl(String fileUrl) {
		this.fileUrl = fileUrl;
	}
	public String getFileUrl() {
		return fileUrl;
	}
	
	public void setFileDate(Date fileDate) {
		this.fileDate = fileDate;
	}
	public Date getFileDate() {
		return fileDate;
	}
}
