package com.issuetracker.dao.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;

import com.issuetracker.bean.ActiveUsers;
import com.issuetracker.bean.Area;
import com.issuetracker.bean.Role;
import com.issuetracker.bean.User;
import com.issuetracker.bean.UserRequest;
import com.issuetracker.dao.IssueDao;

public class IssueDaoImpl implements IssueDao {

	@Override
	public List<Area> selectAreaDetails(Connection connection) throws SQLException {
		// TODO Auto-generated method stub

		List<Area> areaList = new ArrayList<Area>();
		ResultSet resultSet = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {

			e.printStackTrace();
		}

		try (PreparedStatement ps = connection.prepareStatement("select * from area_table")) {

			resultSet = ps.executeQuery();

			while (resultSet.next()) {

				Area area = new Area();

				area.setAreaId(resultSet.getInt(1));
				area.setAreaName(resultSet.getString(2));

				areaList.add(area);
			}
		}
		resultSet.close();
		return areaList;
	}

	@Override
	public List<Role> selectRoleDetails(Connection connection) throws SQLException {
		// TODO Auto-generated method stub

		List<Role> roleList = new ArrayList<Role>();
		ResultSet resultSet = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		try (PreparedStatement ps = connection.prepareStatement("select * from role_table")) {

			resultSet = ps.executeQuery();

			while (resultSet.next()) {

				Role role = new Role();

				role.setRoleId(resultSet.getInt(1));
				role.setRoleName(resultSet.getString(2));

				roleList.add(role);
			}

			return roleList;
		}

	}

	@Override
	public int insertUserDetails(Connection connection, User user) throws SQLException {
		// TODO Auto-generated method stub

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		try (PreparedStatement ps = connection.prepareStatement(
				"insert into user_table(c_user_name,c_user_contact,c_user_address,i_area_id,c_user_email,c_user_password,i_role_id,i_is_active,i_is_approve) values(?,?,?,?,?,?,?,?,?)")) {
			ps.setString(1, user.getUserName());
			ps.setString(2, user.getUserContact());
			ps.setString(3, user.getUserAddress());
			ps.setInt(4, user.getAreaId());
			ps.setString(5, user.getUserEmail());
			ps.setString(6, user.getPassword());
			ps.setInt(7, user.getRoleId());
			ps.setInt(8, 0);
			ps.setInt(9, 0);

			return ps.executeUpdate();
		}
	}

	@Override
	public List<UserRequest> getpendingusers(Connection connection) throws SQLException {

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		List<UserRequest> pendinguser = new ArrayList<UserRequest>();
		ResultSet resultSet = null;

		try (PreparedStatement ps = connection.prepareStatement("select * from user_table where i_is_approve=?")) {
			ps.setInt(1, 0);
			resultSet = ps.executeQuery();

			while (resultSet.next()) {
				UserRequest request = new UserRequest();
				int a = 0;
				int r = 0;
				String aname = null;
				String rname = null;
				request.setUserid(resultSet.getInt(1));

				request.setUsername(resultSet.getString(2));
				request.setContact(resultSet.getString(3));
				request.setAddress(resultSet.getString(4));
				a = resultSet.getInt(5);
				aname = getAreaName(connection, a);
				request.setAreaname(aname);
				request.setEmail(resultSet.getString(6));
				r = resultSet.getInt(8);
				rname = getRoleName(connection, r);
				request.setRolename(rname);

				pendinguser.add(request);
			}
		}
		resultSet.close();
		return pendinguser;
	}

	@Override
	public String getAreaName(Connection connection, int aid) throws SQLException {

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String area = null;
		ResultSet resultSet = null;

		try (PreparedStatement ps = connection.prepareStatement("select * from area_table where i_area_id=?")) {
			ps.setInt(1, aid);
			resultSet = ps.executeQuery();

			while (resultSet.next()) {
				area = resultSet.getString("c_area_name");
			}
		}
		resultSet.close();
		return area;
	}

	@Override
	public String getRoleName(Connection connection, int rid) throws SQLException {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String rname = null;
		ResultSet resultSet = null;

		try (PreparedStatement ps = connection.prepareStatement("select * from role_table where i_role_id=?")) {
			ps.setInt(1, rid);
			resultSet = ps.executeQuery();

			while (resultSet.next()) {
				rname = resultSet.getString("c_role_name");
			}
		}
		resultSet.close();
		return rname;

	}

