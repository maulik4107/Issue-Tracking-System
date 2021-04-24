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
 * Servlet implementation class ChangeProjectStatus
 */
public class ChangeProjectStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	ProjectService projectService=new ProjectServiceImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeProjectStatus() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int pId=Integer.parseInt(request.getParameter("projectId"));
		List<ModuleDetails> moduleList=null;
		
		moduleList=projectService.getAllModuleDetails(pId);
		
		int flag=0;
		int cs=0;
		String msg=null;
		
		for(ModuleDetails m : moduleList)
		{
			cs=m.getStatusId();
			System.out.println(cs);
			if(cs!=6)
			{
				flag=1;
			}
		}
		System.out.println("Flag="+flag);
		if(flag==1)
		{
			msg="false";
		}
		if(flag==0)
		{
			msg=projectService.changeProjectStatus(pId);
		}
		
		response.getWriter().append(msg);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
