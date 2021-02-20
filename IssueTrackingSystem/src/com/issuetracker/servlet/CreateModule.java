package com.issuetracker.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.issuetracker.bean.ModuleDetails;
import com.issuetracker.bean.ProjectDetails;
import com.issuetracker.service.ProjectService;
import com.issuetracker.service.impl.ProjectServiceImpl;

/**
 * Servlet implementation class CreateModule
 */
public class CreateModule extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ProjectService projectService=new ProjectServiceImpl();  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateModule() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String msg=null;
		int pid=Integer.parseInt(request.getParameter("project"));
		String name=request.getParameter("pname");
		String sdate=request.getParameter("sdate");
		String edate=request.getParameter("edate");
		String des=request.getParameter("description");
		
		ModuleDetails moduleDetails=new ModuleDetails();
		moduleDetails.setProjectId(pid);
		moduleDetails.setModuleName(name);
		moduleDetails.setModuleSd(sdate);
		moduleDetails.setModuleEd(edate);
		moduleDetails.setModuleDes(des);
		
		msg=projectService.saveModuleDetails(moduleDetails);
		
		request.setAttribute("CreateModule",msg);
		RequestDispatcher dispatcher=request.getRequestDispatcher("projectmanagerhome.jsp");
		dispatcher.forward(request, response);
		
		doGet(request, response);
	}

}
