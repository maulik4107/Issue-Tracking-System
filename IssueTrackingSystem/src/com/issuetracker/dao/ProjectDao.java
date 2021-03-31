package com.issuetracker.dao;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.issuetracker.bean.Admin;
import com.issuetracker.bean.ModuleDetails;
import com.issuetracker.bean.ProjectDetails;
import com.issuetracker.bean.Status;
import com.issuetracker.bean.User;

public interface ProjectDao {

	public int insertProjectDetails(Connection connection, Admin admin)throws SQLException;

	public List<ProjectDetails> fetchProjectDetails(Connection connection) throws SQLException;

	public List<ProjectDetails> fetchManagerDetails(Connection connection)throws SQLException;

	public int setManagerDetails(Connection connection, int pmId, int projectId)throws SQLException;

	public String getManagerName(Connection connection, int pmId)throws SQLException;

	public List<ProjectDetails> fetchProjectList(Connection connection)throws SQLException, IOException;

	public InputStream getPDF(Connection connection,int id)throws SQLException, IOException;

	public ProjectDetails getProjectName(Connection connection, int projectId, int pmId)throws SQLException;

	public ProjectDetails getProjectDetails(Connection connection, int pId)throws SQLException;
	
	public String getModuleStatusName(Connection connection, int moduleStatusId) throws SQLException;
	
	public String getProjectStatusName(Connection connection, int projectStatusId) throws SQLException;

	public List<ProjectDetails> getProjectStatus(Connection connection) throws SQLException;

	public int deleteProjectDetails(Connection connection, int projectId)throws SQLException;

	public int updateProjectDetails(Connection connection, ProjectDetails project)throws SQLException;

	public List<ProjectDetails> getAllocatedProjectList(Connection connection, int pid)throws SQLException;

	public int insertModuleDetails(Connection connection, ModuleDetails moduleDetails)throws SQLException;

	public List<ModuleDetails> getModuleDetails(Connection connection, int projectId)throws SQLException;

	public int saveModuleDetails(Connection connection, int pId, int moduleId, int developerId)throws SQLException;

	public List<User> getDevelopersDetails(Connection connection)throws SQLException;

	public List<User> getTestersDetails(Connection connection)throws SQLException;
	
	public String getProjectName(Connection connection, int projectId) throws SQLException;

	public String getDeveloperName(Connection connection,int developerId) throws SQLException;

	public List<ModuleDetails> getAllModulesDetails(Connection connection,int projectId)throws SQLException;

	public int deleteModuleDetails(Connection connection, int moduleId)throws SQLException;

	public ModuleDetails getModule(Connection connection, int moduleId)throws SQLException;
	
	public String getTesterName(Connection connection, int testerId) throws SQLException;

	public List<Status> getStatus(Connection connection) throws SQLException;

	public int updateModuleDetails(Connection connection, ModuleDetails module) throws SQLException;

	public List<ProjectDetails> fetchAllProject(Connection connection)throws SQLException;

	public List<ModuleDetails> fetchAllModuleDetails(int pid, Connection connection)throws SQLException;

	public int fetchPMId(Connection connection, int pid)throws SQLException;

	public int testermodule(Connection connection, int pId, int moduleId, int testerId)throws SQLException;

	public List<ModuleDetails> getReadyModuleDetails(Connection connection, int projectId)throws SQLException;

	public ModuleDetails fetchModuleDetails(Connection connection, int moduleId, int developerId)throws SQLException;

	public String getEmail(Connection connection,int userId)throws SQLException;

	public ModuleDetails fetchTesterModule(Connection connection, int moduleId, int testerId)throws SQLException;

	public List<Integer> getProjectDetails(Connection connection, int developerId, int isActive) throws SQLException;

	public List<ProjectDetails> getModuleProjectDetails(Connection connection, int pmId, List<Integer> projectIdList)throws SQLException;

	public List<Integer> getTesterProjectDetails(Connection connection, int isactive, int statusId)throws SQLException;

	public List<ModuleDetails> getModuleID(Connection connection, int pid)throws SQLException;

	public List<ProjectDetails> fetchAllProject(Connection connection, int pmid)throws SQLException;

	public String fetchDeveloperNameForIssue(Connection connection, int moduleId)throws SQLException;

	public String updateIssueDetails(Connection connection, int issueId, int statusId, int developerId, String issueImpact, String issuepriority)throws SQLException;

	public String updateManagerIssueStatus(Connection connection, int issueId, int statusId)throws SQLException;

	public String updateManagerCloseIssueStatus(Connection connection, int issueId, int statusId)throws SQLException;
}
