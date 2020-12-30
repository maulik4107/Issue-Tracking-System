package com.issuetracker.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.issuetracker.bean.User;
import com.issuetracker.others.TrippleDes;
import com.issuetracker.service.IssueService;
import com.issuetracker.service.impl.IssueServiceImpl;

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
		
	String password=null;
		
		String uname = request.getParameter("uname");
		String contact = request.getParameter("contact");
		String address = request.getParameter("address");
		int areaId = Integer.parseInt(request.getParameter("area"));
		String email = request.getParameter("email");
		int roleId =Integer.parseInt(request.getParameter("role"));
		String pwd = request.getParameter("password");
		
		System.out.println("Area Id :: " + areaId);
		System.out.println("Role Id :: " + roleId);
		
		try {
			TrippleDes trippleDes = new TrippleDes();
		    password = trippleDes.encrypt(pwd);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println("Encrypted Password is :: "+ password);
		
		User user = new User();
		
		user.setUserName(uname);
		user.setUserContact(contact);
		user.setUserAddress(address);
		user.setAreaId(areaId);
		user.setUserEmail(email);
		user.setRoleId(roleId);
		user.setPassword(password);
		
		try {
			issueService.saveUserDetails(user);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("uname", uname);

		RequestDispatcher dispatcher = request.getRequestDispatcher("error-500.jsp");
		dispatcher.forward(request, response);
		
		doGet(request, response);
	}

}
