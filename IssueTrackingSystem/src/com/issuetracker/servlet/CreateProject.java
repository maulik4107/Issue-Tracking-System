package com.issuetracker.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.issuetracker.bean.Admin;
import com.issuetracker.service.ProjectService;
import com.issuetracker.service.impl.ProjectServiceImpl;



/**
 * Servlet implementation class CreateProject
 */
public class CreateProject extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	ProjectService projectService=new ProjectServiceImpl();
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateProject() {
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
		
		System.out.println("Dopost method called");
		String pName=request.getParameter("pname");
		String sDate=request.getParameter("sdate");
		String eDate=request.getParameter("edate");
		String description=request.getParameter("description");
		Part part=request.getPart("pdocument");
		
		Admin admin=new Admin();
		
		if(null!=part)
		{
			System.out.println("File Name" + part.getName());
			System.out.println("File Name 2" + part.getSubmittedFileName());
			System.out.println("File Size :: " + part.getSize());
			admin.setDocumentStream(part.getInputStream());
		}
		
		admin.setProjectName(pName);
		admin.setStartingDate(sDate);
		admin.setEndingDate(eDate);
		admin.setDescription(description);
		
		String message=null;
		
		try {
			message=projectService.saveProjectDetails(admin);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("message",message);
		RequestDispatcher dispatcher=request.getRequestDispatcher("projectcreatedalert.jsp");
		dispatcher.forward(request, response);
		
		doGet(request, response);
	}

}
