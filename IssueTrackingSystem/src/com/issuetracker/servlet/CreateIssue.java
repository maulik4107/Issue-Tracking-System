package com.issuetracker.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.issuetracker.bean.Issue;
import com.issuetracker.bean.User;
import com.issuetracker.service.TesterService;
import com.issuetracker.service.impl.TesterServiceImpl;

/**
 * Servlet implementation class CreateIssue
 */
public class CreateIssue extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	TesterService testerService=new TesterServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateIssue() {
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
		
		HttpSession session = request.getSession(false);
		User tester = (User)session.getAttribute("tester");
		
		int mid=Integer.parseInt(request.getParameter("moduleName"));
		String iname=request.getParameter("iname");
		Part part=request.getPart("pdocument");
		String sdate=request.getParameter("sdate");
		String des=request.getParameter("description");
		
		Issue issue=new Issue();
		issue.setModuleId(mid);
		issue.setIssueName(iname);
		issue.setTesterId(tester.getUserId());
		if(null!=part)
		{
			System.out.println("File Name" + part.getName());
			System.out.println("File Name 2" + part.getSubmittedFileName());
			System.out.println("File Size :: " + part.getSize());
			issue.setDocumentStream(part.getInputStream());
		}
		issue.setIssueCreatedDate(sdate);
		issue.setIssueDes(des);
		
		String msg=testerService.insertIssueDetails(issue);
		
		request.setAttribute("msg",msg);
		RequestDispatcher dispatcher=request.getRequestDispatcher("testerhome.jsp");
		dispatcher.forward(request, response);
		
		
		
	}

}
