package com.issuetracker.service.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;

import com.issuetracker.bean.Area;
import com.issuetracker.bean.Role;
import com.issuetracker.bean.User;
import com.issuetracker.dao.IssueDao;
import com.issuetracker.dao.impl.IssueDaoImpl;
import com.issuetracker.service.IssueService;

public class IssueServiceImpl implements IssueService {

	IssueDao issueDao = new IssueDaoImpl();
	
	
	public Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/its", "root", "root");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return connection;
	}
	
	@Override
	public List<Area> fetchAreaDetails() throws SQLException {
		// TODO Auto-generated method stub
		
		List<Area> areaList;

		try(Connection connection = getConnection();)
		{
			 areaList = issueDao.selectAreaDetails(connection);
		}
		
		return areaList;
	}

	@Override
	public List<Role> fetchRoleDetails() throws SQLException {
		// TODO Auto-generated method stub
		
		List<Role> roleList;
		
		try(Connection connection = getConnection())
		{
			roleList = issueDao.selectRoleDetails(connection);
		}
		
		return roleList;
	}

	@Override
	public void saveUserDetails(User user) throws SQLException {
		// TODO Auto-generated method stub

		int insertedRecord = 0;
		
		try(Connection connection = getConnection())
		{
			insertedRecord = issueDao.insertUserDetails(connection,user);
		}
		if(insertedRecord>0)
		{
			System.out.println("Record Inserted Successfully !!!!");
		}
		else
		{
			System.out.println("Record is not Inserted.");
		}
	}

}
