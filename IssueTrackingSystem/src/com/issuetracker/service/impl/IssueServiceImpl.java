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
import com.issuetracker.others.TrippleDes;
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

			emailId = issueDao.validateEmailDetails(connection, email);
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

		try (Connection connection = getConnection()) {
			return issueDao.getEmail(connection, uId);
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

		try (Connection connection = getConnection()) {
			rejectedId = issueDao.deleteUserDetails(connection, uid);

			if (rejectedId > 0) {
				return "Request Rejected Successfully!!!";
			} else {
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

		try (Connection connection = getConnection()) {
			user = issueDao.checkLogin(connection, u);
		}

		return user;
	}

	@Override
	public String fetchUserDetails(String email) {
		// TODO Auto-generated method stub

		String pwd = null;

		try (Connection connection = getConnection()) {
			pwd = issueDao.getUserPassword(connection, email);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return pwd;
	}

	@Override
	public String savePasswordDetails(String email, String pwd) {
		// TODO Auto-generated method stub

		String msg = null;
		int updatedPassword = 0;

		try (Connection connection = getConnection()) {
			updatedPassword = issueDao.storeUpdatePassword(connection, email, pwd);

			if (updatedPassword > 0) {
				return "Password Updated Successfully!!";
			} else {
				return "Password is not Updated.";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public String fetchAreaDetails(int areaId) throws SQLException {
		// TODO Auto-generated method stub

		try (Connection connection = getConnection()) {
			return issueDao.getArea(connection, areaId);
		}
	}

	@Override
	public int editUserDetails(User u) throws SQLException {
		// TODO Auto-generated method stub

		try (Connection connection = getConnection()) {
			return issueDao.updateUserDetails(connection, u);
		}
	}

	@Override
	public String deleteUser(int uid) throws SQLException {
		int n = 0;
		try (Connection connection = getConnection()) {
			n = issueDao.deleteUsers(connection, uid);
		}
		if (n > 0) {
			return "Deleted Successfully!!";
		} else {
			return "Deletion Failed!!";
		}

	}

	@Override
	public String getPasswordDetails(String pwd) throws SQLException {
		// TODO Auto-generated method stub

		TrippleDes des = null;
		try {
			des = new TrippleDes();
		} catch (Exception e) {
			e.printStackTrace();
		}
		String password = des.encrypt(pwd);
		
		try(Connection connection = getConnection())
		{
			return issueDao.checkPwdDetails(connection,password);
		}
	}

	@Override
	public int savePasswordDetails(String pwd,int Id) throws SQLException {
		// TODO Auto-generated method stub
		
		try(Connection connection = getConnection())
		{
			return issueDao.storeUpdatePassword(connection,pwd,Id);
		}
	}

	@Override
	public List<User> getDeveloperList() throws SQLException {
		try(Connection connection = getConnection())
		{
			return issueDao.fetchDeveloperList(connection);
		}
	}

	@Override
	public List<User> getTesterList() throws SQLException {
		try(Connection connection = getConnection())
		{
			return issueDao.fetchTesterList(connection);
		}
	}

}
