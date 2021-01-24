package com.issuetracker.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.issuetracker.bean.User;
import com.issuetracker.others.TrippleDes;
import com.issuetracker.service.IssueService;
import com.issuetracker.service.impl.IssueServiceImpl;

/**
 * Servlet implementation class UserRegistrationDataBase
 */
public class UserRegistrationDataBase extends HttpServlet {
	private static final long serialVersionUID = 1L;
	IssueService issueService = new IssueServiceImpl();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserRegistrationDataBase() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		String otp = request.getParameter("gotp");
		String uotp = request.getParameter("otp");
		String gotp = null;

		TrippleDes des;
		try {
			des = new TrippleDes();
			gotp = des.decrypt(otp);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		String password = null;

		String uname = request.getParameter("user");
		String contact = request.getParameter("ucontact");
		String address = request.getParameter("uaddress");
		int areaId = Integer.parseInt(request.getParameter("uarea"));
		String email = request.getParameter("uemail");
		int roleId = Integer.parseInt(request.getParameter("urole"));
		String password1 = request.getParameter("upsd");

		try {
			TrippleDes trippleDes = new TrippleDes();
			password = trippleDes.encrypt(password1);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		User user = new User();

		user.setUserName(uname);
		user.setUserContact(contact);
		user.setUserAddress(address);
		user.setAreaId(areaId);
		user.setUserEmail(email);
		user.setRoleId(roleId);
		user.setPassword(password);

		if (uotp.equalsIgnoreCase(gotp)) {
			try {
				issueService.saveUserDetails(user);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			request.setAttribute("uname", uname);
			RequestDispatcher dispatcher = request.getRequestDispatcher("sentrequest.jsp");
			dispatcher.forward(request, response);
		} else {
			request.setAttribute("uname",uname);
			request.setAttribute("user", user);
			request.setAttribute("OTP", otp);
			request.setAttribute("msg", "Invalid OTP!!!");
			RequestDispatcher dispatcher = request.getRequestDispatcher("emailverification.jsp");
			dispatcher.forward(request, response);
		}
		doGet(request, response);
	}

}
