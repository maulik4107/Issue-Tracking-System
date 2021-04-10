package com.issuetracker.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.issuetracker.bean.Issue;
import com.issuetracker.bean.ModuleDetails;

public interface TesterDao {

	public List<ModuleDetails> getModuleDetails(Connection connection, int testerId) throws SQLException;

	public int saveIssueDetails(Connection connection, Issue issue)throws SQLException;

	public int UpdateIssueFoundStatus(Connection connection, int moduleId)throws SQLException;

	public List<Issue> getIssueDetails(Connection connection, int mid)throws SQLException;
	
	public String getModuleName(Connection connection,int moduleId)throws SQLException;
	
	public String getIssueStatusName(Connection connection,int statusId)throws SQLException;

	public List<Issue> getModuleDetailsProject(Connection connection, List<ModuleDetails> moduleIdList)throws SQLException;

	public Issue getIssueInfo(Connection connection, int id)throws SQLException;

	public int UpdateIssueInfo(Connection connection, Issue issue)throws SQLException;

	public int ChangeIssueInfo(Connection connection, Issue issue)throws SQLException;

	public List<Issue> getAssignedIssueDetails(Connection connection, int testerId)throws SQLException;

	public String changeToTestingCompleted(Connection connection, int moduleId)throws SQLException;

	public String updateModuleStatus(Connection connection,int moduleId)throws SQLException;

	public List<ModuleDetails> fetchModules(Connection connection, int userId)throws SQLException;
}
