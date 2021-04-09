package com.issuetracker.service.impl;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.issuetracker.bean.Admin;
import com.issuetracker.bean.ModuleDetails;
import com.issuetracker.bean.ProjectDetails;
import com.issuetracker.bean.Status;
import com.issuetracker.bean.User;
import com.issuetracker.dao.ProjectDao;
import com.issuetracker.dao.impl.ProjectDaoImpl;
import com.issuetracker.service.ProjectService;
import com.issuetracker.utill.CommonDriver;

public class ProjectServiceImpl implements ProjectService {

	ProjectDao projectDao = new ProjectDaoImpl();

	@Override
	public String saveProjectDetails(Admin admin) throws SQLException {

		int insertedId = 0;
		try (Connection connection = CommonDriver.getConnection()) {
			insertedId = projectDao.insertProjectDetails(connection, admin);
			if (insertedId > 0) {
				return "Project Created Successfully!!";
			} else {
				return "Project Creation Failed !!!";
			}
		}
	}

	@Override
	public List<ProjectDetails> getProjectDetails() throws SQLException {

		try (Connection connection = CommonDriver.getConnection()) {
			return projectDao.fetchProjectDetails(connection);
		}
	}

	@Override
	public List<ProjectDetails> getManagerDetails() throws SQLException {
		try (Connection connection = CommonDriver.getConnection()) {
			return projectDao.fetchManagerDetails(connection);
		}
	}

	@Override
	public String saveManagerDetail(int pmId, int projectId) throws SQLException {
		int updatedId = 0;
		String pName = null;

		try (Connection connection = CommonDriver.getConnection()) {
			updatedId = projectDao.setManagerDetails(connection, pmId, projectId);
			pName = projectDao.getManagerName(connection, pmId);
		}
		if (updatedId > 0) {
			return " Project Allocated to " + pName + " Successfull !!";
		} else {
			return " Project Allocation Failed";
		}
	}

	@Override
	public List<ProjectDetails> getProjectList() throws SQLException, IOException {
		try (Connection connection = CommonDriver.getConnection()) {
			return projectDao.fetchProjectList(connection);
		}
	}

	@Override
	public InputStream getPDf(int id) throws SQLException, IOException {
		try (Connection connection = CommonDriver.getConnection()) {
			return projectDao.getPDF(connection, id);
		}

	}

	@Override
	public ProjectDetails getProjectName(int projectId, int pmId) throws SQLException {
		try (Connection connection = CommonDriver.getConnection()) {
			return projectDao.getProjectName(connection, projectId, pmId);
		}
	}

