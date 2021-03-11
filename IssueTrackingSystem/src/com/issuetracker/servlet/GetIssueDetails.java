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
 * Servlet implementation class GetIssueDetails
 */
public class GetIssueDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	TesterService testerService=new TesterServiceImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetIssueDetails() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int mid=Integer.parseInt(request.getParameter("moduleId"));
		int testerId=Integer.parseInt(request.getParameter("id"));
		List<Issue> issue=testerService.getIssueDetails(mid);
		
		request.setAttribute("issueList",issue);
		request.setAttribute("id",testerId);
		request.setAttribute("mid", mid);
		RequestDispatcher dispatcher =request.getRequestDispatcher("viewissuedetails.jsp");
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
