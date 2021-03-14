package com.issuetracker.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.issuetracker.service.ProjectService;
import com.issuetracker.service.impl.ProjectServiceImpl;

/**
 * Servlet implementation class UpdateDIssueDetails
 */
public class UpdateDIssueDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	ProjectService projectService = new ProjectServiceImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateDIssueDetails() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int issueId = Integer.parseInt(request.getParameter("issueId"));
		int statusId = Integer.parseInt(request.getParameter("statusId"));
		int developerId = Integer.parseInt(request.getParameter("developerId"));
		String issueImpact = request.getParameter("issueImpact");
		String issuepriority = request.getParameter("priority");
		
		String message = projectService.saveIssueDetails(issueId,statusId,developerId,issueImpact,issuepriority);
		
		System.out.println(message);
		doGet(request, response);
	}

}
