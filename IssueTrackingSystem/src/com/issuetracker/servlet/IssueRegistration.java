package com.issuetracker.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.issuetracker.bean.SendEmail;
import com.issuetracker.bean.User;
import com.issuetracker.others.GenerateOTP;
import com.issuetracker.others.TrippleDes;
import com.issuetracker.service.IssueService;
import com.issuetracker.service.impl.IssueServiceImpl;
import com.issuetracker.utill.EmailThread;

/**
 * Servlet implementation class IssueRegistration
 */
public class IssueRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;

	IssueService issueService = new IssueServiceImpl();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public IssueRegistration() {
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
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		String uname = request.getParameter("uname");
		String contact = request.getParameter("contact");
		String address = request.getParameter("address");
		int areaId = Integer.parseInt(request.getParameter("area"));
		String email = request.getParameter("email");
		int roleId = Integer.parseInt(request.getParameter("role"));
		String pwd = request.getParameter("password");

		ServletContext context1 = getServletContext();
		context1.setAttribute("uname", uname);
		context1.setAttribute("contact", contact);
		context1.setAttribute("address", address);
		context1.setAttribute("areaId", areaId);
		context1.setAttribute("email", email);
		context1.setAttribute("roleId", roleId);
		context1.setAttribute("pwd", pwd);

		GenerateOTP otp = new GenerateOTP();
		String OTP = otp.generateOTP();

		String msg = "<h2 style='font-family:apple;font-style:italic;'> Dear, " + uname + "</h2>"
				+ "<center><h1 style='color:green;font-family:apple;font-style:italic;'>Welcome to </h1><h2 style='color:green;font-family:apple;font-style:italic;'>Issue Tracking System</h2></center>"
				+ "<center> Your Registration OTP is : " + OTP+"</center>";
	
		EmailThread thread = new EmailThread();
		
		thread.send(email, msg);
		
		Thread t1 = new Thread(thread);
		
		t1.start();
		
		request.setAttribute("OTP", OTP);

		HttpSession session = request.getSession();
		session.setAttribute("uname", uname);

		RequestDispatcher dispatcher = request.getRequestDispatcher("emailverification.jsp");
		dispatcher.forward(request, response);

		doGet(request, response);
	}

}
