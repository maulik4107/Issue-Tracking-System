package com.issuetracker.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.issuetracker.bean.Issue;
import com.issuetracker.bean.ModuleDetails;
import com.issuetracker.bean.ProjectDetails;
import com.issuetracker.dao.IssueDao;
import com.issuetracker.dao.ProjectDao;
import com.issuetracker.dao.TesterDao;
import com.issuetracker.dao.impl.IssueDaoImpl;
import com.issuetracker.dao.impl.ProjectDaoImpl;
import com.issuetracker.dao.impl.TesterDaoImpl;
import com.issuetracker.service.DeveloperService;
import com.issuetracker.service.ProjectService;
import com.issuetracker.service.TesterService;
import com.issuetracker.service.impl.DeveloperServiceImpl;
import com.issuetracker.service.impl.ProjectServiceImpl;
import com.issuetracker.service.impl.TesterServiceImpl;

/**
 * Servlet implementation class ReportCreation
 */
public class ReportCreation extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ProjectService projectService = new ProjectServiceImpl();
	IssueDao issueDao = new IssueDaoImpl();
	DeveloperService developerService = new DeveloperServiceImpl();
	TesterService testerService = new TesterServiceImpl();
	TesterDao testerDao = new TesterDaoImpl();
	ProjectDao projectDao = new ProjectDaoImpl();

	

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ReportCreation() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		int roleId = Integer.parseInt(request.getParameter("projectName"));
		int userId = Integer.parseInt(request.getParameter("moduleId"));
		String catagory = request.getParameter("Reportc");

		System.out.println(roleId);
		System.out.println(userId);
		System.out.println(catagory);

		if (roleId == 1) {
			List<ProjectDetails> projectList = null;
			projectList = projectService.getProjectList(userId);
			String pmname = projectService.getManagerName(userId);
			request.setAttribute("uName", pmname);
			request.setAttribute("pList", projectList);
			request.setAttribute("role", "ProjectManager");
			request.setAttribute("i",1);
			RequestDispatcher dispatcher = request.getRequestDispatcher("viewreport.jsp");
			dispatcher.forward(request, response);
		}
		if (roleId == 2) {
			System.out.println("inside");

			if (catagory.equals("IssueWiseD")) {
				System.out.println("inside");
				List<Issue> issueList=null; 
				issueList = projectService.getMyIssues(userId);
				String developerName = projectService.fetchDeveloperName(userId);
				System.out.println(developerName);
				request.setAttribute("uName", developerName);
				request.setAttribute("pList", issueList);
				request.setAttribute("role", "Developer");
				request.setAttribute("i",2);
				RequestDispatcher dispatcher = request.getRequestDispatcher("viewreport.jsp");
				dispatcher.forward(request, response);
			}
			if (catagory.equals("ModuleWise")) {

				List<ModuleDetails> moduleList =null;
				moduleList = developerService.fetchModuleDetails(userId);
				String developerName = projectService.fetchDeveloperName(userId);
				request.setAttribute("uName", developerName);
				request.setAttribute("pList", moduleList);
				request.setAttribute("role", "Developer");
				request.setAttribute("i",3);
				RequestDispatcher dispatcher = request.getRequestDispatcher("viewreport.jsp");
				dispatcher.forward(request, response);
			}
		}
		
		if (roleId == 3) {
			if (catagory.equals("IssueWiseTester")) {

				List<Issue> issueList=null;
				 issueList = projectService.getMyIssuesTester(userId);
				String testerName = projectService.getTesterName(userId);
				request.setAttribute("uName", testerName);
				request.setAttribute("pList", issueList);
				request.setAttribute("role", "Tester");
				request.setAttribute("i",2);
				RequestDispatcher dispatcher = request.getRequestDispatcher("viewreport.jsp");
				dispatcher.forward(request, response);
			}
			if (catagory.equals("ModuleWise")) {

				List<ModuleDetails> moduleList=null;
				moduleList= testerService.fetchModules(userId);
				String testerName = projectService.getTesterName(userId);
				request.setAttribute("uName", testerName);
				request.setAttribute("pList", moduleList);
				request.setAttribute("role", "Tester");
				request.setAttribute("i",3);
				RequestDispatcher dispatcher = request.getRequestDispatcher("viewreport.jsp");
				dispatcher.forward(request, response);
			}
		}
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
