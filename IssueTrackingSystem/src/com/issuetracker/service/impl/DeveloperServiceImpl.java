package com.issuetracker.service.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.issuetracker.bean.Issue;
import com.issuetracker.bean.ModuleDetails;
import com.issuetracker.dao.DeveloperDao;
import com.issuetracker.dao.impl.DeveloperDaoImpl;
import com.issuetracker.service.DeveloperService;
import com.issuetracker.utill.CommonDriver;

public class DeveloperServiceImpl implements DeveloperService {
	
	DeveloperDao developerDao = new DeveloperDaoImpl();

	@Override
	public List<ModuleDetails> fetchModuleDetails(int developerId) {
		// TODO Auto-generated method stub
		try(Connection connection= CommonDriver.getConnection())
		{
			return developerDao.getModuleDetails(connection,developerId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public String setModuleStatus(int moduleId) {
		// TODO Auto-generated method stub
		int updatedId = 0;
		try(Connection connection= CommonDriver.getConnection())
		{
			updatedId = developerDao.updateModuleStatus(connection,moduleId);
			
			if(updatedId > 0)
			{
				return "Module Status is Updated Successfully!!!!!";
			}
			else
			{
				return "Module Status is Not Updated Successfully..";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<Issue> fetchAssignedIssueDetails(int developerId) {
		// TODO Auto-generated method stub
		try(Connection connection= CommonDriver.getConnection())
		{
			return developerDao.getAssignedIssueDetails(connection,developerId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