	@Override
	public int updateApproveActiveDetails(Connection connection, int uId) throws SQLException {
		// TODO Auto-generated method stub

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		try (PreparedStatement ps = connection
				.prepareStatement("update user_table set i_is_approve=?,i_is_active=? where i_user_id=?")) {
			ps.setInt(1,1);
			ps.setInt(2,1);
			ps.setInt(3, uId);
			

			return ps.executeUpdate();
		}
	}

	@Override
	public int deleteUserDetails(Connection connection, int uid) throws SQLException {
		// TODO Auto-generated method stub

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		try (PreparedStatement ps = connection.prepareStatement("update user_table set i_is_approve=? where i_user_id=?")) {
			ps.setInt(1,-1);
			ps.setInt(2, uid);
			return ps.executeUpdate();
		}
	}

	@Override
	public String validateEmailDetails(Connection connection, String email) throws SQLException {
		// TODO Auto-generated method stub

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		try (PreparedStatement ps = connection.prepareStatement("select * from user_table where c_user_email = ?")) {
			ps.setString(1, email);

			ResultSet resultSet = ps.executeQuery();

			String userEmail = null;

			while (resultSet.next()) {
				userEmail = resultSet.getString("c_user_email");
			}

			if (email.equalsIgnoreCase(userEmail)) {
				return "true";
			} else {
				return "false";
			}
		}
	}

	@Override
	public String getEmail(Connection connection, int uId) throws SQLException {
		// TODO Auto-generated method stub

		ResultSet resultSet = null;
		String msg = null;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {

			e.printStackTrace();
		}

		try (PreparedStatement ps = connection
				.prepareStatement("select c_user_email from user_table where i_user_id = ?")) {
			ps.setInt(1, uId);

			resultSet = ps.executeQuery();

			while (resultSet.next()) {
				msg = resultSet.getString("c_user_email");
			}
		}
		resultSet.close();
		return msg;
	}

	@Override
	public List<ActiveUsers> getactiveusers(Connection connection) throws SQLException {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		List<ActiveUsers> pendinguser = new ArrayList<ActiveUsers>();
		ResultSet resultSet = null;

		try (PreparedStatement ps = connection.prepareStatement("select * from user_table where i_is_active=?")) {
			ps.setInt(1, 1);
			resultSet = ps.executeQuery();

			while (resultSet.next()) {
				ActiveUsers request = new ActiveUsers();
				int a = 0;
				int r = 0;
				String aname = null;
				String rname = null;
				request.setUserid(resultSet.getInt(1));

				request.setUsername(resultSet.getString(2));
				request.setContact(resultSet.getString(3));
				request.setAddress(resultSet.getString(4));
				a = resultSet.getInt(5);
				aname = getAreaName(connection, a);
				request.setAreaname(aname);
				request.setEmail(resultSet.getString(6));
				r = resultSet.getInt(8);
				rname = getRoleName(connection, r);
				request.setRolename(rname);

				pendinguser.add(request);
			}
		}
		resultSet.close();

		return pendinguser;
	}

	@Override
	public User checkLogin(Connection connection, User user) throws SQLException {
		// TODO Auto-generated method stub
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		User u = new User();

		String email = null;
		String pwd = null;

		String email1 = null;
		String pass1 = null;

		email = user.getUserEmail();
		pwd = user.getPassword();
		try (PreparedStatement ps = connection.prepareStatement("select * from user_table");
				ResultSet resultSet = ps.executeQuery();) {

			while (resultSet.next()) {
				email1 = resultSet.getString("c_user_email");
				pass1 = resultSet.getString("c_user_password");
				
				if (email.equals(email1) && pwd.equals(pass1) && resultSet.getInt("i_is_active") == 1) {
					
					u.setUserId(resultSet.getInt(1));
					u.setUserName(resultSet.getString(2));
					u.setUserContact(resultSet.getString(3));
					u.setUserAddress(resultSet.getString(4));
					u.setAreaId(resultSet.getInt(5));
					u.setUserEmail(resultSet.getString(6));
					u.setPassword(resultSet.getString(7));
					u.setRoleId(resultSet.getInt(8));
				}
			}
		}
		return u;
	}

