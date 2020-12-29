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
			// TODO Auto-generated catch block
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
			ps.setInt(8,0);
			ps.setInt(9,0);

			return ps.executeUpdate();
		}
	}
}
