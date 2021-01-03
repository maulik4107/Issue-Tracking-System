package com.issuetracker.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.issuetracker.service.IssueService;
import com.issuetracker.service.impl.IssueServiceImpl;

/**
 * Servlet implementation class ExistEmailCheck
 */
public class ExistEmailCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	IssueService issueService = new IssueServiceImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExistEmailCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 
		    String validateEmailId = null;
			
			String email = request.getParameter("email");
			
			try {
				validateEmailId = issueService.fetchEmailDetails(email);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			System.out.println("email of ForgetPassword is :: " + email);
			
			System.out.println("validateEmailId is :: " + validateEmailId);
			
			response.getWriter().append(validateEmailId);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
 
		
	}

}
