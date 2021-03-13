package com.issuetracker.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.issuetracker.bean.ProjectDetails;
import com.issuetracker.service.ProjectService;
import com.issuetracker.service.impl.ProjectServiceImpl;

/**
 * Servlet implementation class ChangeIssueStatusPM
 */
public class ChangeIssueStatusPM extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	ProjectService projectService = new ProjectServiceImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeIssueStatusPM() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<ProjectDetails> plist=null;

		int pmid=Integer.parseInt(request.getParameter("id"));
		plist=projectService.getPMProjects(pmid);
		request.setAttribute("projectList", plist);
		request.setAttribute("pmid", pmid);
		RequestDispatcher dispatcher = request.getRequestDispatcher("changeissuepm.jsp");
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
