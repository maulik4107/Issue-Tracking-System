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
import com.issuetracker.dao.ProjectDao;
import com.issuetracker.dao.TesterDao;

public class TesterDaoImpl implements TesterDao {

	ProjectDao projectDao = new ProjectDaoImpl();

	@Override
	public List<ModuleDetails> getModuleDetails(Connection connection, int testerId) throws SQLException {
		// TODO Auto-generated method stub
		List<ModuleDetails> moduleList = new ArrayList<ModuleDetails>();
		try (PreparedStatement ps = connection.prepareStatement(
				"select * from module_table where i_tester_id=? and i_is_active=? and (i_status_id=? or i_status_id=? or i_status_id=?)")) {
			ps.setInt(1, testerId);
			ps.setInt(2, 1);
			ps.setInt(3, 3);
			ps.setInt(4, 4);
			ps.setInt(5, 5);
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
				module.setTesterId(resultSet.getInt(9));

				module.setStatusName(projectDao.getModuleStatusName(connection, resultSet.getInt(6)));
				module.setProjectName(projectDao.getProjectName(connection, module.getProjectId()));
				module.setDeveloperName(projectDao.getDeveloperName(connection, resultSet.getInt(8)));
				module.setTesterName(projectDao.getTesterName(connection, resultSet.getInt(9)));

				moduleList.add(module);
			}
			resultSet.close();
		}
		return moduleList;
	}

	@Override
	public int saveIssueDetails(Connection connection, Issue issue) throws SQLException {

		try (PreparedStatement ps = connection.prepareStatement(
				"insert into issue_details(c_issue_name,c_issue_description,c_issue_impact,c_impact_priority,b_issue_document,d_issue_cd,d_issue_ed,i_istatus_id,i_developer_id,i_tester_id,i_module_id) values(?,?,?,?,?,?,?,?,?,?,?);")) {
			ps.setString(1, issue.getIssueName());
			ps.setString(2, issue.getIssueDes());
			ps.setString(3, null);
			ps.setString(4, null);
			ps.setBlob(5, issue.getDocumentStream());
			ps.setString(6, issue.getIssueCreatedDate());
			ps.setString(7, null);
			ps.setInt(8, 1);
			ps.setInt(9, 0);
			ps.setInt(10, issue.getTesterId());
			ps.setInt(11, issue.getModuleId());

			return ps.executeUpdate();
		}
	}

	@Override
	public int UpdateIssueFoundStatus(Connection connection, int moduleId) throws SQLException {
		// TODO Auto-generated method stub
		try (PreparedStatement ps = connection
				.prepareStatement("update module_table set i_status_id=? where i_module_id=?")) {
			ps.setInt(1, 5);
			ps.setInt(2, moduleId);

			return ps.executeUpdate();
		}
	}

	@Override
	public List<Issue> getIssueDetails(Connection connection, int mid) throws SQLException {
		List<Issue> issueList = new ArrayList<Issue>();
		try (PreparedStatement ps = connection.prepareStatement("select * from issue_details where i_module_id=?")) {
			ps.setInt(1, mid);
			ResultSet resultSet = ps.executeQuery();

			while (resultSet.next()) {
				Issue issue = new Issue();

				issue.setIssueId(resultSet.getInt(1));
				issue.setIssueName(resultSet.getString(2));
				issue.setIssueDes(resultSet.getString(3));
				issue.setIssueImpact(resultSet.getString(4));
				issue.setIssuePriority(resultSet.getString(5));

				byte[] fileData = resultSet.getBytes(6);
				if (null != fileData && fileData.length > 0) {
					String fileString = Base64.getEncoder().encodeToString(fileData);
					issue.setDocumentString(fileString);
				}

				issue.setIssueCreatedDate(resultSet.getString(7));
				issue.setIssueCloseDate(resultSet.getString(8));
				issue.setIssueStatusId(resultSet.getInt(9));
				issue.setIssueStatusName(getIssueStatusName(connection, issue.getIssueStatusId()));
				issue.setDeveloperId(resultSet.getInt(10));
				issue.setDeveloperName(projectDao.getDeveloperName(connection, issue.getDeveloperId()));
				issue.setTesterId(resultSet.getInt(11));
				issue.setTesterName(projectDao.getTesterName(connection, issue.getTesterId()));
				issue.setModuleId(resultSet.getInt(12));
				issue.setModuleName(getModuleName(connection, issue.getModuleId()));

				issueList.add(issue);
			}
			resultSet.close();
		}
		return issueList;

	}

	@Override
	public String getModuleName(Connection connection, int moduleId) throws SQLException {
		String sname = null;
		try (PreparedStatement ps = connection
				.prepareStatement("select c_module_name from module_table where i_module_id=?")) {
			ps.setInt(1, moduleId);
			ResultSet resultSet = ps.executeQuery();

			while (resultSet.next()) {
				sname = resultSet.getString("c_module_name");
			}
		}
		return sname;
	}

	@Override
	public String getIssueStatusName(Connection connection, int statusId) throws SQLException {
		String sname = null;
		try (PreparedStatement ps = connection
				.prepareStatement("select c_status_name from issue_status_table where i_istatus_is=?")) {
			ps.setInt(1, statusId);
			ResultSet resultSet = ps.executeQuery();

			while (resultSet.next()) {
				sname = resultSet.getString("c_status_name");
			}
		}
		return sname;
	}

	@Override
	public List<Issue> getModuleDetailsProject(Connection connection, List<ModuleDetails> moduleIdList)
			throws SQLException {
		// TODO Auto-generated method stub

		List<Issue> issueList = new ArrayList<Issue>();

		for (ModuleDetails m : moduleIdList) {
			int mid = m.getModuleId();

			System.out.println(mid);

			try (PreparedStatement ps = connection
					.prepareStatement("select * from issue_details where i_module_id=?")) {
				ps.setInt(1, mid);
				ResultSet resultSet = ps.executeQuery();

				while (resultSet.next()) {
					Issue issue = new Issue();

					issue.setIssueId(resultSet.getInt(1));
					issue.setIssueName(resultSet.getString(2));
					issue.setIssueDes(resultSet.getString(3));
					issue.setIssueImpact(resultSet.getString(4));
					issue.setIssuePriority(resultSet.getString(5));
					byte[] fileData = resultSet.getBytes(6);
					if (null != fileData && fileData.length > 0) {
						String fileString = Base64.getEncoder().encodeToString(fileData);
						issue.setDocumentString(fileString);
					}
					issue.setIssueCreatedDate(resultSet.getString(7));
					issue.setIssueCloseDate(resultSet.getString(8));
					issue.setIssueStatusId(resultSet.getInt(9));
					issue.setIssueStatusName(getIssueStatusName(connection, issue.getIssueStatusId()));
					issue.setDeveloperId(resultSet.getInt(10));
					issue.setDeveloperName(projectDao.getDeveloperName(connection, issue.getDeveloperId()));
					issue.setTesterId(resultSet.getInt(11));
					issue.setTesterName(projectDao.getTesterName(connection, issue.getTesterId()));
					issue.setModuleId(resultSet.getInt(12));
					issue.setModuleName(getModuleName(connection, issue.getModuleId()));

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
		}
		return issueList;
	}

	@Override
	public Issue getIssueInfo(Connection connection, int id) throws SQLException {

		Issue issue = new Issue();
		try (PreparedStatement ps = connection.prepareStatement("select * from issue_details where i_issue_id=?")) {
			ps.setInt(1, id);
			ResultSet resultSet = ps.executeQuery();

			while (resultSet.next()) {
				issue.setIssueId(resultSet.getInt(1));
				issue.setIssueName(resultSet.getString(2));
				issue.setIssueDes(resultSet.getString(3));
				issue.setIssueImpact(resultSet.getString(4));
				issue.setIssuePriority(resultSet.getString(5));
				byte[] fileData = resultSet.getBytes(6);
				if (null != fileData && fileData.length > 0) {
					String fileString = Base64.getEncoder().encodeToString(fileData);
					issue.setDocumentString(fileString);
				}
				issue.setIssueCreatedDate(resultSet.getString(7));
				issue.setIssueCloseDate(resultSet.getString(8));
				issue.setIssueStatusId(resultSet.getInt(9));
				issue.setIssueStatusName(getIssueStatusName(connection, issue.getIssueStatusId()));
				issue.setDeveloperId(resultSet.getInt(10));
				issue.setDeveloperName(projectDao.getDeveloperName(connection, issue.getDeveloperId()));
				issue.setTesterId(resultSet.getInt(11));
				issue.setTesterName(projectDao.getTesterName(connection, issue.getTesterId()));
				issue.setModuleId(resultSet.getInt(12));
				issue.setModuleName(getModuleName(connection, issue.getModuleId()));

			}
			resultSet.close();
		}
		return issue;

	}

	@Override
	public int UpdateIssueInfo(Connection connection, Issue issue) throws SQLException {

		try (PreparedStatement ps = connection.prepareStatement(
				"update issue_details set c_issue_name=?,c_issue_description=?,b_issue_document=COALESCE(?,b_issue_document),d_issue_cd=? where i_issue_id=?")) {
			ps.setString(1, issue.getIssueName());
			ps.setString(2, issue.getIssueDes());
			ps.setBlob(3, issue.getDocumentStream());
			ps.setString(4, issue.getIssueCreatedDate());
			ps.setInt(5, issue.getIssueId());

			return ps.executeUpdate();
		}
	}

	@Override
	public int ChangeIssueInfo(Connection connection, Issue issue) throws SQLException {
		try (PreparedStatement ps = connection.prepareStatement(
				"update issue_details set c_issue_name=?,c_issue_description=?,c_issue_impact=?,c_impact_priority=?,b_issue_document=COALESCE(?,b_issue_document),d_issue_cd=?,i_developer_id=?,i_tester_id=? where i_issue_id=?")) {
			ps.setString(1, issue.getIssueName());
			System.out.println("Issue description : " + issue.getIssueDes());
			ps.setString(2, issue.getIssueDes());
			ps.setString(3, issue.getIssueImpact());
			ps.setNString(4, issue.getIssuePriority());
			ps.setBlob(5, issue.getDocumentStream());
			ps.setString(6, issue.getIssueCreatedDate());
			ps.setInt(7, issue.getDeveloperId());
			ps.setInt(8, issue.getTesterId());
			ps.setInt(9, issue.getIssueId());

			return ps.executeUpdate();
		}
	}
}
