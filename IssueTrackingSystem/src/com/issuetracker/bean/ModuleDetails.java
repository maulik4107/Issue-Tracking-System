package com.issuetracker.bean;

public class ModuleDetails {
	
	private int moduleId;
	private String moduleName;
	private String moduleSd;
	private String moduleEd;
	private String moduleDes;
	private int projectId;
	private String projectName;
	private int statusId;
	private String statusName;
	private int developerId;
	private int testerId;
	private int is_active;
	private String developerName;
	
	public int getModuleId() {
		return moduleId;
	}
	public void setModuleId(int moduleId) {
		this.moduleId = moduleId;
	}
	public String getModuleName() {
		return moduleName;
	}
	public void setModuleName(String moduleName) {
		this.moduleName = moduleName;
	}
	public String getModuleSd() {
		return moduleSd;
	}
	public void setModuleSd(String moduleSd) {
		this.moduleSd = moduleSd;
	}
	public String getModuleEd() {
		return moduleEd;
	}
	public void setModuleEd(String moduleEd) {
		this.moduleEd = moduleEd;
	}
	public String getModuleDes() {
		return moduleDes;
	}
	public void setModuleDes(String moduleDes) {
		this.moduleDes = moduleDes;
	}
	public int getProjectId() {
		return projectId;
	}
	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}
	public int getStatusId() {
		return statusId;
	}
	public void setStatusId(int statusId) {
		this.statusId = statusId;
	}
	public int getDeveloperId() {
		return developerId;
	}
	public void setDeveloperId(int developerId) {
		this.developerId = developerId;
	}
	public int getTesterId() {
		return testerId;
	}
	public void setTesterId(int testerId) {
		this.testerId = testerId;
	}
	public int getIs_active() {
		return is_active;
	}
	public void setIs_active(int is_active) {
		this.is_active = is_active;
	}
	public String getStatusName() {
		return statusName;
	}
	public void setStatusName(String statusName) {
		this.statusName = statusName;
	}
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	public String getDeveloperName() {
		return developerName;
	}
	public void setDeveloperName(String developerName) {
		this.developerName = developerName;
	}
	
}
