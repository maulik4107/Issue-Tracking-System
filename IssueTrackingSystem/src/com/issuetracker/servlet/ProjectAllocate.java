package com.issuetracker.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.issuetracker.bean.User;
import com.issuetracker.bean.ProjectDetails;
import com.issuetracker.bean.SendEmail;
import com.issuetracker.service.IssueService;
import com.issuetracker.service.ProjectService;
import com.issuetracker.service.impl.IssueServiceImpl;
import com.issuetracker.service.impl.ProjectServiceImpl;
import com.issuetracker.utill.EmailThread;

/**
 * Servlet implementation class ProjectAllocate
 */
public class ProjectAllocate extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	ProjectService projectService=new ProjectServiceImpl();
	IssueService issueService = new IssueServiceImpl();
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProjectAllocate() {
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
		
		String msg=null;
		String getEmail=null;
		int pmId=Integer.parseInt(request.getParameter("projectManager"));
		int projectId=Integer.parseInt(request.getParameter("projectName"));
		
		ProjectDetails pd=new ProjectDetails();
		try {
			msg=projectService.saveManagerDetail(pmId,projectId);
			 getEmail = issueService.selectEmail(pmId);
			 pd=projectService.getProjectName(projectId,pmId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String message = "<center><h1 style='color:darkblue;font-family:apple;font-style:italic;font-size: 40px;'>Welcome to </h1><h2 style='color:darkblue;font-family:apple;font-style:italic;font-size: 30px;'>Issue Tracking System</h2></center>"
				+"<h2 style='color:darkblue;font-family:apple;font-style:italic;font-size: 20px;'>"+"Dear, " + pd.getPmName() + "</h2><hr><br>"+"Project "+" '"+pd.getProjectName()+"' "+"has been allocated to you. Kindly strat your work with your developement team. For getting more details about allocated project kindly contact to your Admin."+"<br><br><hr><center>***********Project details are given below***********</center><hr><br>"
				+"<br>"+"Project Name          : "+pd.getProjectName()
				+"<br>"+"Project Strating Date : "+pd.getProjectSd()
				+"<br>"+"Project Ending Date   : "+pd.getProjectEd()
				+"<br>"+"Project Description   : "+pd.getProjectDes()+"<br><h2 style='color:darkblue;font-family:apple;font-style:italic;font-size: 20px;'>"+"Thank You....."+"</h2>";

		EmailThread thread = new EmailThread();
		
		thread.send(getEmail, message);
		
		Thread t1 = new Thread(thread);
		
		t1.start();
		request.setAttribute("msg",msg);
		RequestDispatcher dispatcher=request.getRequestDispatcher("projectallocatedalert.jsp");
		dispatcher.forward(request, response);
		
		doGet(request, response);
	}

}
