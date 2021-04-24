package com.issuetracker.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.issuetracker.bean.ModuleDetails;
import com.issuetracker.service.ProjectService;
import com.issuetracker.service.impl.ProjectServiceImpl;

/**
 * Servlet implementation class ProjectProgress
 */
public class ProjectProgress extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ProjectService projectService = new ProjectServiceImpl();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProjectProgress() {
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

		int pid = Integer.parseInt(request.getParameter("projectId"));
		int New = 0;
		int InProgress = 15;
		int RFT = 65;
		int IF = 50;
		int TC = 90;
		int Completed = 100;

		List<ModuleDetails> moduleList = projectService.getAllModuleDetails(pid);
		int[] arr = new int[moduleList.size()];
		int cnt = 0;

		for (ModuleDetails module : moduleList) {
			int cs = module.getStatusId();
			if (cs == 1) {
				arr[cnt] = New;
				cnt++;
			} else if (cs == 2) {
				arr[cnt] = InProgress;
				cnt++;
			} else if (cs == 3) {
				arr[cnt] = RFT;
				cnt++;
			} else if (cs == 4) {
				arr[cnt] = TC;
				cnt++;
			} else if (cs == 5) {
				arr[cnt] = IF;
				cnt++;
			} else if (cs == 6) {
				arr[cnt] = Completed;
				cnt++;
			}

		}
		int sum = 0;
		float progress = 0;
		for (int i = 0; i < cnt; i++) {
			sum += arr[i];
		}
		if (cnt == 0) {
			sum = 0;
		} else {
			progress = sum / cnt;
		}
		response.getWriter().append(String.valueOf(progress));
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
