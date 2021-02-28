package com.issuetracker.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.issuetracker.bean.ModuleDetails;
import com.issuetracker.service.ProjectService;
import com.issuetracker.service.impl.ProjectServiceImpl;

/**
 * Servlet implementation class GetAllModules
 */
public class GetAllModules extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	ProjectService projectService=new ProjectServiceImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetAllModules() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int pid=Integer.parseInt(request.getParameter("projectId"));
		List<ModuleDetails> moduleList=projectService.getAllModuleDetails(pid);
		int pmid=projectService.getProjectManagerId(pid);
		
		request.setAttribute("ModuleList",moduleList);
		request.setAttribute("pmId",pmid);
		RequestDispatcher dispatcher=request.getRequestDispatcher("allmodulelist.jsp");
		dispatcher.forward(request, response);
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		doGet(request, response);
	}

}
