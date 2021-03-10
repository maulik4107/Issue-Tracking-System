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
 * Servlet implementation class GetProjectIssue
 */
public class GetProjectIssue extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	TesterService testerService=new TesterServiceImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetProjectIssue() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int pid=Integer.parseInt(request.getParameter("projectId"));
		
		List<Issue> issueList=testerService.getIssueProjectWise(pid);
		
		request.setAttribute("issueList", issueList);
		
		RequestDispatcher dispatcher =request.getRequestDispatcher("viewallissue.jsp");
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