	@Override
	public ProjectDetails selectProjectDetails(int pId) {
		// TODO Auto-generated method stub
		try (Connection connection = CommonDriver.getConnection()) {
			return projectDao.getProjectDetails(connection, pId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<ProjectDetails> getStatus() {
		// TODO Auto-generated method stub
		try (Connection connection = CommonDriver.getConnection()) {
			return projectDao.getProjectStatus(connection);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public String removeProjectDetails(int projectId) {
		// TODO Auto-generated method stub
		int deletedId = 0;

		try (Connection connection = CommonDriver.getConnection()) {
			deletedId = projectDao.deleteProjectDetails(connection, projectId);

			if (deletedId > 0) {
				return "Project Deleted Successfully!!!!!";
			} else {
				return "Soryy!!! Project Not Deleted";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public String setProjectDetails(ProjectDetails project) {
		// TODO Auto-generated method stub
		int updatedId = 0;
		try (Connection connection = CommonDriver.getConnection()) {
			updatedId = projectDao.updateProjectDetails(connection, project);

			if (updatedId > 0) {
				System.out.println("Project Updated Success");
				return "Project Updated Successfully!!!!!";
			} else {
				System.out.println("Project not upated");
				return "Soryy!!! Project Not Updated..";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;

	}

	@Override
	public List<ProjectDetails> getProjectList(int pid) {
		// TODO Auto-generated method stub

		try (Connection connection = CommonDriver.getConnection()) {
			return projectDao.getAllocatedProjectList(connection, pid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public String saveModuleDetails(ModuleDetails moduleDetails) {

		int t = 0;
		try (Connection connection = CommonDriver.getConnection()) {
			t = projectDao.insertModuleDetails(connection, moduleDetails);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (t > 0) {
			return "Module Created Successfully !";
		} else {
			return "Module Creation failed !!";
		}
	}

	@Override
	public List<ModuleDetails> fetchModuleDetails(int projectId) {
		// TODO Auto-generated method stub
		try (Connection connection = CommonDriver.getConnection()) {
			return projectDao.getModuleDetails(connection, projectId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public String saveModuleDetails(int pId, int moduleId, int developerId) {
		// TODO Auto-generated method stub
		int updatedId = 0;
		try (Connection connection = CommonDriver.getConnection()) {
			updatedId = projectDao.saveModuleDetails(connection, pId, moduleId, developerId);

			if (updatedId > 0) {
				return "Module Allocated Successfully!!!!!";
			} else {
				return "Module is Not Allocated Successfully!!!!!";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<User> fetchDevelopersDetails() {
		// TODO Auto-generated method stub
		try (Connection connection = CommonDriver.getConnection()) {
			return projectDao.getDevelopersDetails(connection);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<User> fetchTestersDetails() {
		// TODO Auto-generated method stub
		try (Connection connection = CommonDriver.getConnection()) {
			return projectDao.getTestersDetails(connection);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<ModuleDetails> fetchAllModulesDetails(int projectId) {
		// TODO Auto-generated method stub
		try (Connection connection = CommonDriver.getConnection()) {
			return projectDao.getAllModulesDetails(connection, projectId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public String removeModuleDetails(int moduleId) {
		// TODO Auto-generated method stub
		int deletedId = 0;
		try (Connection connection = CommonDriver.getConnection()) {
			deletedId = projectDao.deleteModuleDetails(connection, moduleId);

			if (deletedId > 0) {
				return "Module is Deleted Successfully!!!!!!";
			} else {
				return "Module is Not Deleted Successfully!!!!!";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public ModuleDetails fetchModule(int moduleId) {
		// TODO Auto-generated method stub
		ModuleDetails module = null;
		try (Connection connection = CommonDriver.getConnection()) {
			module = projectDao.getModule(connection, moduleId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return module;
	}

	@Override
	public List<Status> fetchStatus() {
		// TODO Auto-generated method stub
		try (Connection connection = CommonDriver.getConnection()) {
			return projectDao.getStatus(connection);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public String editModuleDetails(ModuleDetails module) {
		// TODO Auto-generated method stub
		int updatedId = 0;
		try (Connection connection = CommonDriver.getConnection()) {
			updatedId = projectDao.updateModuleDetails(connection, module);

			if (updatedId > 0) {
				return "Module Updated Successfully!!!!!";
			} else {
				return "Sorry! Module is not Updated Successfully.";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<ProjectDetails> getAllProjectDetails() {

		try (Connection connection = CommonDriver.getConnection()) {
			return projectDao.fetchAllProject(connection);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<ModuleDetails> getAllModuleDetails(int pid) {
		try (Connection connection = CommonDriver.getConnection()) {
			return projectDao.fetchAllModuleDetails(pid, connection);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public int getProjectManagerId(int pid) {
		int id = 0;
		try (Connection connection = CommonDriver.getConnection()) {
			id = projectDao.fetchPMId(connection, pid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return id;
	}

	@Override
	public String allocateTesterModule(int pId, int moduleId, int testerId) {
		int updatedId = 0;
		try (Connection connection = CommonDriver.getConnection()) {
			updatedId = projectDao.testermodule(connection, pId, moduleId, testerId);

			if (updatedId > 0) {
				return "Module Allocated Successfully!!!!!";
			} else {
				return "Module is Not Allocated Successfully!!!!!";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<ModuleDetails> fetchReadyModules(int projectId) {
		// TODO Auto-generated method stub
		System.out.println("inside Service");
		try (Connection connection = CommonDriver.getConnection()) {
			return projectDao.getReadyModuleDetails(connection, projectId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public ModuleDetails getModuleDetails(int moduleId, int developerId) {
		try (Connection connection = CommonDriver.getConnection()) {
			return projectDao.fetchModuleDetails(connection, moduleId, developerId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public ModuleDetails getTesterModuleDetails(int moduleId, int testerId) {
		try (Connection connection = CommonDriver.getConnection()) {
			return projectDao.fetchTesterModule(connection, moduleId, testerId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<ProjectDetails> getProjectList(int pmId, int developerId, int isActive) {
		// TODO Auto-generated method stub
		try (Connection connection = CommonDriver.getConnection()) {
			List<Integer> projectIdList = projectDao.getProjectDetails(connection, developerId, isActive);
			return projectDao.getModuleProjectDetails(connection, pmId, projectIdList);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<ProjectDetails> getTesterProjectsList(int pid, int isactive, int statusId) {
		// TODO Auto-generated method stub
		try (Connection connection = CommonDriver.getConnection()) {
			List<Integer> projectIdList = projectDao.getTesterProjectDetails(connection, isactive, statusId);
			return projectDao.getModuleProjectDetails(connection, pid, projectIdList);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<ProjectDetails> getPMProjects(int pmid) {
		try (Connection connection = CommonDriver.getConnection()) {
			return projectDao.fetchAllProject(connection, pmid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public String getDeveloperName(int moduleId) {
		// TODO Auto-generated method stub
		try (Connection connection = CommonDriver.getConnection()) {
			return projectDao.fetchDeveloperNameForIssue(connection, moduleId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public String saveIssueDetails(int issueId, int statusId, int developerId, String issueImpact,
			String issuepriority) {
		System.out.println("service Layer");
		// TODO Auto-generated method stub
		try (Connection connection = CommonDriver.getConnection()) {
			return projectDao.updateIssueDetails(connection, issueId, statusId, developerId, issueImpact,
					issuepriority);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public String saveIssueDetails(int issueId, int statusId) {
		// TODO Auto-generated method stub
		try (Connection connection = CommonDriver.getConnection()) {
			return projectDao.updateManagerIssueStatus(connection, issueId, statusId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public String saveCloseIssueDetails(int issueId, int statusId) {
		// TODO Auto-generated method stub
		try (Connection connection = CommonDriver.getConnection()) {
			return projectDao.updateManagerCloseIssueStatus(connection, issueId, statusId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public int changeModuleStatus(int moduleId) {
		// TODO Auto-generated method stub
		try (Connection connection = CommonDriver.getConnection()) {
			return projectDao.updateModuleStatusToCompleted(connection,moduleId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
}
