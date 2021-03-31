package com.issuetracker.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.issuetracker.bean.Issue;
import com.issuetracker.service.TesterService;
import com.issuetracker.service.impl.TesterServiceImpl;

/**
 * Servlet implementation class ModuleProgress
 */
public class ModuleProgress extends HttpServlet {
	private static final long serialVersionUID = 1L;

	TesterService testerService = new TesterServiceImpl();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ModuleProgress() {
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

		int moduleId = Integer.parseInt(request.getParameter("MId"));

		List<Issue> issue = testerService.getIssueDetails(moduleId);

		int New = 0;
		int Assigned = 2;
		int InProgress = 10;
		int Duplicate = 95;
		int Rejected = 95;
		int Deffereed = 95;
		int NotABug = 95;
		int Fixing = 15;
		int LocalFixDone = 30;
		int WaitingforBetaDeployment = 40;
		int BetaDeploymentDone = 45;
		int BetaTesting = 47;
		int BetaTestPass = 50;
		int BetaTestFailed = 15;
		int WaitingforStagingDeployment = 60;
		int StagingDeployed = 65;
		int StagingTesting = 70;
		int StagingTestingPass = 80;
		int StagingTestingFailed = 15;
		int WaitingforProductionDeployment = 95;
		int Closed = 100;

		int[] arr = new int[issue.size()];
		int cnt = 0;

		for (Issue i : issue) {
			int cs = i.getIssueStatusId();
			if (cs == 1) {
				arr[cnt] = New;
				cnt++;
			} else if (cs == 2) {
				arr[cnt] = Assigned;
				cnt++;
			} else if (cs == 3) {
				arr[cnt] = InProgress;
				cnt++;
			} else if (cs == 4) {
				arr[cnt] = Duplicate;
				cnt++;
			} else if (cs == 5) {
				arr[cnt] = Rejected;
				cnt++;
			} else if (cs == 6) {
				arr[cnt] = Deffereed;
				cnt++;
			} else if (cs == 7) {
				arr[cnt] = NotABug;
				cnt++;
			} else if (cs == 8) {
				arr[cnt] = Fixing;
				cnt++;
			} else if (cs == 9) {
				arr[cnt] = LocalFixDone;
				cnt++;
			} else if (cs == 10) {
				arr[cnt] = WaitingforBetaDeployment;
				cnt++;
			} else if (cs == 11) {
				arr[cnt] = BetaDeploymentDone;
				cnt++;
			} else if (cs == 12) {
				arr[cnt] = BetaTesting;
				cnt++;
			} else if (cs == 13) {
				arr[cnt] = BetaTestPass;
				cnt++;
			} else if (cs == 14) {
				arr[cnt] = BetaTestFailed;
				cnt++;
			} else if (cs == 15) {
				arr[cnt] = WaitingforStagingDeployment;
				cnt++;
			} else if (cs == 16) {
				arr[cnt] = StagingDeployed;
				cnt++;
			} else if (cs == 17) {
				arr[cnt] = StagingTesting;
				cnt++;
			} else if (cs == 18) {
				arr[cnt] = StagingTestingPass;
				cnt++;
			} else if (cs == 19) {
				arr[cnt] = StagingTestingFailed;
				cnt++;
			} else if (cs == 20) {
				arr[cnt] = WaitingforProductionDeployment;
				cnt++;
			} else if (cs == 21) {
				arr[cnt] = Closed;
				cnt++;
			}
		}
		int sum = 0;
		float progress = 0;
		for (int i = 0; i < cnt; i++) {
			sum += arr[i];
		}
		progress = sum / 21;
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
