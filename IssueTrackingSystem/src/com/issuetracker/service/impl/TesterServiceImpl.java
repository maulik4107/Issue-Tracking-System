package com.issuetracker.service.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.issuetracker.bean.Issue;
import com.issuetracker.bean.ModuleDetails;
import com.issuetracker.dao.ProjectDao;
import com.issuetracker.dao.TesterDao;
import com.issuetracker.dao.impl.ProjectDaoImpl;
import com.issuetracker.dao.impl.TesterDaoImpl;
import com.issuetracker.service.TesterService;
import com.issuetracker.utill.CommonDriver;

public class TesterServiceImpl implements TesterService {

	TesterDao testerDao = new TesterDaoImpl();
	ProjectDao projectDao = new ProjectDaoImpl();

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
		} else {
			return "Issue Creation Failed !!";
		}
	}

	@Override
	public String changeModuleStatus(int moduleId) {
		// TODO Auto-generated method stub
		int updatedId = 0;
		try (Connection connection = CommonDriver.getConnection()) {
			updatedId = testerDao.UpdateIssueFoundStatus(connection, moduleId);

			if (updatedId > 0) {
				return "true";
			} else {
				return "false";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<Issue> getIssueDetails(int mid) {
		// TODO Auto-generated method stub
		try (Connection connection = CommonDriver.getConnection()) {
			return testerDao.getIssueDetails(connection, mid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<Issue> getIssueProjectWise(int pid) {
		// TODO Auto-generated method stub
		List<ModuleDetails> moduleIdList = new ArrayList<ModuleDetails>();

		List<Issue> issueList = new ArrayList<Issue>();

		try (Connection connection = CommonDriver.getConnection()) {
			moduleIdList = projectDao.getModuleID(connection, pid);
			issueList = testerDao.getModuleDetailsProject(connection, moduleIdList);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return issueList;
	}

	@Override
	public Issue getIssueInfo(int id) {
		try (Connection connection = CommonDriver.getConnection()) {

			return testerDao.getIssueInfo(connection, id);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public String UpdateIssueDetails(Issue issue) {

		int temp = 0;
		try (Connection connection = CommonDriver.getConnection()) {

			temp = testerDao.UpdateIssueInfo(connection, issue);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (temp > 0) {
			return "Issue Updated Successfully!!";
		} else {
			return "Issue Updation Failed !!";
		}
	}

	@Override
	public String UpdateIssueInfo(Issue issue) {
		int temp = 0;
		try (Connection connection = CommonDriver.getConnection()) {

			temp = testerDao.ChangeIssueInfo(connection, issue);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (temp > 0) {
			return "Issue Updated Successfully!!";
		} else {
			return "Issue Updation Failed !!";
		}

	}

	@Override
	public List<Issue> fetchAssignedIssueDetails(int testerId) {
		try (Connection connection = CommonDriver.getConnection()) {
			return testerDao.getAssignedIssueDetails(connection, testerId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public String changeStatusToTestingCompleted(int moduleId) {
		// TODO Auto-generated method stub
		try (Connection connection = CommonDriver.getConnection()) {
			return testerDao.changeToTestingCompleted(connection, moduleId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<ModuleDetails> fetchModules(int userId) {
		// TODO Auto-generated method stub
		try (Connection connection = CommonDriver.getConnection()) {
			return testerDao.fetchModules(connection, userId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public int getCurrentStatus(int moduleId) {
		try (Connection connection = CommonDriver.getConnection()) {
			return testerDao.fetchCurrentStatus(connection, moduleId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public List<ModuleDetails> fetchCreateModuleDetails(int testerId) {
		// TODO Auto-generated method stub
		System.out.println("Service Called");
		try (Connection connection = CommonDriver.getConnection()) {
			return testerDao.fetchCreateModulesDetails(connection, testerId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<Issue> getIssueStatus() {
		// TODO Auto-generated method stub
		try (Connection connection = CommonDriver.getConnection()) {
			return testerDao.fetchIssueStatus(connection);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public String changeIssueStatus(int id, int issueid) {
		// TODO Auto-generated method stub
		try (Connection connection = CommonDriver.getConnection()) {
			return testerDao.changeIssueStatus(connection,id,issueid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
