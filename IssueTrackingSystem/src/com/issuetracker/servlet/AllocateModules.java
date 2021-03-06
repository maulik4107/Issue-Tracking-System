package com.issuetracker.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.issuetracker.bean.ModuleDetails;
import com.issuetracker.service.ProjectService;
import com.issuetracker.service.impl.ProjectServiceImpl;

/**
 * Servlet implementation class AllocateModules
 */
public class AllocateModules extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ProjectService projectService = new ProjectServiceImpl();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AllocateModules() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		int projectId = Integer.parseInt(request.getParameter("projectId"));
		int temp = Integer.parseInt(request.getParameter("temp"));

		List<ModuleDetails> moduleDetails = new ArrayList<ModuleDetails>();
		if (temp == 0) {
			System.out.println("view MOdule");
			moduleDetails = projectService.fetchModuleDetails(projectId);
			System.out.println(moduleDetails);
		}
		else {
			System.out.println("Ready to test Modules :");
			moduleDetails = projectService.fetchReadyModules(projectId);
			System.out.println(moduleDetails);
		}
		System.out.println(moduleDetails);
		String modules = new Gson().toJson(moduleDetails);

		response.getWriter().append(modules);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
