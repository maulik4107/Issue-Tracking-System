package com.issuetracker.service;

import java.sql.SQLException;
import java.util.List;

import com.issuetracker.bean.ActiveUsers;
import com.issuetracker.bean.Area;
import com.issuetracker.bean.Role;
import com.issuetracker.bean.User;
import com.issuetracker.bean.UserRequest;

public interface IssueService {

	public List<Area> fetchAreaDetails() throws SQLException;

	public List<Role> fetchRoleDetails() throws SQLException;

	public void saveUserDetails(User user) throws SQLException;

	public List<UserRequest> fetchPendingList() throws SQLException;

	public String setApproveActiveDetails(int uId) throws SQLException;

	public String fetchUserDetails(int uid) throws SQLException;

	public String fetchEmailDetails(String email) throws SQLException;

	public String selectEmail(int uId) throws SQLException;

	public String selectRejectDetails(int uid) throws SQLException;

	public List<ActiveUsers> fetchActiveUserList() throws SQLException;

}
