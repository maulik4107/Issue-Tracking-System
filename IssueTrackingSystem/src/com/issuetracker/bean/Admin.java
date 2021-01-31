package com.issuetracker.bean;

import java.io.InputStream;

public class Admin {
	
	private int projectId;
	private String projectName;
	private InputStream documentStream;
	private String documentString;
	private String startingDate;
	private String endingDate;
	private String description;
	private int pmId;
	private int statusId;
	
	public int getPmId() {
		return pmId;
	}
	public void setPmId(int pmId) {
		this.pmId = pmId;
	}
	public int getStatusId() {
		return statusId;
	}
	public void setStatusId(int statusId) {
		this.statusId = statusId;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getProjectId() {
		return projectId;
	}
	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	public InputStream getDocumentStream() {
		return documentStream;
	}
	public void setDocumentStream(InputStream documentStream) {
		this.documentStream = documentStream;
	}
	public String getDocumentString() {
		return documentString;
	}
	public void setDocumentString(String documentString) {
		this.documentString = documentString;
	}
	public String getStartingDate() {
		return startingDate;
	}
	public void setStartingDate(String startingDate) {
		this.startingDate = startingDate;
	}
	public String getEndingDate() {
		return endingDate;
	}
	public void setEndingDate(String endingDate) {
		this.endingDate = endingDate;
	}
	
}
