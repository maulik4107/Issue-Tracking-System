package com.issuetracker.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.issuetracker.bean.Area;

public interface IssueDao {

	public List<Area> selectAreaDetails(Connection connection) throws SQLException;

}
