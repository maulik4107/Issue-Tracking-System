package com.issuetracker.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.issuetracker.bean.Issue;
import com.issuetracker.service.TesterService;
import com.issuetracker.service.impl.TesterServiceImpl;

/**
 * Servlet implementation class GetPMIssues
 */
public class GetPMIssues extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	TesterService testerService = new TesterServiceImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetPMIssues() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int pid=Integer.parseInt(request.getParameter("projectId"));
		int pmid=Integer.parseInt(request.getParameter("pmid"));
		List<Issue> issue=testerService.getIssueProjectWise(pid);
		
		request.setAttribute("issueList", issue);
		request.setAttribute("proId", pid);
		request.setAttribute("pmid", pmid);	
		RequestDispatcher dispatcher =request.getRequestDispatcher("changeissuestatuspm.jsp");
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
