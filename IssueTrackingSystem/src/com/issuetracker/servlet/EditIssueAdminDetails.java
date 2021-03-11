package com.issuetracker.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.issuetracker.bean.Issue;
import com.issuetracker.bean.User;
import com.issuetracker.service.ProjectService;
import com.issuetracker.service.TesterService;
import com.issuetracker.service.impl.ProjectServiceImpl;
import com.issuetracker.service.impl.TesterServiceImpl;

/**
 * Servlet implementation class EditIssueAdminDetails
 */
public class EditIssueAdminDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	TesterService testerService =new TesterServiceImpl();
	ProjectService projectService=new ProjectServiceImpl();
	
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditIssueAdminDetails() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int issueId=Integer.parseInt(request.getParameter("id"));
		
		int pid=Integer.parseInt(request.getParameter("pid"));
		
		Issue issue=new Issue();
		
		issue=testerService.getIssueInfo(issueId);
		List<User> developers = projectService.fetchDevelopersDetails();
		List<User> testers = projectService.fetchTestersDetails();
		
		request.setAttribute("issue", issue);
		request.setAttribute("pid", pid);
		request.setAttribute("dList", developers);
		request.setAttribute("tList", testers);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("editadminissue.jsp");
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
