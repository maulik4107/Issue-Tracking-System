package com.issuetracker.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.issuetracker.bean.Area;
import com.issuetracker.service.IssueService;
import com.issuetracker.service.impl.IssueServiceImpl;

/**
 * Servlet implementation class DisplayAreaAndRole
 */
public class DisplayAreaAndRole extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	IssueService issueService = new IssueServiceImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DisplayAreaAndRole() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		List<Area> areaList = null;
		
		try {
			 areaList = issueService.fetchAreaDetails();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("areaList", areaList);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
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
