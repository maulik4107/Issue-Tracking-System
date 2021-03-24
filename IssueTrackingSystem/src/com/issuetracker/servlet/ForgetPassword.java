package com.issuetracker.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.issuetracker.bean.SendEmail;
import com.issuetracker.others.GenerateOTP;
import com.issuetracker.others.TrippleDes;
import com.issuetracker.service.IssueService;
import com.issuetracker.service.impl.IssueServiceImpl;
import com.issuetracker.utill.EmailThread;

/**
 * Servlet implementation class ForgetPassword
 */
public class ForgetPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	IssueService issueService = new IssueServiceImpl();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ForgetPassword() {
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
		String generateOtp=null;
		String pwd = null;
		String password = null;
		
		int id=(int)request.getAttribute("id");

		String email = request.getParameter("email");

		pwd = issueService.fetchUserDetails(email);

		try {
			TrippleDes des = new TrippleDes();

			password = des.decrypt(pwd);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		GenerateOTP otp = new GenerateOTP();
		String OTP = otp.generateOTP();

		String message = "<center><h1 style='color:darkblue;font-family:apple;font-style:italic;font-size: 40px;'>Welcome to </h1><h2 style='color:darkblue;font-family:apple;font-style:italic;font-size: 30px;'>Issue Tracking System</h2></center>"
				+ "<h2 style='color:darkblue;font-family:apple;font-style:italic;font-size: 20px;'>" + "Dear, "
				+ "Hello...." + "</h2><hr><br>"
				+ "<br><br><hr><center>***********OTP is given below***********</center><hr><br>" + "<br>"
				+ "Your Reset Password Otp is....          : <h2> " + OTP + "</h2><br>"
				+ "<br><h2 style='color:darkblue;font-family:apple;font-style:italic;font-size: 20px;'>"
				+ "Thank You....." + "</h2>";
		
		EmailThread thread = new EmailThread();

		thread.send(email, message);

		Thread t1 = new Thread(thread);

		t1.start();
		
		TrippleDes des=null;
		try {
			des = new TrippleDes();
			generateOtp = des.encrypt(OTP);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		request.setAttribute("OTP", generateOtp);

		String gmail = (String) request.getParameter("email");
		request.setAttribute("email", gmail);
		request.setAttribute("id",id);
		RequestDispatcher dispatcher = request.getRequestDispatcher("passwordverification.jsp");
		dispatcher.forward(request, response);

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

}
