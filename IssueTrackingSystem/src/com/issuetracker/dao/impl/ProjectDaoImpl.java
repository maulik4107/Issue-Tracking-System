package com.issuetracker.dao.impl;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.issuetracker.bean.Admin;
import com.issuetracker.bean.Area;
import com.issuetracker.bean.ProjectDetails;
import com.issuetracker.dao.ProjectDao;


public class ProjectDaoImpl implements ProjectDao {

	@Override
	public int insertProjectDetails(Connection connection, Admin admin) throws SQLException {

		try (PreparedStatement ps = connection.prepareStatement(
				"insert into project_details(c_project_name,c_project_description,b_project_document,d_project_sd,d_project_ed,i_status_id,i_pm_id,i_is_active) values(?,?,?,?,?,?,?,?);")) {
			ps.setString(1, admin.getProjectName());
			ps.setString(2, admin.getDescription());
			ps.setBlob(3, admin.getDocumentStream());
			ps.setString(4, admin.getStartingDate());
			ps.setString(5, admin.getEndingDate());
			ps.setInt(6, 0);
			ps.setInt(7, 0);
			ps.setInt(8, 0);

			return ps.executeUpdate();
		}
	}

	
	
	@Override
	public List<ProjectDetails> fetchProjectDetails(Connection connection) throws SQLException {

		List<ProjectDetails> projectList = new ArrayList<ProjectDetails>();

		try (PreparedStatement ps = connection.prepareStatement("select * from project_details where i_is_active=?;")) {
			ps.setInt(1, 0);
			ResultSet resultSet = ps.executeQuery();
			while (resultSet.next()) {
				ProjectDetails project = new ProjectDetails();
				project.setProjectId(resultSet.getInt("i_pd_id"));
				project.setProjectName(resultSet.getString("c_project_name"));
				projectList.add(project);
			}
		}
		return projectList;
	}

	@Override
	public List<ProjectDetails> fetchManagerDetails(Connection connection) throws SQLException {

		List<ProjectDetails> projectManager = new ArrayList<ProjectDetails>();

		try (PreparedStatement ps = connection.prepareStatement("select * from user_table where i_role_id=?;")) {
			ps.setInt(1, 1);
			ResultSet resultSet = ps.executeQuery();
			while (resultSet.next()) {
				ProjectDetails project = new ProjectDetails();
				project.setPmId(resultSet.getInt("i_user_id"));
				project.setPmName(resultSet.getString("c_user_name"));
				projectManager.add(project);
			}
		}
		return projectManager;
	}

	@Override
	public int setManagerDetails(Connection connection, int pmId, int projectId) throws SQLException {
		try (PreparedStatement ps = connection.prepareStatement(
				"update project_details set i_status_id=?,i_pm_id=?,i_is_active=? where i_pd_id=?;")) {
			ps.setInt(1, 1);
			ps.setInt(2, pmId);
			ps.setInt(3, 1);
			ps.setInt(4, projectId);
			return ps.executeUpdate();
		}
	}

	@Override
	public String getManagerName(Connection connection, int pmId) throws SQLException {

		String name = null;
		try (PreparedStatement ps = connection
				.prepareStatement("select c_user_name from user_table where i_user_id=?;")) {
			ps.setInt(1, pmId);
			ResultSet resultSet = ps.executeQuery();
			while (resultSet.next()) {
				name = resultSet.getString("c_user_name");
			}
		}
		return name;
	}

	@Override
	public List<ProjectDetails> fetchProjectList(Connection connection) throws SQLException, IOException {

		List<ProjectDetails> projectList = new ArrayList<ProjectDetails>();

		try (PreparedStatement ps = connection.prepareStatement("select * from project_details where i_is_active=?")) {
			ps.setInt(1, 1);

			String fileName = "PDF";
			ResultSet resultSet = ps.executeQuery();
			while (resultSet.next()) {
				ProjectDetails project = new ProjectDetails();
				Blob doc;
				project.setProjectId(resultSet.getInt("i_pd_id"));
				project.setProjectName(resultSet.getString("c_project_name"));
				project.setProjectDes(resultSet.getString("c_project_name"));
				project.setProjectSd(resultSet.getString("d_project_sd"));
				project.setProjectEd(resultSet.getString("d_project_ed"));
				project.setProjectStatus(resultSet.getInt("i_status_id"));
				project.setStatusName(getStatusName(connection, resultSet.getInt("i_status_id")));
				project.setPmId(resultSet.getInt("i_pm_id"));
				project.setPmName(getManagerName(connection, resultSet.getInt("i_pm_id")));
				projectList.add(project);
			}
		}
		return projectList;
	}

	private String getStatusName(Connection connection, int int1) {

		String name = null;
		try (PreparedStatement ps = connection
				.prepareStatement("select c_status_name from status_table where i_status_id=?;")) {
			ps.setInt(1, int1);
			ResultSet resultSet = ps.executeQuery();
			while (resultSet.next()) {
				name = resultSet.getString("c_status_name");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return name;
	}



	@Override
	public InputStream getPDF(Connection connection, int id) throws SQLException, IOException {
		 String sql = "select * from project_details where i_pd_id=?";
         PreparedStatement statement = connection.prepareStatement(sql);
         statement.setInt(1, id);

         InputStream inputStream=null;
         ResultSet result = statement.executeQuery();
         if (result.next()) {
             // gets file name and file blob data
             //String fileName = result.getString("file_name");
             Blob blob = result.getBlob("b_project_document");
             inputStream = blob.getBinaryStream();
             
         }
		return inputStream;
	}



	@Override
	public ProjectDetails getProjectName(Connection connection, int projectId, int pmId) throws SQLException {
		
		ProjectDetails pd=new ProjectDetails();
		try (PreparedStatement ps = connection
				.prepareStatement("select * from project_details where i_pd_id=?")) {
			ps.setInt(1,projectId);
			ResultSet resultSet = ps.executeQuery();
			while (resultSet.next()) {
				 pd.setProjectName(resultSet.getString("c_project_name"));
				 pd.setProjectSd(resultSet.getString("d_project_sd"));
				 pd.setProjectEd(resultSet.getString("d_project_ed"));
				 pd.setProjectDes(resultSet.getString("c_project_description"));
				 pd.setPmName(getManagerName(connection,pmId));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return pd;
	}
}
