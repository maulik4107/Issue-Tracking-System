package com.issuetracker.service;

import java.util.List;

import com.issuetracker.bean.Issue;
import com.issuetracker.bean.ModuleDetails;

public interface TesterService {

	public List<ModuleDetails> fetchModuleDetails(int testerId);

	public String insertIssueDetails(Issue issue);

	public String changeModuleStatus(int moduleId);
	
	public List<Issue> getIssueDetails(int mid);

	public List<Issue> getIssueProjectWise(int pid);

	public Issue getIssueInfo(int id);

	public String UpdateIssueDetails(Issue issue);

	public String UpdateIssueInfo(Issue issue);

	public List<Issue> fetchAssignedIssueDetails(int testerId);

}
