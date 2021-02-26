package com.issuetracker.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.issuetracker.bean.Area;
import com.issuetracker.bean.User;
import com.issuetracker.service.IssueService;
import com.issuetracker.service.impl.IssueServiceImpl;

/**
 * Servlet implementation class EditProfile
 */
public class EditProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	IssueService issueService = new IssueServiceImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditProfile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int id=Integer.parseInt(request.getParameter("id"));
		HttpSession session = request.getSession(false);
		User u=new User();
		if(id==0)
		{
			u = (User)session.getAttribute("user");
		}
		if(id==1)
		{
			u = (User)session.getAttribute("pm");
		}
		if(id==2)
		{
			u=(User)session.getAttribute("developer");
		}
		if(id==3)
		{
			u=(User)session.getAttribute("tester");
		}
		List<Area> areaList = null;
		
		String areaName = null;
		
		try {
			 areaList = issueService.fetchAreaDetails();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("areaList", areaList);

		try {
			areaName = issueService.fetchAreaDetails(u.getAreaId());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		u.setAreaName(areaName);
		request.setAttribute("areaList", areaList);
		request.setAttribute("role",u);
		request.setAttribute("id",id);
		RequestDispatcher dispatcher = request.getRequestDispatcher("editprofile1.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
