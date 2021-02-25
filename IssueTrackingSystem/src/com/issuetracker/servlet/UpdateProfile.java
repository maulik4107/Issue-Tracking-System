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
		int rid=Integer.parseInt(request.getParameter("rid"));
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("uname");
		String contact = request.getParameter("contact");
		String address = request.getParameter("address");
		String email=request.getParameter("mail");
		int areaId = Integer.parseInt(request.getParameter("area"));

		User u = new User();

		u.setUserId(id);
		u.setUserName(name);
		u.setUserContact(contact);
		u.setUserAddress(address);
		u.setAreaId(areaId);
		u.setUserEmail(email);

		try {
			updatedId = issueService.editUserDetails(u);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		if (updatedId > 0) {
			if(rid==0)
			{
				HttpSession session = request.getSession(false);
				session.setAttribute("user",u);
			}
			else if(rid==1)
			{
				HttpSession session = request.getSession(false);
				session.setAttribute("pm",u);
			}
			else if(rid==2)
			{
				HttpSession session = request.getSession(false);
				session.setAttribute("developer",u);
			}
			else
			{
				HttpSession session = request.getSession(false);
				session.setAttribute("tester",u);
			}
			String message = "Your Profile Updated Successfully!!!";
			
			request.setAttribute("msg", message);
			if(rid==0)
			{
				RequestDispatcher dispatcher = request.getRequestDispatcher("AdminHome.jsp");
				dispatcher.forward(request, response);
			}
			else if(rid==1) {
				RequestDispatcher dispatcher = request.getRequestDispatcher("projectmanagerhome.jsp");
				dispatcher.forward(request, response);
			}
			else if(rid==2)
			{
				RequestDispatcher dispatcher = request.getRequestDispatcher("developerhome.jsp");
				dispatcher.forward(request, response);
			}
			else
			{
				RequestDispatcher dispatcher = request.getRequestDispatcher("testerhome.jsp");
				dispatcher.forward(request, response);
			}
		} 
	}
}
