package com.issuetracker.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.issuetracker.bean.SendEmail;
import com.issuetracker.service.IssueService;
import com.issuetracker.service.impl.IssueServiceImpl;
import com.issuetracker.utill.EmailThread;

/**
 * Servlet implementation class RejectUserDetails
 */
public class RejectUserDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	IssueService issueService = new IssueServiceImpl();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RejectUserDetails() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String message=null;
		String getEmail=null;


		int uid = Integer.parseInt(request.getParameter("id"));		
		try {
			 getEmail = issueService.selectEmail(uid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		String msg = "Sorry!!! Your Registration Request has been rejected by Admin since You are not part of our company.";

		EmailThread thread = new EmailThread();
		
		thread.send(getEmail, msg);
		
		Thread t1 = new Thread(thread);
		
		t1.start();
		
		try {
			message = issueService.selectRejectDetails(uid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		response.sendRedirect("GetPendingUserRequest");
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
