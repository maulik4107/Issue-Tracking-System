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
 * Servlet implementation class CheckExistingPassword
 */
public class CheckExistingPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	IssueService issueService = new IssueServiceImpl();
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckExistingPassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String pwdId = null;
		
		String pwd = request.getParameter("pwd");
				
		try {
			pwdId = issueService.getPasswordDetails(pwd);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		response.getWriter().append(pwdId);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
