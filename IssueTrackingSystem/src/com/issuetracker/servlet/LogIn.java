package com.issuetracker.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.issuetracker.bean.User;
import com.issuetracker.others.TrippleDes;
import com.issuetracker.service.IssueService;
import com.issuetracker.service.impl.IssueServiceImpl;

/**
 * Servlet implementation class LogIn
 */
public class LogIn extends HttpServlet {
	private static final long serialVersionUID = 1L;

	IssueService issueService = new IssueServiceImpl();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LogIn() {
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

		String email = request.getParameter("email");

		String password = request.getParameter("pwd");

		String pwd = null;

		System.out.println("Email :: " + email);
		System.out.println("Pwd :: " + password);
		try {
			TrippleDes des = new TrippleDes();

			pwd = des.encrypt(password);
			String dk = des.encrypt("Dk@5981");
			System.out.println("My Password is :: " + dk);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		User user = new User();

		user.setUserEmail(email);
		user.setPassword(pwd);

		User u = new User();

		try {
			u = issueService.checkLoginDetails(user);
			System.out.println(u);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		System.out.println("Password :: " + u.getPassword());

		if (u.getUserEmail() != null && u.getPassword() != null) {
			System.out.println("Password :: " + u.getPassword());
			System.out.println("Email :: " + u.getUserEmail());
			if(u.getRoleId()==0)
			{

				HttpSession session = request.getSession();
				session.setAttribute("user", u);
				RequestDispatcher dispatcher = request.getRequestDispatcher("AdminHome.jsp");
				dispatcher.forward(request, response);

			}
			else
			{
				HttpSession session = request.getSession();
				session.setAttribute("user", u);
				RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
				dispatcher.forward(request, response);
			}
		} else {
			request.setAttribute("message", "Username or Password is Invalid!! Please try again.");
			RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);

		}
	}

}