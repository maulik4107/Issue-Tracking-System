package com.issuetracker.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.issuetracker.service.ProjectService;
import com.issuetracker.service.impl.ProjectServiceImpl;

/**
 * Servlet implementation class UpdatePMIssueStatus
 */
public class UpdatePMIssueStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	ProjectService projectService = new ProjectServiceImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePMIssueStatus() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int checkClose=Integer.parseInt(request.getParameter("checkClose"));
		String updatedMsg=null;
		int issueId = Integer.parseInt(request.getParameter("issueId"));
		int statusId = Integer.parseInt(request.getParameter("statusId"));
		int proId=Integer.parseInt(request.getParameter("projectID"));
		int pmid=Integer.parseInt(request.getParameter("projectMId"));
		if(checkClose==0)
		{
			updatedMsg = projectService.saveIssueDetails(issueId,statusId);
		}
		if(checkClose==1)
		{
			updatedMsg = projectService.saveCloseIssueDetails(issueId,statusId);
		}
		request.setAttribute("ChangeStatus", updatedMsg);
		RequestDispatcher dispatcher=request.getRequestDispatcher("GetPMIssues?projectId="+proId+"&pmid="+pmid);
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
