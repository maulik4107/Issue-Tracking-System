package com.issuetracker.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.issuetracker.service.ProjectService;
import com.issuetracker.service.impl.ProjectServiceImpl;

/**
 * Servlet implementation class AssignIssueToDeveloper
 */
public class AssignIssueToDeveloper extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	ProjectService projectService = new ProjectServiceImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AssignIssueToDeveloper() {
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
		
		System.out.println("Servlet Called");
		int statusId = Integer.parseInt(request.getParameter("statusId"));
		int issueId = Integer.parseInt(request.getParameter("issueId"));
		int moduleId = Integer.parseInt(request.getParameter("moduleId"));
		
		String data = projectService.getDeveloperName(moduleId);
		
		String string[] = data.trim().split(" ");

		String developersId = string[0];
		String developerName = string[1];
		
		int developerId = Integer.parseInt(developersId);
		
		request.setAttribute("developerId",developerId);
		request.setAttribute("developerName", developerName);
		request.setAttribute("statusId",statusId);
		request.setAttribute("issueId",issueId);
		
		System.out.println("Status Id : " + statusId);
		System.out.println("Issue Id : " + issueId);
		System.out.println("Module Id : " + moduleId);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("assignissuetodeveloper.jsp");
		dispatcher.forward(request, response);

		doGet(request, response);
	}

}
