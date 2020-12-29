package com.issuetracker.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.issuetracker.bean.Area;
import com.issuetracker.bean.Role;
import com.issuetracker.bean.User;

public interface IssueDao {

	public List<Area> selectAreaDetails(Connection connection) throws SQLException;

	public List<Role> selectRoleDetails(Connection connection) throws SQLException;

	public int insertUserDetails(Connection connection, User user) throws SQLException;

}
