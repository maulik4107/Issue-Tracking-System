package com.issuetracker.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.issuetracker.bean.User;
import com.issuetracker.service.IssueService;
import com.issuetracker.service.ProjectService;
import com.issuetracker.service.impl.IssueServiceImpl;
import com.issuetracker.service.impl.ProjectServiceImpl;

/**
 * Servlet implementation class GetUserList
 */
public class GetUserList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	IssueService issueService=new IssueServiceImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetUserList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int role = Integer.parseInt(request.getParameter("UserRole"));
		List<User> ulist=new ArrayList<User>();
		if(role==0)
		{
			try {
				ulist=issueService.getAdminDetails();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(role==1)
		{
			try {
				ulist=issueService.getPmDetails();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(role==2)
		{
			try {
				ulist=issueService.getDeveloperList();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(role==3)
		{
			try {
				ulist=issueService.getTesterList();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		String userDetails = new Gson().toJson(ulist);

		response.getWriter().append(userDetails);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
