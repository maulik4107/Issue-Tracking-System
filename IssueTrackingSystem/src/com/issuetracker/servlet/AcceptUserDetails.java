package com.issuetracker.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.issuetracker.bean.SendEmail;
import com.issuetracker.bean.User;
import com.issuetracker.service.IssueService;
import com.issuetracker.service.impl.IssueServiceImpl;

/**
 * Servlet implementation class AcceptUserDetails
 */
public class AcceptUserDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;

	IssueService issueService = new IssueServiceImpl();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AcceptUserDetails() {
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

		int uId = Integer.parseInt(request.getParameter("id"));

		try {
			message = issueService.setApproveActiveDetails(uId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		response.sendRedirect("GetPendingUserRequest");
		
		try {
			 getEmail = issueService.selectEmail(uId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String msg = "Welcome Your Request is accepted by Admin. Now You can Log in our System.";

		SendEmail gmail = new SendEmail();

		gmail.sendmail(getEmail, msg);
		
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
