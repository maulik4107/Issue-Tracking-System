package com.issuetracker.service;

import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.List;

import com.issuetracker.bean.Admin;
import com.issuetracker.bean.Issue;
import com.issuetracker.bean.ModuleDetails;
import com.issuetracker.bean.ProjectDetails;
import com.issuetracker.bean.Status;
import com.issuetracker.bean.User;

public interface ProjectService {

	public String saveProjectDetails(Admin admin) throws SQLException;

	public List<ProjectDetails> getProjectDetails() throws SQLException;

	public List<ProjectDetails> getManagerDetails()throws SQLException;

	public String saveManagerDetail(int pmId, int projectId)throws SQLException;

	public List<ProjectDetails> getProjectList()throws SQLException, IOException;

	public InputStream getPDf(int id)throws SQLException, IOException;

	public ProjectDetails getProjectName(int projectId, int pmId)throws SQLException;

	public ProjectDetails selectProjectDetails(int pId);

	public List<ProjectDetails> getStatus();

	public String removeProjectDetails(int projectId);

	public String setProjectDetails(ProjectDetails project);

	public List<ProjectDetails> getProjectList(int pid);

	public String saveModuleDetails(ModuleDetails moduleDetails);

	public List<ModuleDetails> fetchModuleDetails(int projectId);

	public String saveModuleDetails(int pId, int moduleId, int developerId);

	public List<User> fetchDevelopersDetails();

	public List<User> fetchTestersDetails();

	public List<ModuleDetails> fetchAllModulesDetails(int projectId);

	public String removeModuleDetails(int moduleId);

	public ModuleDetails fetchModule(int moduleId);

	public List<Status> fetchStatus();

	public String editModuleDetails(ModuleDetails module);

	public List<ProjectDetails> getAllProjectDetails();

	public List<ModuleDetails> getAllModuleDetails(int pid);

	public int getProjectManagerId(int pid);

	public String allocateTesterModule(int pId, int moduleId, int testerId);

	public List<ModuleDetails> fetchReadyModules(int projectId);

	public ModuleDetails getModuleDetails(int moduleId, int developerId);

	public ModuleDetails getTesterModuleDetails(int moduleId, int testerId);

	public List<ProjectDetails> getProjectList(int pmId,int developerId, int isActive);

	public List<ProjectDetails> getTesterProjectsList(int pid, int isactive, int statusId);

	public List<ProjectDetails> getPMProjects(int pmid);

	public String getDeveloperName(int moduleId);

	public String saveIssueDetails(int issueId, int statusId, int developerId, String issueImpact,
			String issuepriority);

	public String saveIssueDetails(int issueId, int statusId);

	public String saveCloseIssueDetails(int issueId, int statusId);

	public int changeModuleStatus(int moduleId);
	
	public String getManagerName(int moduleId);

	public List<Issue> getMyIssues(int userId);

	public String getTesterName(int userId);

	public List<Issue> getMyIssuesTester(int userId);

	public String fetchDeveloperName(int userId);
}
