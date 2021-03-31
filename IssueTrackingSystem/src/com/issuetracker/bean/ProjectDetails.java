package com.issuetracker.bean;

import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;


public class ProjectDetails {
	
	private int projectId;
	private String projectName;
	private int pmId;
	private String pmName;
	private String projectDes;
	private String projectSd;
	private String projectEd;
	private int projectStatus;
	private String statusName;
	private InputStream documentStream;
	private String documentString;
	private int isActive;
	private int progress;
	
	public int getIsActive() {
		return isActive;
	}
	public void setIsActive(int isActive) {
		this.isActive = isActive;
	}
	public String getStatusName() {
		return statusName;
	}
	public void setStatusName(String statusName) {
		this.statusName = statusName;
	}
	public String getProjectDes() {
		return projectDes;
	}
	public void setProjectDes(String projectDes) {
		this.projectDes = projectDes;
	}
	public String getProjectSd() {
		return projectSd;
	}
	public void setProjectSd(String projectSd) {
		this.projectSd = projectSd;
	}
	public String getProjectEd() {
		return projectEd;
	}
	public void setProjectEd(String projectEd) {
		this.projectEd = projectEd;
	}
	public int getProjectStatus() {
		return projectStatus;
	}
	public void setProjectStatus(int projectStatus) {
		this.projectStatus = projectStatus;
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
	public int getPmId() {
		return pmId;
	}
	public void setPmId(int pmId) {
		this.pmId = pmId;
	}
	public String getPmName() {
		return pmName;
	}
	public void setPmName(String pmName) {
		this.pmName = pmName;
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
	public int getProgress() {
		return progress;
	}
	public void setProgress(int progress) {
		this.progress = progress;
	}

}
