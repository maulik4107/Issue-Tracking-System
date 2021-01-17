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

import com.issuetracker.bean.User;
import com.issuetracker.others.TrippleDes;
import com.issuetracker.service.IssueService;
import com.issuetracker.service.impl.IssueServiceImpl;

/**
 * Servlet implementation class UpdatePassword
 */
public class UpdatePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	IssueService issueService = new IssueServiceImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int updatedId = 0;
		
		HttpSession httpsession=request.getSession(false);
		User user = (User)httpsession.getAttribute("user");
		int Id=user.getUserId();
		String password = request.getParameter("password");
		
		TrippleDes des = null;
		try {
			des = new TrippleDes();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String pwd = des.encrypt(password);
		
		User u = new User();
		u.setPassword(pwd);
		
		try {
			updatedId = issueService.savePasswordDetails(pwd,Id);
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
				
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String email=request.getParameter("email");

		String password = (String)request.getParameter("password");
		
		String pwd = null;
		
		try {
			TrippleDes des = new TrippleDes();
			pwd = des.encrypt(password);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		String msg = issueService.savePasswordDetails(email,pwd);
		
		request.setAttribute("msg","Password Updated Successfully!!");
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
		dispatcher.forward(request, response);		
	}

}
