package com.issuetracker.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.issuetracker.bean.Area;
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

				area.setAreaName(resultSet.getString(2));

				areaList.add(area);
			}
		}
		resultSet.close();
		return areaList;
	}

}
