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
 * Servlet implementation class SaveModuleDetails
 */
public class SaveModuleDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	ProjectService projectService = new ProjectServiceImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveModuleDetails() {
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
		int pId = Integer.parseInt(request.getParameter("projectName"));
		int moduleId = Integer.parseInt(request.getParameter("moduleId"));
		int developerId = Integer.parseInt(request.getParameter("developerId"));
		
		String msg = projectService.saveModuleDetails(pId,moduleId,developerId);
		request.setAttribute("message1",msg);		
		RequestDispatcher dispatcher = request.getRequestDispatcher("projectmanagerhome.jsp");
		dispatcher.forward(request, response);
		doGet(request, response);
	}

}
