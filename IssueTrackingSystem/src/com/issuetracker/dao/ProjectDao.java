package com.issuetracker.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.issuetracker.bean.Admin;
import com.issuetracker.bean.ProjectDetails;

public interface ProjectDao {

	public int insertProjectDetails(Connection connection, Admin admin)throws SQLException;

	public List<ProjectDetails> fetchProjectDetails(Connection connection) throws SQLException;

	public List<ProjectDetails> fetchManagerDetails(Connection connection)throws SQLException;

	public int setManagerDetails(Connection connection, int pmId, int projectId)throws SQLException;

	public String getManagerName(Connection connection, int pmId)throws SQLException;

}
