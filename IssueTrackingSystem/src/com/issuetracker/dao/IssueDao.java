package com.issuetracker.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.issuetracker.bean.ActiveUsers;
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

	public int updateApproveActiveDetails(Connection connection, int uId) throws SQLException;

	public int deleteUserDetails(Connection connection, int uid) throws SQLException;

	public String validateEmailDetails(Connection connection, String email) throws SQLException;

	public String getEmail(Connection connection, int uId) throws SQLException;

	public List<ActiveUsers> getactiveusers(Connection connection) throws SQLException;

	public User checkLogin(Connection connection,User user) throws SQLException;

	public String getUserPassword(Connection connection, String email) throws SQLException;

	public int storeUpdatePassword(Connection connection, String email, String pwd) throws SQLException;

	public String getArea(Connection connection, int areaId) throws SQLException;

	public int updateUserDetails(Connection connection, User u) throws SQLException;

	public int deleteUsers(Connection connection, int uid) throws SQLException;

	public String checkPwdDetails(Connection connection, String password) throws SQLException;

	public int storeUpdatePassword(Connection connection, String pwd, int id) throws SQLException;

	public List<User> fetchDeveloperList(Connection connection)throws SQLException;

	public List<User> fetchTesterList(Connection connection)throws SQLException;
}
