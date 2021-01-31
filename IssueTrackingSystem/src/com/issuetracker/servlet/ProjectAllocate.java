package com.issuetracker.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.issuetracker.service.ProjectService;
import com.issuetracker.service.impl.ProjectServiceImpl;

/**
 * Servlet implementation class ProjectAllocate
 */
public class ProjectAllocate extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	ProjectService projectService=new ProjectServiceImpl();
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProjectAllocate() {
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
		
		String msg=null;
		int pmId=Integer.parseInt(request.getParameter("projectManager"));
		int projectId=Integer.parseInt(request.getParameter("projectName"));
		
		try {
			msg=projectService.saveManagerDetail(pmId,projectId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("msg",msg);
		RequestDispatcher dispatcher=request.getRequestDispatcher("AdminHome.jsp");
		dispatcher.forward(request, response);
		
		doGet(request, response);
	}

}
