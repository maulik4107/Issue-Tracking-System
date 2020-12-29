package com.issuetracker.service;

import java.sql.SQLException;
import java.util.List;

import com.issuetracker.bean.Area;
import com.issuetracker.bean.Role;
import com.issuetracker.bean.User;

public interface IssueService {

	public List<Area> fetchAreaDetails() throws SQLException;

	public List<Role> fetchRoleDetails() throws SQLException;

	public void saveUserDetails(User user) throws SQLException;

}
