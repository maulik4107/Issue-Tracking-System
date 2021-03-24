package com.issuetracker.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import com.issuetracker.bean.Issue;
import com.issuetracker.bean.IssueStatus;
import com.issuetracker.bean.ModuleDetails;
import com.issuetracker.dao.DeveloperDao;
import com.issuetracker.dao.ProjectDao;
import com.issuetracker.dao.TesterDao;

public class DeveloperDaoImpl implements DeveloperDao {

	ProjectDao projectDao = new ProjectDaoImpl();
	TesterDao testerDao = new TesterDaoImpl();

	@Override
	public List<ModuleDetails> getModuleDetails(Connection connection, int developerId) throws SQLException {
		// TODO Auto-generated method stub
		List<ModuleDetails> moduleList = new ArrayList<ModuleDetails>();
		try (PreparedStatement ps = connection.prepareStatement("select * from module_table where i_developer_id=?")) {
			ps.setInt(1, developerId);
			ResultSet resultSet = ps.executeQuery();

			while (resultSet.next()) {
				ModuleDetails module = new ModuleDetails();

				module.setModuleId(resultSet.getInt(1));
				module.setModuleName(resultSet.getString(2));
				module.setModuleDes(resultSet.getString(3));
				module.setModuleSd(resultSet.getString(4));
				module.setModuleEd(resultSet.getString(5));
				module.setStatusId(resultSet.getInt(6));
				module.setProjectId(resultSet.getInt(7));
				module.setDeveloperId(resultSet.getInt(8));
//				module.setTesterId(resultSet.getInt(9));

				module.setStatusName(projectDao.getModuleStatusName(connection,resultSet.getInt(6)));
				module.setProjectName(projectDao.getProjectName(connection, module.getProjectId()));
				module.setDeveloperName(projectDao.getDeveloperName(connection, resultSet.getInt(8)));
//				module.setTesterName(projectDao.getTesterName(connection,resultSet.getInt(9)));

				moduleList.add(module);
			}
			resultSet.close();
		}
		return moduleList;
	}

	@Override
	public int updateModuleStatus(Connection connection, int moduleId) throws SQLException {
		// TODO Auto-generated method stub
		try (PreparedStatement ps = connection
				.prepareStatement("update module_table set i_status_id=? where i_module_id=?")) {
			ps.setInt(1, 3);
			ps.setInt(2, moduleId);

			return ps.executeUpdate();
		}
	}

	@Override
	public List<Issue> getAssignedIssueDetails(Connection connection, int developerId) throws SQLException {
		// TODO Auto-generated method stub
		List<Issue> issueList = new ArrayList<Issue>();
		
		try(PreparedStatement ps = connection.prepareStatement("select * from issue_details where i_developer_id=?"))
		{
			ps.setInt(1,developerId);
			
			ResultSet resultSet = ps.executeQuery();
			
			while(resultSet.next())
			{
				Issue issue = new Issue();
				
				issue.setIssueId(resultSet.getInt(1));				
				issue.setIssueName(resultSet.getString(2));				
				issue.setIssueDes(resultSet.getString(3));				
				issue.setIssueImpact(resultSet.getString(4));				
				issue.setIssuePriority(resultSet.getString(5));				
				issue.setIssueCreatedDate(resultSet.getString(7));				
				issue.setIssueCloseDate(resultSet.getString(8));				
				issue.setIssueStatusId(resultSet.getInt(9));				
				issue.setIssueStatusName(testerDao.getIssueStatusName(connection, issue.getIssueStatusId()));				
				issue.setDeveloperId(resultSet.getInt(10));				
				issue.setDeveloperName(projectDao.getDeveloperName(connection, issue.getDeveloperId()));				
				issue.setTesterId(resultSet.getInt(11));				
				issue.setTesterName(projectDao.getTesterName(connection, issue.getTesterId()));				
				issue.setModuleId(resultSet.getInt(12));				
				issue.setModuleName(testerDao.getModuleName(connection, issue.getModuleId()));			
				
				List<IssueStatus> statusList = new ArrayList<IssueStatus>();

				try (PreparedStatement ps1 = connection
						.prepareStatement("select * from mapping_status where i_current_status=?")) {
					ps1.setInt(1, issue.getIssueStatusId());

					ResultSet rs = ps1.executeQuery();

					while (rs.next()) {
						IssueStatus issueStatus = new IssueStatus();

						issueStatus.setStatusId(rs.getInt("i_next_status"));

						try (PreparedStatement ps2 = connection.prepareStatement(
								"select c_status_name from issue_status_table where i_istatus_is=?")) {
							ps2.setInt(1, issueStatus.getStatusId());

							ResultSet rs1 = ps2.executeQuery();

							while (rs1.next()) {
								issueStatus.setStatusName(rs1.getString("c_status_name"));
							}
							rs1.close();
						}

						statusList.add(issueStatus);
					}
					rs.close();
				}
				issue.setIssueStatusBean(statusList);
				
				issueList.add(issue);
			}
			resultSet.close();
		}
		return issueList;
	}
}
