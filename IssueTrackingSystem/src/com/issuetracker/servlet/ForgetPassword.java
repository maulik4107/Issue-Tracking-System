package com.issuetracker.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.issuetracker.bean.SendEmail;
import com.issuetracker.others.GenerateOTP;
import com.issuetracker.others.TrippleDes;
import com.issuetracker.service.IssueService;
import com.issuetracker.service.impl.IssueServiceImpl;

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
		// TODO Auto-generated method stub

		String pwd = null;
		String password = null;
		
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
				
		String msg = "Your OTP(One Time Password) of Issue Tracking System is " + OTP + ". Try this OTP for change Your Password. ";
		SendEmail mail = new SendEmail();
		
		mail.sendmail(email,msg);
		
		request.setAttribute("OTP", OTP);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("passwordverification.jsp");
		dispatcher.forward(request, response);
		
		
	}

}
