package com.issuetracker.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.issuetracker.bean.ModuleDetails;

public interface DeveloperDao {

	public List<ModuleDetails> getModuleDetails(Connection connection, int developerId) throws SQLException;

	public int updateModuleStatus(Connection connection, int moduleId) throws SQLException;

}
