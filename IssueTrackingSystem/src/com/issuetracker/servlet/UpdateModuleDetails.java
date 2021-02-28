package com.issuetracker.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.issuetracker.bean.ModuleDetails;
import com.issuetracker.service.ProjectService;
import com.issuetracker.service.impl.ProjectServiceImpl;

/**
 * Servlet implementation class UpdateModuleDetails
 */
public class UpdateModuleDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	ProjectService projectService = new ProjectServiceImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateModuleDetails() {
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
		
		int rid=Integer.parseInt(request.getParameter("rid"));
		int moduleId = Integer.parseInt(request.getParameter("moduleId"));
		int projectId = Integer.parseInt(request.getParameter("projectId"));
		String projectName = request.getParameter("projectname");
		String moduleName = request.getParameter("modulename");
		String sdate = request.getParameter("sdate");
		String edate = request.getParameter("edate");
		String des = request.getParameter("description");
		int modulestatusid = Integer.parseInt(request.getParameter("modulestatusid"));
		int developerId = Integer.parseInt(request.getParameter("developerid"));
		
		ModuleDetails module = new ModuleDetails();
		
		module.setModuleId(moduleId);
		module.setModuleName(moduleName);
		module.setModuleDes(des);
		module.setModuleSd(sdate);
		module.setModuleEd(edate);
		module.setStatusId(modulestatusid);
		module.setDeveloperId(developerId);
		
		String updateMessage = projectService.editModuleDetails(module);
		
		request.setAttribute("updateMessage",updateMessage);
		if(rid==0)
		{
			RequestDispatcher dispatcher = request.getRequestDispatcher("AdminHome.jsp");
			dispatcher.forward(request, response);
		}
		else
		{
			RequestDispatcher dispatcher = request.getRequestDispatcher("projectmanagerhome.jsp");
			dispatcher.forward(request, response);
		}
		doGet(request, response);
	}

}
