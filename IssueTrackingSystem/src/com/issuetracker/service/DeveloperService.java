package com.issuetracker.service;

import java.util.List;

import com.issuetracker.bean.Issue;
import com.issuetracker.bean.ModuleDetails;

public interface DeveloperService {

	public List<ModuleDetails> fetchModuleDetails(int developerId);

	public String setModuleStatus(int moduleId);

	public List<Issue> fetchAssignedIssueDetails(int developerId);

}
