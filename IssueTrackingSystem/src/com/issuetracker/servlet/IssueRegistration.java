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
	
		User user=new User();
		user.setUserName(uname);
		user.setUserContact(contact);
		user.setUserAddress(address);
		user.setAreaId(areaId);
		user.setUserEmail(email);
		user.setRoleId(roleId);
		user.setPassword(pwd);
		
		
		GenerateOTP otp = new GenerateOTP();
		String OTP = otp.generateOTP();
		
		String generateOtp = null;

		String message = "<center><h1 style='color:darkblue;font-family:apple;font-style:italic;font-size: 40px;'>Welcome to </h1><h2 style='color:darkblue;font-family:apple;font-style:italic;font-size: 30px;'>Issue Tracking System</h2></center>"
				+ "<h2 style='color:darkblue;font-family:apple;font-style:italic;font-size: 20px;'>" + "Dear, "
				+ user.getUserName() + "</h2><hr><br>"
				+ "<br><br><hr><center>***********OTP is given below***********</center><hr><br>" + "<br>"
				+ "Your Registration Otp is....          : <h2> " + OTP + "</h2><br>"
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
		
		request.setAttribute("uname",uname);
		
		request.setAttribute("user", user);

		RequestDispatcher dispatcher = request.getRequestDispatcher("emailverification.jsp");
		dispatcher.forward(request, response);

		doGet(request, response);
	}

}
