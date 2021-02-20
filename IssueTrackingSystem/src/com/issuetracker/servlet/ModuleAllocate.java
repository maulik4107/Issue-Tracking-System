package com.issuetracker.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.issuetracker.bean.ProjectDetails;
import com.issuetracker.bean.User;
import com.issuetracker.service.IssueService;
import com.issuetracker.service.ProjectService;
import com.issuetracker.service.impl.IssueServiceImpl;
import com.issuetracker.service.impl.ProjectServiceImpl;

/**
 * Servlet implementation class ModuleAllocate
 */
public class ModuleAllocate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ProjectService projectService = new ProjectServiceImpl();
	IssueService issueService = new IssueServiceImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModuleAllocate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<ProjectDetails> projectList = null;
		List<User> developerList=null;
		
		int pid = Integer.parseInt(request.getParameter("id"));
				
		projectList = projectService.getProjectList(pid);
		try {
			developerList=issueService.getDeveloperList();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("projectList",projectList);
		request.setAttribute("developerList",developerList);
		
		RequestDispatcher dispatcher=request.getRequestDispatcher("allocatemodule.jsp");
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
