package com.issuetracker.service.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;

import com.issuetracker.bean.ActiveUsers;
import com.issuetracker.bean.Area;
import com.issuetracker.bean.Role;
import com.issuetracker.bean.User;
import com.issuetracker.bean.UserRequest;
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

		try (Connection connection = getConnection();) {
			areaList = issueDao.selectAreaDetails(connection);
		}

		return areaList;
	}

	@Override
	public List<Role> fetchRoleDetails() throws SQLException {
		// TODO Auto-generated method stub

		List<Role> roleList;

		try (Connection connection = getConnection()) {
			roleList = issueDao.selectRoleDetails(connection);
		}

		return roleList;
	}

	@Override
	public void saveUserDetails(User user) throws SQLException {
		// TODO Auto-generated method stub

		int insertedRecord = 0;

		try (Connection connection = getConnection()) {
			insertedRecord = issueDao.insertUserDetails(connection, user);
		}
		if (insertedRecord > 0) {
			System.out.println("Record Inserted Successfully !!!!");
		} else {
			System.out.println("Record is not Inserted.");
		}
	}

	@Override
	public List<UserRequest> fetchPendingList() throws SQLException {

		List<UserRequest> userList = null;

		try (Connection connection = getConnection();) {
			userList = issueDao.getpendingusers(connection);
		}
		return userList;
	}

	@Override
	public String setApproveActiveDetails(int uId) throws SQLException {
		// TODO Auto-generated method stub

		int updatedId = 0;

		try (Connection connection = getConnection();) {
			updatedId = issueDao.updateApproveActiveDetails(connection, uId);

			if (updatedId > 0) {
				return "IsApprove and IsActive Updated Successfully !!!";
			} else {
				return "Sorry, IsApprove and IsActive Not Updated Successfully";
			}
		}
	}

	@Override
	public String fetchUserDetails(int uid) throws SQLException {
		// TODO Auto-generated method stub

		int deletedId = 0;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		try (Connection connection = getConnection();) {
			deletedId = issueDao.deleteUserDetails(connection, uid);

			if (deletedId > 0) {
				return "Record Deleted Successfully !!!";
			} else {
				return "Sorry, Record Deleted Not Successfully.";
			}
		}
	}

	@Override
	public String fetchEmailDetails(String email) throws SQLException {
		// TODO Auto-generated method stub
		
		String emailId = null;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		try (Connection connection = getConnection()) {

			emailId = issueDao.validateEmailDetails(connection,email);
		}
		return emailId;
	}

	@Override
	public String selectEmail(int uId) throws SQLException {
		// TODO Auto-generated method stub
		

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try(Connection connection = getConnection())
		{
			return issueDao.getEmail(connection,uId);
		}
	}

	@Override
	public String selectRejectDetails(int uid) throws SQLException {
		// TODO Auto-generated method stub
		
		int rejectedId = 0;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try(Connection connection = getConnection())
		{
			rejectedId = issueDao.deleteUserDetails(connection, uid);
			
			if(rejectedId > 0)
			{
				return "Request Rejected Successfully!!!";
			}
			else
			{
				return "Request is Not Rejected.";
			}
		}
	}

	@Override
	public List<ActiveUsers> fetchActiveUserList() throws SQLException {
		
		List<ActiveUsers> userList = null;

		try (Connection connection = getConnection();) {
			userList = issueDao.getactiveusers(connection);
		}
		
		return userList;
	}

	@Override
	public User checkLoginDetails(User u) throws SQLException {
		// TODO Auto-generated method stub
		
		User user = new User();
		
		try(Connection connection = getConnection())
		{
			user = issueDao.checkLogin(connection, u);
		}
		
		return user;
	}

}
