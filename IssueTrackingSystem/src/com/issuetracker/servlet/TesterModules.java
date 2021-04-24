package com.issuetracker.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.issuetracker.bean.ModuleDetails;
import com.issuetracker.service.TesterService;
import com.issuetracker.service.impl.TesterServiceImpl;

/**
 * Servlet implementation class TesterModules
 */
public class TesterModules extends HttpServlet {
	private static final long serialVersionUID = 1L;

	TesterService testerService = new TesterServiceImpl();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TesterModules() {
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
		int testerId = Integer.parseInt(request.getParameter("id"));

		String str = request.getParameter("str");

		if (str.equals("view")) {
			List<ModuleDetails> testerModules = testerService.fetchModuleDetails(testerId);
			request.setAttribute("testerModules", testerModules);
			RequestDispatcher dispatcher = request.getRequestDispatcher("testermodules.jsp");
			dispatcher.forward(request, response);
		}
		if (str.equals("create")) {
			System.out.println("Servlet called");
			List<ModuleDetails> testerModules = null;
			testerModules = testerService.fetchCreateModuleDetails(testerId);
			System.out.println("method finish");
			String msg = null;
			System.out.println("list size : " + testerModules.size());
			if (testerModules.size() <= 0) {

				System.out.println("inside if");
				msg = "There are no any issue founded modules.";
				request.setAttribute("msg", msg);
				request.setAttribute("testerModules", testerModules);
				RequestDispatcher dispatcher = request.getRequestDispatcher("createissue.jsp");
				dispatcher.forward(request, response);
			}
			else
			{
				System.out.println("inside else");
				request.setAttribute("msg", msg);
				request.setAttribute("testerModules", testerModules);
				RequestDispatcher dispatcher = request.getRequestDispatcher("createissue.jsp");
				dispatcher.forward(request, response);
			}
			response.getWriter().append("Served at: ").append(request.getContextPath());
		}
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
