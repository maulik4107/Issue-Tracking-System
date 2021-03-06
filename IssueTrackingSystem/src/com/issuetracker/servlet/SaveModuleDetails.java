package com.issuetracker.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.issuetracker.bean.ModuleDetails;
import com.issuetracker.bean.User;
import com.issuetracker.service.ProjectService;
import com.issuetracker.service.impl.ProjectServiceImpl;
import com.issuetracker.utill.EmailThread;

/**
 * Servlet implementation class SaveModuleDetails
 */
public class SaveModuleDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	ProjectService projectService = new ProjectServiceImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveModuleDetails() {
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
		int pId = Integer.parseInt(request.getParameter("projectName"));
		int moduleId = Integer.parseInt(request.getParameter("moduleId"));
		int developerId = Integer.parseInt(request.getParameter("developerId"));
		
		String msg = projectService.saveModuleDetails(pId,moduleId,developerId);
		
		ModuleDetails md=new ModuleDetails();
		md=projectService.getModuleDetails(moduleId,developerId);
		
		System.out.println(md.getDeveloperName());
		System.out.println(md.getModuleName());
		
		String message = "<center><h1 style='color:darkblue;font-family:apple;font-style:italic;font-size: 40px;'>Welcome to </h1><h2 style='color:darkblue;font-family:apple;font-style:italic;font-size: 30px;'>Issue Tracking System</h2></center>"
				+"<h2 style='color:darkblue;font-family:apple;font-style:italic;font-size: 20px;'>"+"Dear, " + md.getDeveloperName() + "</h2><hr><br>"+"module "+" '"+md.getModuleName()+"' "+"has been allocated to you. Kindly strat your work. For getting more details about allocated module kindly contact to your project manager."+"<br><br><hr><center>***********Module details are given below***********</center><hr><br>"
				+"<br>"+"Module Name          : "+md.getModuleName()
				+"<br>"+"Module Strating Date : "+md.getModuleSd()
				+"<br>"+"Module Ending Date   : "+md.getModuleEd()
				+"<br>"+"Module Description   : "+md.getModuleDes()+"<br><h2 style='color:darkblue;font-family:apple;font-style:italic;font-size: 20px;'>"+"Thank You....."+"</h2>";

	
		EmailThread thread = new EmailThread();
		
		thread.send(md.getEmail(), message);
		
		Thread t1 = new Thread(thread);
		
		t1.start();
	
		request.setAttribute("message1",msg);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("projectmanagerhome.jsp");
		dispatcher.forward(request, response);
		doGet(request, response);
	}

}
