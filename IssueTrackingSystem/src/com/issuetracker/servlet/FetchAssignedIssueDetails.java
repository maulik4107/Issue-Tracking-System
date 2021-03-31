package com.issuetracker.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.issuetracker.bean.Issue;
import com.issuetracker.service.DeveloperService;
import com.issuetracker.service.TesterService;
import com.issuetracker.service.impl.DeveloperServiceImpl;
import com.issuetracker.service.impl.TesterServiceImpl;

/**
 * Servlet implementation class FetchAssignedIssueDetails
 */
public class FetchAssignedIssueDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	DeveloperService developerService = new DeveloperServiceImpl();
	TesterService testerService=new TesterServiceImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FetchAssignedIssueDetails() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String str=request.getParameter("str");
		if(str.equals("developer"))
		{
			int developerId = Integer.parseInt(request.getParameter("id"));
		
			List<Issue> issueList = developerService.fetchAssignedIssueDetails(developerId);
		
			request.setAttribute("dId", developerId);
			request.setAttribute("IssueList", issueList);
			request.getRequestDispatcher("changeissuestatusdeveloper.jsp").forward(request, response);
		}
		if(str.equals("tester"))
		{
			int testerId = Integer.parseInt(request.getParameter("id"));
			
			List<Issue> issueList = testerService.fetchAssignedIssueDetails(testerId);
		
			request.setAttribute("dId", testerId);
			request.setAttribute("IssueList", issueList);
			request.getRequestDispatcher("changeissuestatustester.jsp").forward(request, response);

		}
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
