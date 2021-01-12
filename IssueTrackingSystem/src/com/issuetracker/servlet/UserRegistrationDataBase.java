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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ServletContext context1 = getServletContext();
		String password = null;

		String uname = (String)context1.getAttribute("uname");
		String contact = (String)context1.getAttribute("contact");
		String address = (String)context1.getAttribute("address");
		int areaId = (Integer)context1.getAttribute("areaId");
		String email =(String)context1.getAttribute("email");
		int roleId = (Integer)context1.getAttribute("roleId");
		String pwd = (String)context1.getAttribute("pwd");
		
		try {
			TrippleDes trippleDes = new TrippleDes();
			password = trippleDes.encrypt(pwd);
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

		try {
			issueService.saveUserDetails(user);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("sentrequest.jsp");
		dispatcher.forward(request, response);

		
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
