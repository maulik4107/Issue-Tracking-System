package com.issuetracker.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.issuetracker.bean.Issue;
import com.issuetracker.service.TesterService;
import com.issuetracker.service.impl.TesterServiceImpl;

/**
 * Servlet implementation class EditIssueDetails
 */
public class EditIssueDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	TesterService testerService=new TesterServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditIssueDetails() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int id=Integer.parseInt(request.getParameter("id"));
		int testerId=Integer.parseInt(request.getParameter("testerId"));
		int mid=Integer.parseInt(request.getParameter("mid"));
		
		Issue issue=new Issue();
		
		issue=testerService.getIssueInfo(id);
		
		request.setAttribute("issue",issue);
		request.setAttribute("testerId", testerId);
		request.setAttribute("mid", mid);
		RequestDispatcher dispatcher=request.getRequestDispatcher("editissue.jsp");
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
