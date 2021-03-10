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

}
