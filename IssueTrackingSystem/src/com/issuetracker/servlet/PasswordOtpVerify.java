package com.issuetracker.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.issuetracker.others.TrippleDes;

/**
 * Servlet implementation class PasswordOtpVerify
 */
public class PasswordOtpVerify extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PasswordOtpVerify() {
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
		
		String uotp = request.getParameter("otp");
		String otp = request.getParameter("gotp");
		String gotp = null;
		String email = request.getParameter("email");
		
		int id=Integer.parseInt(request.getParameter("id"));

		TrippleDes des;
		try {
			des = new TrippleDes();
			gotp = des.decrypt(otp);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		if(gotp.equalsIgnoreCase(uotp))
		{
			request.setAttribute("email",email);
			request.setAttribute("msg","");
			request.setAttribute("id",id);
			RequestDispatcher dispatcher = request.getRequestDispatcher("resetpassword.jsp");
			dispatcher.forward(request, response);
		}
		else
		{
			request.setAttribute("email",email);
			request.setAttribute("OTP",otp);
			request.setAttribute("id",id);
			request.setAttribute("msg","Invalid OTP!!!");
			RequestDispatcher dispatcher = request.getRequestDispatcher("passwordverification.jsp");
			dispatcher.forward(request, response);
		}
		
		doGet(request, response);
	}

}
