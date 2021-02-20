package com.issuetracker.servlet;

import java.io.IOException;
import java.sql.SQLException;
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
 * Servlet implementation class GetProjectList
 */
public class GetProjectList extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	ProjectService projectService=new ProjectServiceImpl();
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetProjectList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<ProjectDetails> list=null;
		
		String update=(String)request.getAttribute("update");
		String remove=(String)request.getAttribute("remove");
		
		int id=Integer.parseInt(request.getParameter("id"));
		try {
			list=projectService.getProjectList();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("projectList",list);
		request.setAttribute("id",id);
		request.setAttribute("remove",remove);
		request.setAttribute("update",update);
		RequestDispatcher dispatcher=request.getRequestDispatcher("viewprojects.jsp");
		dispatcher.forward(request, response);
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
