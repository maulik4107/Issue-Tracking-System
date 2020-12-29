package com.issuetracker.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.issuetracker.bean.Area;
import com.issuetracker.bean.Role;
import com.issuetracker.bean.User;
import com.issuetracker.bean.UserRequest;

public interface IssueDao {

	public List<Area> selectAreaDetails(Connection connection) throws SQLException;

	public List<Role> selectRoleDetails(Connection connection) throws SQLException;

	public int insertUserDetails(Connection connection, User user) throws SQLException;

	public List<UserRequest> getpendingusers(Connection connection) throws SQLException;

	public String getAreaName(Connection connection, int aid) throws SQLException;

	public String getRoleName(Connection connection, int rid) throws SQLException;

}
