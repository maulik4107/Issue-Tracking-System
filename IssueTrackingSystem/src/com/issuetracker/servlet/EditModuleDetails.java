package com.issuetracker.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.issuetracker.bean.ModuleDetails;
import com.issuetracker.bean.ProjectDetails;
import com.issuetracker.bean.Status;
import com.issuetracker.bean.User;
import com.issuetracker.service.ProjectService;
import com.issuetracker.service.impl.ProjectServiceImpl;

/**
 * Servlet implementation class EditModuleDetails
 */
public class EditModuleDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	ProjectService projectService = new ProjectServiceImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditModuleDetails() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int moduleId = Integer.parseInt(request.getParameter("id"));
		int pid = Integer.parseInt(request.getParameter("pId"));
				
		ModuleDetails module = projectService.fetchModule(moduleId);
				
		List<Status> statusList = projectService.fetchStatus();
								
		List<ProjectDetails> projectList = projectService.getProjectList(pid);
				
		List<User> developerList = projectService.fetchDevelopersDetails();
				
		request.setAttribute("projectLists",projectList);
		request.setAttribute("editmodule", module);
		request.setAttribute("statusList", statusList);
		request.setAttribute("developerList", developerList);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("editmodules.jsp");
		dispatcher.forward(request, response);
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
