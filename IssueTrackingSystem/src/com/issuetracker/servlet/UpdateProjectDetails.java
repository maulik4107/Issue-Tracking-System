package com.issuetracker.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.issuetracker.bean.ProjectDetails;
import com.issuetracker.service.ProjectService;
import com.issuetracker.service.impl.ProjectServiceImpl;

/**
 * Servlet implementation class UpdateProjectDetails
 */
public class UpdateProjectDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	ProjectService projectService = new ProjectServiceImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProjectDetails() {
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
		
		ProjectDetails project = new ProjectDetails();
		
		int pId = Integer.parseInt(request.getParameter("pId"));
		String pName = request.getParameter("pName");
		int managerId = Integer.parseInt(request.getParameter("projectManager"));
		int projectStatus = Integer.parseInt(request.getParameter("projectStatus"));
		Part part=request.getPart("pdocument");
		String sDate = request.getParameter("sdate");
		String edate = request.getParameter("edate");
		String description = request.getParameter("description");
		
		if(null!=part && part.getSize()>0)
		{
			System.out.println("File Name" + part.getName());
			System.out.println("File Name 2" + part.getSubmittedFileName());
			System.out.println("File Size :: " + part.getSize());
			project.setDocumentStream(part.getInputStream());
		}
		
		project.setProjectId(pId);
		project.setProjectName(pName);
		project.setPmId(managerId);
		project.setProjectStatus(projectStatus);
		project.setProjectSd(sDate);
		project.setProjectEd(edate);
		project.setProjectDes(description);
		
		String message = projectService.setProjectDetails(project);
		
		request.setAttribute("update",message);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("AdminHome.jsp");
		dispatcher.forward(request, response);
		doGet(request, response);
	}

}
