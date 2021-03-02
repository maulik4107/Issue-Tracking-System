package com.issuetracker.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.issuetracker.bean.ModuleDetails;
import com.issuetracker.dao.DeveloperDao;
import com.issuetracker.dao.ProjectDao;

public class DeveloperDaoImpl implements DeveloperDao {

	ProjectDao projectDao = new ProjectDaoImpl();

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
}
