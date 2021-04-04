package com.issuetracker.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.issuetracker.service.TesterService;
import com.issuetracker.service.impl.TesterServiceImpl;

/**
 * Servlet implementation class UpdateTestingDoneStatus
 */
public class UpdateTestingDoneStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;

	TesterService testerService = new TesterServiceImpl();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateTestingDoneStatus() {
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
		System.out.println("UpdateTestingDoneStatus called");

		int moduleId = Integer.parseInt(request.getParameter("modulesId"));

		System.out.println(moduleId);

		String message = testerService.changeStatusToTestingCompleted(moduleId);
		
		System.out.println(message);

		response.getWriter().append(message);
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
