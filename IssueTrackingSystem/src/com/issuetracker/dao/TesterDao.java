package com.issuetracker.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.issuetracker.bean.ModuleDetails;

public interface TesterDao {

	public List<ModuleDetails> getModuleDetails(Connection connection, int testerId) throws SQLException;

}
