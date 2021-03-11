package com.issuetracker.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.issuetracker.bean.Issue;
import com.issuetracker.service.TesterService;
import com.issuetracker.service.impl.TesterServiceImpl;

/**
 * Servlet implementation class UpdateIssueDetailsAdmin
 */
public class UpdateIssueDetailsAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	TesterService testerService=new TesterServiceImpl();
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateIssueDetailsAdmin() {
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
		
		int id=Integer.parseInt(request.getParameter("IssueId"));
		String iName=request.getParameter("pName");
		String impact=request.getParameter("moduleId");
		String priority=request.getParameter("priority");
		int developerId=Integer.parseInt(request.getParameter("developerid"));
		int testerId=Integer.parseInt(request.getParameter("testerid"));
		String sdate=request.getParameter("sdate");
		String des=request.getParameter("description");
		
		Part part=request.getPart("pdocument");
		
		Issue issue=new Issue();
		
		issue.setIssueId(id);
		issue.setIssueName(iName);
		issue.setIssueImpact(impact);
		issue.setIssuePriority(priority);
		issue.setIssueCreatedDate(sdate);
		issue.setIssueDes(des);
		issue.setDeveloperId(developerId);
		issue.setTesterId(testerId);
		if(null!=part && part.getSize()>0)
		{
			System.out.println("File Name" + part.getName());
			System.out.println("File Name 2" + part.getSubmittedFileName());
			System.out.println("File Size :: " + part.getSize());
			issue.setDocumentStream(part.getInputStream());
		}
		String msg=testerService.UpdateIssueInfo(issue);
		
		request.setAttribute("Editmsg", msg);
		RequestDispatcher dispatcher=request.getRequestDispatcher("AdminHome.jsp");
		dispatcher.forward(request, response);
		
		
		doGet(request, response);
	}

}
