package com.issuetracker.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.issuetracker.bean.ModuleDetails;
import com.issuetracker.service.DeveloperService;
import com.issuetracker.service.impl.DeveloperServiceImpl;

/**
 * Servlet implementation class DeveloperModules
 */
public class DeveloperModules extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	DeveloperService developerService = new DeveloperServiceImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeveloperModules() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int developerId = Integer.parseInt(request.getParameter("id"));
		List<ModuleDetails> myModules = developerService.fetchModuleDetails(developerId);
		
		request.setAttribute("myModules",myModules);
		request.setAttribute("did",developerId);
		RequestDispatcher dispatcher = request.getRequestDispatcher("developermodules.jsp");
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
