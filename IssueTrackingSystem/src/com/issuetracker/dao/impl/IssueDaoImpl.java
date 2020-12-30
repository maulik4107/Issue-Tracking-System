package com.issuetracker.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
		String rname=null;
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
		
		try(PreparedStatement ps = connection.prepareStatement("update user_table set i_is_active=?,i_is_approve=? where i_user_id=?"))
		{
			ps.setInt(1,1);
			ps.setInt(2,1);
			ps.setInt(3,uId);
			
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
		
		try(PreparedStatement ps = connection.prepareStatement("delete from user_table where i_user_id=?"))
		{
			ps.setInt(1,uid);
			
			return ps.executeUpdate();
		}
	}
}
