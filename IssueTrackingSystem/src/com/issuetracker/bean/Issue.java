package com.issuetracker.bean;

import java.io.InputStream;
import java.util.List;

public class Issue {
	
	private int issueId;
	private String issueName;
	private String issueDes;
	private String issueImpact;
	private String issuePriority;
	private InputStream documentStream;
	private String documentString;
	private String issueCreatedDate;
	private String issueCloseDate;
	private int issueStatusId;
	private String issueStatusName;
	private int developerId;
	private String developerName;
	private int testerId;
	private String testerName;
	private int moduleId;
	private String moduleName;
	private int progress;
	private List<IssueStatus> issueStatusBean;
	
	public int getIssueId() {
		return issueId;
	}
	public void setIssueId(int issueId) {
		this.issueId = issueId;
	}
	public String getIssueName() {
		return issueName;
	}
	public void setIssueName(String issueName) {
		this.issueName = issueName;
	}
	public String getIssueDes() {
		return issueDes;
	}
	public void setIssueDes(String issueDes) {
		this.issueDes = issueDes;
	}
	public String getIssueImpact() {
		return issueImpact;
	}
	public void setIssueImpact(String issueImpact) {
		this.issueImpact = issueImpact;
	}
	public String getIssuePriority() {
		return issuePriority;
	}
	public void setIssuePriority(String issuePriority) {
		this.issuePriority = issuePriority;
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
	public String getIssueCreatedDate() {
		return issueCreatedDate;
	}
	public void setIssueCreatedDate(String issueCreatedDate) {
		this.issueCreatedDate = issueCreatedDate;
	}
	public String getIssueCloseDate() {
		return issueCloseDate;
	}
	public void setIssueCloseDate(String issueCloseDate) {
		this.issueCloseDate = issueCloseDate;
	}
	public int getIssueStatusId() {
		return issueStatusId;
	}
	public void setIssueStatusId(int issueStatusId) {
		this.issueStatusId = issueStatusId;
	}
	public String getIssueStatusName() {
		return issueStatusName;
	}
	public void setIssueStatusName(String issueStatusName) {
		this.issueStatusName = issueStatusName;
	}
	public int getDeveloperId() {
		return developerId;
	}
	public void setDeveloperId(int developerId) {
		this.developerId = developerId;
	}
	public String getDeveloperName() {
		return developerName;
	}
	public void setDeveloperName(String developerName) {
		this.developerName = developerName;
	}
	public int getTesterId() {
		return testerId;
	}
	public void setTesterId(int testerId) {
		this.testerId = testerId;
	}
	public String getTesterName() {
		return testerName;
	}
	public void setTesterName(String testerName) {
		this.testerName = testerName;
	}
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
	public List<IssueStatus> getIssueStatusBean() {
		return issueStatusBean;
	}
	public void setIssueStatusBean(List<IssueStatus> issueStatusBean) {
		this.issueStatusBean = issueStatusBean;
	}
	public int getProgress() {
		return progress;
	}
	public void setProgress(int progress) {
		this.progress = progress;
	}

}
