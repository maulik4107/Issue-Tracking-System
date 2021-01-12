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
import com.issuetracker.service.IssueService;
import com.issuetracker.service.impl.IssueServiceImpl;

/**
 * Servlet implementation class UpdateProfile
 */
public class UpdateProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	IssueService issueService = new IssueServiceImpl();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateProfile() {
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

		int updatedId = 0;

		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("uname");
		String contact = request.getParameter("contact");
		String address = request.getParameter("address");
		int areaId = Integer.parseInt(request.getParameter("area"));

		User u = new User();

		u.setUserId(id);
		u.setUserName(name);
		u.setUserContact(contact);
		u.setUserAddress(address);
		u.setAreaId(areaId);

		try {
			updatedId = issueService.editUserDetails(u);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		if (updatedId > 0) {
			HttpSession session = request.getSession(false);
			session.setAttribute("user",u);
			String message = "Your Profile Updated Successfully!!!";
			
			request.setAttribute("msg", message);
			RequestDispatcher dispatcher = request.getRequestDispatcher("editconfirmation.jsp");
			dispatcher.forward(request, response);
		} else {
			String message = "Your Profile Not Updated Successfully!!!";
			request.setAttribute("msg", message);
			RequestDispatcher dispatcher = request.getRequestDispatcher("editconfirmation.jsp");
			dispatcher.forward(request, response);
		}
	}
}
