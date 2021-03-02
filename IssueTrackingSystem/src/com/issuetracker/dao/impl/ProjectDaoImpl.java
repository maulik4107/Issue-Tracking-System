package com.issuetracker.dao.impl;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.issuetracker.bean.Admin;
import com.issuetracker.bean.Area;
import com.issuetracker.bean.ModuleDetails;
import com.issuetracker.bean.ProjectDetails;
import com.issuetracker.bean.Status;
import com.issuetracker.bean.User;
import com.issuetracker.dao.IssueDao;
import com.issuetracker.dao.ProjectDao;
import java.util.Base64;

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
			ps.setInt(6, 1);
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
			resultSet.close();
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
			resultSet.close();
		}
		return projectManager;
	}

	@Override
	public int setManagerDetails(Connection connection, int pmId, int projectId) throws SQLException {
		try (PreparedStatement ps = connection.prepareStatement(
				"update project_details set i_status_id=?,i_pm_id=?,i_is_active=? where i_pd_id=?;")) {
			ps.setInt(1, 2);
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
			resultSet.close();
		}
		return name;
	}

	@Override
	public List<ProjectDetails> fetchProjectList(Connection connection) throws SQLException, IOException {

		List<ProjectDetails> projectList = new ArrayList<ProjectDetails>();

		try (PreparedStatement ps = connection.prepareStatement("select * from project_details where i_is_active=? || i_is_active=?")) {
			ps.setInt(1,1);
			ps.setInt(2,0);
			
			String fileName = "PDF";
			ResultSet resultSet = ps.executeQuery();
			while (resultSet.next()) 
			{
				ProjectDetails project = new ProjectDetails();
				Blob doc;
				project.setProjectId(resultSet.getInt("i_pd_id"));
				project.setProjectName(resultSet.getString("c_project_name"));
				project.setProjectDes(resultSet.getString("c_project_description"));
				project.setProjectSd(resultSet.getString("d_project_sd"));
				project.setProjectEd(resultSet.getString("d_project_ed"));
				project.setProjectStatus(resultSet.getInt("i_status_id"));
				project.setStatusName(getProjectStatusName(connection, resultSet.getInt("i_status_id")));
				project.setPmId(resultSet.getInt("i_pm_id"));
				project.setPmName(getManagerName(connection, resultSet.getInt("i_pm_id")));
				byte[] fileData = resultSet.getBytes("b_project_document");
				if (null != fileData && fileData.length > 0) {
					String fileString = Base64.getEncoder().encodeToString(fileData);
					project.setDocumentString(fileString);
				}
				
				projectList.add(project);
			}
			resultSet.close();
		}
		return projectList;
	}

	@Override
	public InputStream getPDF(Connection connection, int id) throws SQLException, IOException {
		String sql = "select * from project_details where i_pd_id=?";
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setInt(1, id);

		InputStream inputStream = null;
		ResultSet result = statement.executeQuery();
		if (result.next()) {
			// gets file name and file blob data
			// String fileName = result.getString("file_name");
			Blob blob = result.getBlob("b_project_document");
			inputStream = blob.getBinaryStream();
		}
		statement.close();
		result.close();
		return inputStream;
	}

	@Override
	public ProjectDetails getProjectName(Connection connection, int projectId, int pmId) throws SQLException {

		ProjectDetails pd = new ProjectDetails();
		try (PreparedStatement ps = connection.prepareStatement("select * from project_details where i_pd_id=?")) {
			ps.setInt(1, projectId);
			ResultSet resultSet = ps.executeQuery();
			while (resultSet.next()) {
				pd.setProjectName(resultSet.getString("c_project_name"));
				pd.setProjectSd(resultSet.getString("d_project_sd"));
				pd.setProjectEd(resultSet.getString("d_project_ed"));
				pd.setProjectDes(resultSet.getString("c_project_description"));
				pd.setPmName(getManagerName(connection, pmId));
			}
			resultSet.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return pd;
	}

	@Override
	public ProjectDetails getProjectDetails(Connection connection, int pId) throws SQLException {
		// TODO Auto-generated method stub

		ProjectDetails projectDetails = new ProjectDetails();

		try (PreparedStatement ps = connection.prepareStatement("select * from project_details where i_pd_id=?")) {
			ps.setInt(1, pId);

			ResultSet resultSet = ps.executeQuery();

			while (resultSet.next()) {
				projectDetails.setProjectId(resultSet.getInt("i_pd_id"));
				projectDetails.setProjectName(resultSet.getString("c_project_name"));
				projectDetails.setPmId(resultSet.getInt("i_pm_id"));
				projectDetails.setProjectDes(resultSet.getString("c_project_description"));
				projectDetails.setProjectStatus(resultSet.getInt("i_status_id"));
				projectDetails.setProjectSd(resultSet.getString("d_project_sd"));
				projectDetails.setProjectEd(resultSet.getString("d_project_ed"));
				projectDetails.setPmName(getManagerName(connection, projectDetails.getPmId()));
				projectDetails.setStatusName(getProjectStatusName(connection, projectDetails.getProjectStatus()));

				byte[] fileData = resultSet.getBytes("b_project_document");
				if (null != fileData && fileData.length > 0) {
					String fileString = Base64.getEncoder().encodeToString(fileData);
					projectDetails.setDocumentString(fileString);
				}
			}
			resultSet.close();
		}
		return projectDetails;
	}

	@Override
	public List<ProjectDetails> getProjectStatus(Connection connection) throws SQLException {
		// TODO Auto-generated method stub

		List<ProjectDetails> statusNames = new ArrayList<ProjectDetails>();

		try (PreparedStatement ps = connection.prepareStatement("select * from status_table")) {
			ResultSet resultSet = ps.executeQuery();

			while (resultSet.next()) {
				ProjectDetails details = new ProjectDetails();

				details.setProjectStatus(resultSet.getInt("i_status_id"));

				if (resultSet.getInt("i_status_id") != 1) {
					details.setStatusName(resultSet.getString("c_status_name"));
					statusNames.add(details);
				}
			}
			resultSet.close();
		}
		return statusNames;
	}

	@Override
	public int deleteProjectDetails(Connection connection, int projectId) throws SQLException {
		// TODO Auto-generated method stub

		try (PreparedStatement ps = connection
				.prepareStatement("update project_details set i_is_active=? where i_pd_id=?")) {
			ps.setInt(1, -1);
			ps.setInt(2, projectId);

			return ps.executeUpdate();
		}
	}

	@Override
	public int updateProjectDetails(Connection connection, ProjectDetails project) throws SQLException {
		// TODO Auto-generated method stub

		try (PreparedStatement ps = connection.prepareStatement(
				"update project_details set c_project_name=?,c_project_description=?,b_project_document=COALESCE(?,b_project_document),d_project_sd=?,d_project_ed=?,i_status_id=?,i_pm_id=? where i_pd_id=?")) {
			ps.setString(1, project.getProjectName());
			ps.setString(2, project.getProjectDes());
			ps.setBlob(3, project.getDocumentStream());
			ps.setString(4, project.getProjectSd());
			ps.setString(5, project.getProjectEd());
			ps.setInt(6, project.getProjectStatus());
			ps.setInt(7, project.getPmId());
			ps.setInt(8, project.getProjectId());

			return ps.executeUpdate();
		}
	}

	@Override
	public List<ProjectDetails> getAllocatedProjectList(Connection connection, int pid) throws SQLException {
		// TODO Auto-generated method stub
		List<ProjectDetails> projectList = new ArrayList<ProjectDetails>();

		try (PreparedStatement ps = connection.prepareStatement("select * from project_details where i_pm_id=?")) {
			ps.setInt(1, pid);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				ProjectDetails p = new ProjectDetails();

				p.setProjectId(rs.getInt(1));
				p.setProjectName(rs.getString("c_project_name"));
				p.setProjectDes(rs.getString("c_project_description"));
				p.setProjectSd(rs.getString("d_project_sd"));
				p.setProjectEd(rs.getString("d_project_ed"));
				p.setProjectStatus(rs.getInt("i_status_id"));
				p.setDocumentString(rs.getString(4));
				p.setStatusName(getProjectStatusName(connection, p.getProjectStatus()));

				projectList.add(p);
			}
			rs.close();
		}
		return projectList;
	}

	@Override
	public int insertModuleDetails(Connection connection, ModuleDetails moduleDetails) throws SQLException {
		try (PreparedStatement ps = connection.prepareStatement(
				"insert into module_table(c_module_name,c_module_description,d_module_sd,d_module_ed,i_status_id,i_pd_id,i_developer_id,i_tester_id,i_is_active) values(?,?,?,?,?,?,?,?,?);")) {
			ps.setString(1, moduleDetails.getModuleName());
			ps.setString(2, moduleDetails.getModuleDes());
			ps.setString(3, moduleDetails.getModuleSd());
			ps.setString(4, moduleDetails.getModuleEd());
			ps.setInt(5, 1);
			ps.setInt(6, moduleDetails.getProjectId());
			ps.setInt(7, 0);
			ps.setInt(8, 0);
			ps.setInt(9, 0);

			return ps.executeUpdate();
		}
	}

	@Override
	public List<ModuleDetails> getModuleDetails(Connection connection, int projectId) throws SQLException {
		// TODO Auto-generated method stub
		List<ModuleDetails> moduleDetails = new ArrayList<ModuleDetails>();
		try (PreparedStatement ps = connection
				.prepareStatement("select * from module_table where i_pd_id=? and i_is_active=?")) {
			ps.setInt(1, projectId);
			ps.setInt(2, 0);

			ResultSet resultSet = ps.executeQuery();

			while (resultSet.next()) {
				ModuleDetails modules = new ModuleDetails();
				modules.setModuleId(resultSet.getInt(1));
				modules.setModuleSd(resultSet.getString(4));
				modules.setModuleEd(resultSet.getString(5));
				modules.setModuleName(resultSet.getString(2));
				modules.setModuleDes(resultSet.getString(3));
				modules.setStatusId(resultSet.getInt(6));
				modules.setProjectId(resultSet.getInt(7));
				modules.setDeveloperId(resultSet.getInt(8));
				modules.setTesterId(resultSet.getInt(9));
				modules.setIs_active(resultSet.getInt(10));
				modules.setStatusName(getModuleStatusName(connection,resultSet.getInt(6)));
				modules.setProjectName(getProjectName(connection,modules.getProjectId()));
				modules.setDeveloperName(getDeveloperName(connection,modules.getDeveloperId()));
				moduleDetails.add(modules);
			}
			resultSet.close();
		}
		return moduleDetails;
	}

	@Override
	public int saveModuleDetails(Connection connection, int pId, int moduleId, int developerId) throws SQLException {
		// TODO Auto-generated method stub
		try (PreparedStatement ps = connection.prepareStatement(
				"update module_table set i_developer_id=?,i_tester_id=?,i_is_active=? where i_module_id=?")) {
			ps.setInt(1, developerId);
			ps.setInt(2, 0);
			ps.setInt(3, 1);
			ps.setInt(4, moduleId);

			return ps.executeUpdate();
		}
	}

	@Override
	public List<User> getDevelopersDetails(Connection connection) throws SQLException {
		// TODO Auto-generated method stub
		IssueDao issueDao = new IssueDaoImpl();
		List<User> user = new ArrayList<User>();
		try (PreparedStatement ps = connection.prepareStatement("select * from user_table where i_role_id=?")) {
			ps.setInt(1, 2);

			ResultSet resultSet = ps.executeQuery();
			while (resultSet.next()) {
				User developers = new User();
				developers.setUserId(resultSet.getInt(1));
				developers.setUserName(resultSet.getString(2));
				developers.setUserContact(resultSet.getString(3));
				developers.setUserAddress(resultSet.getString(4));
				developers.setAreaId(resultSet.getInt(5));
				developers.setUserEmail(resultSet.getString(6));
				developers.setRoleId(resultSet.getInt(8));
				developers.setAreaName(issueDao.getAreaName(connection, resultSet.getInt(5)));
				user.add(developers);
			}
		}
		return user;
	}

	@Override
	public List<User> getTestersDetails(Connection connection) throws SQLException {
		// TODO Auto-generated method stub
		IssueDao issueDao = new IssueDaoImpl();
		List<User> user = new ArrayList<User>();
		try (PreparedStatement ps = connection.prepareStatement("select * from user_table where i_role_id=?")) {
			ps.setInt(1, 3);

			ResultSet resultSet = ps.executeQuery();
			while (resultSet.next()) {
				User tester = new User();
				tester.setUserId(resultSet.getInt(1));
				tester.setUserName(resultSet.getString(2));
				tester.setUserContact(resultSet.getString(3));
				tester.setUserAddress(resultSet.getString(4));
				tester.setAreaId(resultSet.getInt(5));
				tester.setUserEmail(resultSet.getString(6));
				tester.setRoleId(resultSet.getInt(8));
				tester.setAreaName(issueDao.getAreaName(connection, resultSet.getInt(5)));
		
				user.add(tester);
			}
		}
		return user;
	}

	@Override
	public String getProjectName(Connection connection, int projectId) throws SQLException {
		// TODO Auto-generated method stub
		String projectName = null;
		try (PreparedStatement ps = connection.prepareStatement("select c_project_name from project_details where i_pd_id=?")) {
			ps.setInt(1, projectId);
			ResultSet resultSet = ps.executeQuery();
			while (resultSet.next()) {
				projectName = resultSet.getString("c_project_name");
			}
			resultSet.close();
		}
		return projectName;
	}

	@Override
	public String getDeveloperName(Connection connection, int developerId) throws SQLException {
		// TODO Auto-generated method stub
		String dName = null;
		try (PreparedStatement ps = connection.prepareStatement("select c_user_name from user_table where i_user_id=?")) {
			ps.setInt(1, developerId);
			ResultSet resultSet = ps.executeQuery();
			while (resultSet.next()) {
				dName = resultSet.getString("c_user_name");
			}
			resultSet.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dName;
	}

	@Override
	public List<ModuleDetails> getAllModulesDetails(Connection connection,int projectId) throws SQLException {
		// TODO Auto-generated method stub
		List<ModuleDetails> moduleDetails = new ArrayList<ModuleDetails>();
		try (PreparedStatement ps = connection
				.prepareStatement("select * from module_table where i_pd_id=?")) {
			ps.setInt(1, projectId);

			ResultSet resultSet = ps.executeQuery();

			while (resultSet.next()) {
				ModuleDetails modules = new ModuleDetails();
				modules.setModuleId(resultSet.getInt(1));
				modules.setModuleSd(resultSet.getString(4));
				modules.setModuleEd(resultSet.getString(5));
				modules.setModuleName(resultSet.getString(2));
				modules.setModuleDes(resultSet.getString(3));
				modules.setStatusId(resultSet.getInt(6));
				modules.setProjectId(resultSet.getInt(7));
				modules.setDeveloperId(resultSet.getInt(8));
				modules.setTesterId(resultSet.getInt(9));
				modules.setIs_active(resultSet.getInt(10));
				modules.setStatusName(getModuleStatusName(connection,resultSet.getInt(6)));
				modules.setProjectName(getProjectName(connection,modules.getProjectId()));
				modules.setDeveloperName(getDeveloperName(connection,modules.getDeveloperId()));
				
				moduleDetails.add(modules);
			}
			resultSet.close();
		}

		return moduleDetails;
	}

	@Override
	public int deleteModuleDetails(Connection connection, int moduleId) throws SQLException {
		// TODO Auto-generated method stub
		int deletedId = 0;
		
		try(PreparedStatement ps = connection.prepareStatement("update module_table set i_is_active=? where i_module_id=?"))
		{
			ps.setInt(1,-1);
			ps.setInt(2,moduleId);
			deletedId = ps.executeUpdate();
		}
		return deletedId;
	}

	@Override
	public ModuleDetails getModule(Connection connection, int moduleId) throws SQLException {
		// TODO Auto-generated method stub
		ModuleDetails module = new ModuleDetails();
		try(PreparedStatement ps = connection.prepareStatement("select * from module_table where i_module_id=?"))
		{
			ps.setInt(1,moduleId);
			
			ResultSet resultSet = ps.executeQuery();
			
			while(resultSet.next())
			{
				module.setModuleId(resultSet.getInt(1));
				module.setModuleName(resultSet.getString(2));
				module.setModuleDes(resultSet.getString(3));
				module.setModuleSd(resultSet.getString(4));
				module.setModuleEd(resultSet.getString(5));
				module.setStatusId(resultSet.getInt(6));
				module.setStatusName(getModuleStatusName(connection,resultSet.getInt(6)));
				module.setProjectId(resultSet.getInt(7));
				module.setProjectName(getProjectName(connection,module.getProjectId()));
				module.setDeveloperId(resultSet.getInt(8));
				module.setDeveloperName(getDeveloperName(connection,module.getDeveloperId()));
				module.setTesterId(resultSet.getInt(9));
				module.setTesterName(getTesterName(connection,module.getTesterId()));
			}
			resultSet.close();
		}
		return module;
	}

	@Override
	public String getTesterName(Connection connection, int testerId) throws SQLException {
		// TODO Auto-generated method stub
		String testerName = null;
		try (PreparedStatement ps = connection.prepareStatement("select c_user_name from user_table where i_user_id=?")) {
			ps.setInt(1, testerId);
			ResultSet resultSet = ps.executeQuery();
			while (resultSet.next()) {
				testerName = resultSet.getString("c_user_name");
			}
			resultSet.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return testerName;
	}

	@Override
	public List<Status> getStatus(Connection connection) throws SQLException {
		// TODO Auto-generated method stub
		List<Status> statusList = new ArrayList<Status>();
		try(PreparedStatement ps = connection.prepareStatement("select * from status_table"))
		{
			ResultSet resultSet = ps.executeQuery();
			
			while(resultSet.next())
			{
				Status status = new Status();
				status.setStatusId(resultSet.getInt(1));
				status.setStatusName(resultSet.getString(3));
				statusList.add(status);
			}
			resultSet.close();
		}
		return statusList;
	}

	@Override
	public int updateModuleDetails(Connection connection, ModuleDetails module) throws SQLException {
		// TODO Auto-generated method stub
		try(PreparedStatement ps = connection.prepareStatement("update module_table set c_module_name=?,c_module_description=?,d_module_sd=?,d_module_ed=?,i_status_id=?,i_developer_id=? where i_module_id=?"))
		{
			ps.setString(1,module.getModuleName());
			ps.setString(2,module.getModuleDes());
			ps.setString(3,module.getModuleSd());
			ps.setString(4,module.getModuleEd());
			ps.setInt(5,module.getStatusId());
			ps.setInt(6,module.getDeveloperId());
			ps.setInt(7,module.getModuleId());
			
			return ps.executeUpdate();
		}
	}

	@Override
	public List<ProjectDetails> fetchAllProject(Connection connection) throws SQLException {
		
		List<ProjectDetails> projectList = new ArrayList<ProjectDetails>();
		try(PreparedStatement ps = connection.prepareStatement("select * from project_details"))
		{
			ResultSet resultSet = ps.executeQuery();
			
			while(resultSet.next())
			{
				ProjectDetails project = new ProjectDetails();
				project.setProjectId(resultSet.getInt(1));
				project.setProjectName(resultSet.getString(2));
				projectList.add(project);
			}
			resultSet.close();
		}
		return projectList;
	}

	@Override
	public List<ModuleDetails> fetchAllModuleDetails(int pid, Connection connection) throws SQLException {
		
		List<ModuleDetails> moduleList = new ArrayList<ModuleDetails>();
		try(PreparedStatement ps = connection.prepareStatement("select * from module_table where i_pd_id=? AND i_is_active=?"))
		{
			ps.setInt(1,pid);
			ps.setInt(2,1);
			ResultSet resultSet = ps.executeQuery();
			
			while(resultSet.next())
			{
				ModuleDetails module = new ModuleDetails();
				module.setModuleId(resultSet.getInt(1));
				module.setModuleName(resultSet.getString(2));
				module.setModuleDes(resultSet.getString(3));
				module.setModuleSd(resultSet.getString(4));
				module.setModuleEd(resultSet.getString(5));
				module.setStatusId(resultSet.getInt(6));
				module.setStatusName(getModuleStatusName(connection,resultSet.getInt(6)));
				module.setProjectId(resultSet.getInt(7));
				module.setProjectName(getProjectName(connection,module.getProjectId()));
				module.setDeveloperId(resultSet.getInt(8));
				module.setDeveloperName(getDeveloperName(connection,resultSet.getInt(8)));
				module.setTesterId(resultSet.getInt(9));
				module.setTesterName(getTesterName(connection,resultSet.getInt(9)));
				
				moduleList.add(module);
			}
			resultSet.close();
		}
		return moduleList;
	}

	@Override
	public int fetchPMId(Connection connection, int pid) throws SQLException {
		
		int id=0;
		try(PreparedStatement ps = connection.prepareStatement("select i_pm_id from project_details where i_pd_id=?"))
		{
			ps.setInt(1,pid);
			ResultSet resultSet = ps.executeQuery();
			
			while(resultSet.next())
			{
				id=resultSet.getInt("i_pm_id");
			}
			resultSet.close();
		}
		return id;
	}

	@Override
	public String getModuleStatusName(Connection connection, int moduleStatusId) throws SQLException {
		// TODO Auto-generated method stub
		String name = null;
		try (PreparedStatement ps = connection
				.prepareStatement("select c_module_status from status_table where i_status_id=?;")) {
			ps.setInt(1, moduleStatusId);
			ResultSet resultSet = ps.executeQuery();
			while (resultSet.next()) {
				name = resultSet.getString("c_module_status");
			}
			resultSet.close();
		}
		return name;
	}

	@Override
	public String getProjectStatusName(Connection connection, int projectStatusId) throws SQLException {
		// TODO Auto-generated method stub
		String name = null;
		try (PreparedStatement ps = connection
				.prepareStatement("select c_status_name from status_table where i_status_id=?;")) {
			ps.setInt(1, projectStatusId);
			ResultSet resultSet = ps.executeQuery();
			while (resultSet.next()) {
				name = resultSet.getString("c_status_name");
			}
			resultSet.close();
		}
		return name;
	}
}
