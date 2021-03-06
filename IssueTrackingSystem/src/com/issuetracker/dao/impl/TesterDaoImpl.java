package com.issuetracker.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.issuetracker.bean.Issue;
import com.issuetracker.bean.ModuleDetails;
import com.issuetracker.dao.ProjectDao;
import com.issuetracker.dao.TesterDao;

public class TesterDaoImpl implements TesterDao {
	
	ProjectDao projectDao = new ProjectDaoImpl();

	@Override
	public List<ModuleDetails> getModuleDetails(Connection connection, int testerId) throws SQLException {
		// TODO Auto-generated method stub
		List<ModuleDetails> moduleList = new ArrayList<ModuleDetails>();
		try (PreparedStatement ps = connection.prepareStatement("select * from module_table where i_tester_id=? && i_status_id=?")) {
			ps.setInt(1, testerId);
			ps.setInt(2,3);
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

				module.setStatusName(projectDao.getModuleStatusName(connection,resultSet.getInt(6)));
				module.setProjectName(projectDao.getProjectName(connection, module.getProjectId()));
				module.setDeveloperName(projectDao.getDeveloperName(connection, resultSet.getInt(8)));
				module.setTesterName(projectDao.getTesterName(connection,resultSet.getInt(9)));

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
			ps.setString(1,issue.getIssueName());
			ps.setString(2,issue.getIssueDes());
			ps.setString(3,null);
			ps.setString(4,null);
			ps.setBlob(5, issue.getDocumentStream());
			ps.setString(6, issue.getIssueCreatedDate());
			ps.setString(7,null);
			ps.setInt(8,1);
			ps.setInt(9,0);
			ps.setInt(10,0);
			ps.setInt(11,issue.getModuleId());
			
			return ps.executeUpdate();
		}
	}

}
