package com.issuetracker.service;

import java.sql.SQLException;
import java.util.List;

import com.issuetracker.bean.Area;

public interface IssueService {

	public List<Area> fetchAreaDetails() throws SQLException;

}