	@Override
	public String getUserPassword(Connection connection, String email) throws SQLException {
		// TODO Auto-generated method stub

		String password = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		try (PreparedStatement ps = connection
				.prepareStatement("select c_user_password from user_table where c_user_email = ?")) {
			ps.setString(1, email);

			ResultSet resultSet = ps.executeQuery();

			while (resultSet.next()) {
				password = resultSet.getString("c_user_password");

			}
		}
		return password;
	}

	@Override
	public int storeUpdatePassword(Connection connection, String email, String pwd) throws SQLException {
		// TODO Auto-generated method stub

		int id = 0;
		int updateId = 0;

		ResultSet resultSet = null;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		try (PreparedStatement ps = connection.prepareStatement("select * from user_table where c_user_email = ?")) {
			ps.setString(1, email);

			resultSet = ps.executeQuery();

			while (resultSet.next()) {
				id = resultSet.getInt(1);
				System.out.println("Id is :: " + id);
			}

			try (PreparedStatement statement = connection
					.prepareStatement("update user_table set c_user_password=? where i_user_id = ?")) {
				statement.setString(1,pwd);
				statement.setInt(2, id);
				updateId = statement.executeUpdate();
			}
		}
		return updateId;
	}

	@Override
	public String getArea(Connection connection, int areaId) throws SQLException {
		// TODO Auto-generated method stub
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String area = null;
		ResultSet resultSet = null;

		try (PreparedStatement ps = connection.prepareStatement("select c_area_name from area_table where i_area_id=?")) {
			ps.setInt(1, areaId);
			resultSet = ps.executeQuery();

			while (resultSet.next()) {
				area = resultSet.getString("c_area_name");
			}
		}
		resultSet.close();
		return area;
	}

	@Override
	public int updateUserDetails(Connection connection, User u) throws SQLException {
		// TODO Auto-generated method stub
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try(PreparedStatement ps = connection.prepareStatement("update user_table set c_user_name=?,c_user_contact=?,c_user_address=?,i_area_id=? where i_user_id=?"))
		{
			ps.setString(1,u.getUserName());
			ps.setString(2,u.getUserContact());
			ps.setString(3,u.getUserAddress());
			ps.setInt(4,u.getAreaId());
			ps.setInt(5,u.getUserId());
			
			return ps.executeUpdate();
		}
	}

	@Override
	public int deleteUsers(Connection connection, int uid) throws SQLException {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try(PreparedStatement ps = connection.prepareStatement("update user_table set i_is_active=? where i_user_id=?"))
		{	
			ps.setInt(1, 0);
			ps.setInt(2, uid);
			return ps.executeUpdate();
		}
		
	}

	@Override
	public String checkPwdDetails(Connection connection, String password) throws SQLException {
		// TODO Auto-generated method stub
		int temp = 0;
		ResultSet resultSet = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try(PreparedStatement ps = connection.prepareStatement("select c_user_password from user_table"))
		{
			resultSet = ps.executeQuery();
			
			while(resultSet.next())
			{
				String pwd = resultSet.getString("c_user_password");
				if(pwd.equals(password))
				{
					temp = 1;
				}
			}
		}
		resultSet.close();
		if(temp == 1)
		{
			return "true";
		}
		else
		{
			return "false";
		}
	}

	@Override
	public int storeUpdatePassword(Connection connection, String pwd, int id) throws SQLException {
		// TODO Auto-generated method stub
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try(PreparedStatement ps = connection.prepareStatement("update user_table set c_user_password=? where i_user_id=?"))
		{
			ps.setString(1,pwd);
			ps.setInt(2,id);
			
			return ps.executeUpdate();
		}
	}

	@Override
	public List<User> fetchDeveloperList(Connection connection) throws SQLException {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		List<User> developerList = new ArrayList<User>();
		ResultSet resultSet = null;
		try (PreparedStatement ps = connection.prepareStatement("select * from user_table where i_role_id=?")) {
			ps.setInt(1, 2);
			resultSet = ps.executeQuery();

			while (resultSet.next()) {
				User u=new User();
				u.setUserId(resultSet.getInt("i_user_id"));
				u.setUserName(resultSet.getString("c_user_name"));
				developerList.add(u);
			}
		}
		return developerList;
	}
}
