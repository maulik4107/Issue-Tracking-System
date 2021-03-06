package com.issuetracker.service.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.issuetracker.bean.Issue;
import com.issuetracker.bean.ModuleDetails;
import com.issuetracker.dao.TesterDao;
import com.issuetracker.dao.impl.TesterDaoImpl;
import com.issuetracker.service.TesterService;
import com.issuetracker.utill.CommonDriver;

public class TesterServiceImpl implements TesterService {

	TesterDao testerDao = new TesterDaoImpl();

	@Override
	public List<ModuleDetails> fetchModuleDetails(int testerId) {
		// TODO Auto-generated method stub
		try (Connection connection = CommonDriver.getConnection()) {
			return testerDao.getModuleDetails(connection, testerId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public String insertIssueDetails(Issue issue) {
		// TODO Auto-generated method stub
		int i = 0;
		try (Connection connection = CommonDriver.getConnection()) {
			i = testerDao.saveIssueDetails(connection, issue);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (i > 0) {
			return "Issue Created Successfully !!";
		}
		else {
			return "Issue Creation Failed !!";
		}
	}

}
