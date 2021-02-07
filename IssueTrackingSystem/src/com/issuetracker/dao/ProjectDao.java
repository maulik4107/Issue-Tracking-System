package com.issuetracker.dao;

import java.io.IOException;
import java.io.InputStream;
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

	public List<ProjectDetails> fetchProjectList(Connection connection)throws SQLException, IOException;

	public InputStream getPDF(Connection connection,int id)throws SQLException, IOException;

	public ProjectDetails getProjectName(Connection connection, int projectId, int pmId)throws SQLException;

	public ProjectDetails getProjectDetails(Connection connection, int pId)throws SQLException;
	
	public String getStatusName(Connection connection, int int1) throws SQLException;

	public List<ProjectDetails> getProjectStatus(Connection connection) throws SQLException;

	public int deleteProjectDetails(Connection connection, int projectId)throws SQLException;

	public int updateProjectDetails(Connection connection, ProjectDetails project)throws SQLException;

}
