package com.issuetracker.service.impl;

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
}
