package com.issuetracker.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.issuetracker.service.DeveloperService;
import com.issuetracker.service.impl.DeveloperServiceImpl;

/**
 * Servlet implementation class ChangeModuleStatusDeveloper
 */
public class ChangeModuleStatusDeveloper extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	DeveloperService developerService = new DeveloperServiceImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeModuleStatusDeveloper() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int moduleId = Integer.parseInt(request.getParameter("id"));
		
		String statusMessage = developerService.setModuleStatus(moduleId);
		
		request.setAttribute("statusMessage",statusMessage);
		RequestDispatcher dispatcher = request.getRequestDispatcher("developerhome.jsp");
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
