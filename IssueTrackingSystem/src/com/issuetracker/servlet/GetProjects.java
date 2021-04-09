package com.issuetracker.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.issuetracker.bean.ProjectDetails;
import com.issuetracker.service.ProjectService;
import com.issuetracker.service.impl.ProjectServiceImpl;

/**
 * Servlet implementation class GetProjects
 */
public class GetProjects extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ProjectService projectService = new ProjectServiceImpl();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GetProjects() {
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
		List<ProjectDetails> projectList = new ArrayList<ProjectDetails>();

		String str = request.getParameter("str");

		if (str.equalsIgnoreCase("view")) {
			int pId = Integer.parseInt(request.getParameter("id"));

			projectList = projectService.getProjectList(pId);
			request.setAttribute("ProjectList", projectList);
			request.setAttribute("pId", pId);
			RequestDispatcher dispatcher = request.getRequestDispatcher("viewmodulesdetails.jsp");
			dispatcher.forward(request, response);
		}
		else
		{
			int pId = Integer.parseInt(request.getParameter("id"));

			projectList = projectService.getProjectList(pId);
			request.setAttribute("ProjectList", projectList);
			request.setAttribute("pId", pId);
			RequestDispatcher dispatcher = request.getRequestDispatcher("changemodulestatus.jsp");
			dispatcher.forward(request, response);
		}

		response.getWriter().append("Served at: ").append(request.getContextPath());
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
