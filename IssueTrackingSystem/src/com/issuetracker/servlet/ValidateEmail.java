package com.issuetracker.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.issuetracker.service.IssueService;
import com.issuetracker.service.impl.IssueServiceImpl;

/**
 * Servlet implementation class ValidateEmail
 */
public class ValidateEmail extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	IssueService issueService = new IssueServiceImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ValidateEmail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String validateEmailId = null;
		
		int id=Integer.parseInt(request.getParameter("id"));
		
		String email = request.getParameter("email");
		
		try {
			validateEmailId = issueService.fetchEmailDetails(email);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("id",id);
	    if(validateEmailId=="true") {
	    	RequestDispatcher dispatcher = request.getRequestDispatcher("ForgetPassword");
			dispatcher.forward(request, response);	
	    }
	    else {
	    	request.setAttribute("confirmation","Sorry !! Email Id is Not Exist.");
	    	RequestDispatcher dispatcher = request.getRequestDispatcher("forgotpassword.jsp");
			dispatcher.forward(request, response);
	    }
	    
	    
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
