package com.issuetracker.service;

import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.List;

import com.issuetracker.bean.Admin;
import com.issuetracker.bean.ModuleDetails;
import com.issuetracker.bean.ProjectDetails;
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
}
