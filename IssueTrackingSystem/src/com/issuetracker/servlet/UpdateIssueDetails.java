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
 * Servlet implementation class UpdateIssueDetails
 */
public class UpdateIssueDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	TesterService testerService=new TesterServiceImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateIssueDetails() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
				
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
        Issue issue=new Issue();
		
		int issueId = Integer.parseInt(request.getParameter("pId"));
		String issueName = request.getParameter("pName");
		int issueStatus = Integer.parseInt(request.getParameter("projectStatus"));
		Part part=request.getPart("pdocument");
		String cDate = request.getParameter("sdate");
		String description = request.getParameter("description");
		
		issue.setIssueId(issueId);		
		issue.setIssueName(issueName);
		issue.setIssueStatusId(issueStatus);
		if(null!=part && part.getSize()>0)
		{
			System.out.println("File Name : " + part.getName());
			System.out.println("File Name 2" + part.getSubmittedFileName());
			System.out.println("File Size :: " + part.getSize());
			issue.setDocumentStream(part.getInputStream());
		}
		issue.setIssueCreatedDate(cDate);
		issue.setIssueDes(description);
		
		String msg=testerService.UpdateIssueDetails(issue);
		
		request.setAttribute("editissue", msg);
		RequestDispatcher dispatcher =request.getRequestDispatcher("testerhome.jsp");
		dispatcher.forward(request, response);
//		response.sendRedirect("testerhome.jsp");

		
		doGet(request, response);
	}

}
