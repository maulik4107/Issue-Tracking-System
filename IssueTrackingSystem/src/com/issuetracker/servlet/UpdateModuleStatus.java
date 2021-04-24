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
 * Servlet implementation class UpdateModuleStatus
 */
public class UpdateModuleStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ProjectService projectService = new ProjectServiceImpl();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateModuleStatus() {
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

		int id = Integer.parseInt(request.getParameter("statusId"));
		int mid = Integer.parseInt(request.getParameter("mId"));
		int pid=Integer.parseInt(request.getParameter("pid"));

		String msg = null;
		int t = 0;
		if (id == 6) {
			t = projectService.changeModuleStatus(mid);
			if (t == 1) {
				msg = "Status Upadted Successfully !!";
			} else {
				msg = "Issues of this module not completed yet !!";
			}
		} else {
			msg = projectService.updateModuleStatus(id, mid);
		}

		request.setAttribute("statusMsg", msg);

		RequestDispatcher dispatcher = request.getRequestDispatcher("GetAllModules?projectId="+pid);
		dispatcher.forward(request, response);

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
