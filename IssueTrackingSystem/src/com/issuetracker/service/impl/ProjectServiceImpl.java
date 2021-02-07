package com.issuetracker.service.impl;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.issuetracker.bean.Admin;
import com.issuetracker.bean.ProjectDetails;
import com.issuetracker.dao.ProjectDao;
import com.issuetracker.dao.impl.ProjectDaoImpl;
import com.issuetracker.service.ProjectService;
import com.issuetracker.utill.CommonDriver;

public class ProjectServiceImpl implements ProjectService {
	
	ProjectDao projectDao=new ProjectDaoImpl();

	@Override
	public String saveProjectDetails(Admin admin) throws SQLException {
		
		int insertedId=0;
		try(Connection connection=CommonDriver.getConnection())
		{
			insertedId=projectDao.insertProjectDetails(connection,admin);
		    if(insertedId>0)
		    {
		    	return "Project Created Successfully!!";
		    }
		    else
		    {
		    	return "Project Creation Failed !!!";
		    }
		}
	}

	@Override
	public List<ProjectDetails> getProjectDetails() throws SQLException {
		
		try(Connection connection=CommonDriver.getConnection())
		{
			return projectDao.fetchProjectDetails(connection);
		}
	}

	@Override
	public List<ProjectDetails> getManagerDetails() throws SQLException {
		try(Connection connection=CommonDriver.getConnection())
		{
			return projectDao.fetchManagerDetails(connection);
		}
	}

	@Override
	public String saveManagerDetail(int pmId,int projectId) throws SQLException {
		int updatedId=0;
		String pName=null;
		
		try(Connection connection=CommonDriver.getConnection())
		{
			updatedId=projectDao.setManagerDetails(connection,pmId,projectId);
			pName=projectDao.getManagerName(connection,pmId);
		}
		if(updatedId>0)
		{
			return " Project Allocated to "+ pName +" Successfull !!";
		}
		else
		{
			return " Project Allocation Failed";
		}
	}

	@Override
	public List<ProjectDetails> getProjectList() throws SQLException, IOException {
		try(Connection connection=CommonDriver.getConnection())
		{
			return projectDao.fetchProjectList(connection);
		}
	}

	@Override
	public InputStream getPDf(int id) throws SQLException, IOException {
		try(Connection connection=CommonDriver.getConnection())
		{
			return projectDao.getPDF(connection, id);
		}
		
	}

	@Override
	public ProjectDetails getProjectName(int projectId, int pmId) throws SQLException {
		try(Connection connection=CommonDriver.getConnection())
		{
			return projectDao.getProjectName(connection,projectId,pmId);
		}
	}

	@Override
	public ProjectDetails selectProjectDetails(int pId) {
		// TODO Auto-generated method stub
		try(Connection connection=CommonDriver.getConnection())
		{
			return projectDao.getProjectDetails(connection,pId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<ProjectDetails> getStatus() {
		// TODO Auto-generated method stub
		try(Connection connection=CommonDriver.getConnection())
		{
			return projectDao.getProjectStatus(connection);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public String removeProjectDetails(int projectId) {
		// TODO Auto-generated method stub
		int deletedId = 0;
		
		try(Connection connection=CommonDriver.getConnection())
		{
			deletedId = projectDao.deleteProjectDetails(connection,projectId);
			
			if(deletedId>0)
			{
				return "Project Deleted Successfully!!!!!";
			}
			else
			{
				return "Soryy!!! Project Not Deleted";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public String setProjectDetails(ProjectDetails project) {
		// TODO Auto-generated method stub
		int updatedId = 0;
		try(Connection connection=CommonDriver.getConnection())
		{
			updatedId = projectDao.updateProjectDetails(connection,project);
			
			if(updatedId>0)
			{
				System.out.println("Project Updated Success");
				return "Project Updated Successfully!!!!!";
			}
			else
			{
				System.out.println("Project not upated");
				return "Soryy!!! Project Not Updated..";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		
	}
}
