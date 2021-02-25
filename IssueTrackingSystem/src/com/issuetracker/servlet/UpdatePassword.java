package com.issuetracker.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.issuetracker.bean.User;
import com.issuetracker.others.TrippleDes;
import com.issuetracker.service.IssueService;
import com.issuetracker.service.impl.IssueServiceImpl;

/**
 * Servlet implementation class UpdatePassword
 */
public class UpdatePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	IssueService issueService = new IssueServiceImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int updatedId = 0;
		int Id=0;
		String message=null;
		int roleId=Integer.parseInt(request.getParameter("rid"));
		
		System.out.println(roleId);
		
		if(roleId==0)
		{
			HttpSession httpsession=request.getSession(false);
			User user = (User)httpsession.getAttribute("user");
			Id=user.getUserId();
		}
		if(roleId==1)
		{
			HttpSession httpsession=request.getSession(false);
			User user = (User)httpsession.getAttribute("pm");
			Id=user.getUserId();
		}
		if(roleId==2)
		{
			HttpSession httpsession=request.getSession(false);
			User user = (User)httpsession.getAttribute("developer");
			Id=user.getUserId();
		}
		if(roleId==3)
		{
			HttpSession httpsession=request.getSession(false);
			User user = (User)httpsession.getAttribute("tester");
			Id=user.getUserId();
		}
		
		String password = request.getParameter("password");
		
		TrippleDes des = null;
		try {
			des = new TrippleDes();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String pwd = des.encrypt(password);
		
		User u = new User();
		u.setPassword(pwd);
		
		try {
			updatedId = issueService.savePasswordDetails(pwd,Id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if (updatedId > 0) {
			message = "Your Password Updated Successfully!!!";
			request.setAttribute("pmsg", message);
			if(roleId==0)
			{
				HttpSession session = request.getSession(false);
				session.setAttribute("user",u);	
				RequestDispatcher dispatcher = request.getRequestDispatcher("AdminHome.jsp");
				dispatcher.forward(request, response);
			}
			if(roleId==1)
			{
				HttpSession session = request.getSession(false);
				session.setAttribute("pm",u);	
				RequestDispatcher dispatcher = request.getRequestDispatcher("projectmanagerhome.jsp");
				dispatcher.forward(request, response);
			}
			if(roleId==2)
			{
				HttpSession session = request.getSession(false);
				session.setAttribute("developer",u);	
				RequestDispatcher dispatcher = request.getRequestDispatcher("developerhome.jsp");
				dispatcher.forward(request, response);
			}
			if(roleId==3)
			{
				HttpSession session = request.getSession(false);
				session.setAttribute("tester",u);	
				RequestDispatcher dispatcher = request.getRequestDispatcher("testerhome.jsp");
				dispatcher.forward(request, response);
			}
			
		}
				
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String email=request.getParameter("email");
		
		int id=Integer.parseInt(request.getParameter("id"));

		String password = (String)request.getParameter("password");
		
		String pwd = null;
		System.out.println("password update from post");
		
		try {
			TrippleDes des = new TrippleDes();
			pwd = des.encrypt(password);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		String msg = issueService.savePasswordDetails(email,pwd);
		
		request.setAttribute("msg","Password Updated Successfully!!");
		
		if(id==-1)
		{
			RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
		}else if(id==0)
		{
			RequestDispatcher dispatcher = request.getRequestDispatcher("AdminHome.jsp");
			dispatcher.forward(request, response);
		}else if(id==1)
		{
			RequestDispatcher dispatcher = request.getRequestDispatcher("projectmanagerhome.jsp");
			dispatcher.forward(request, response);
		}else if(id==2)
		{
			RequestDispatcher dispatcher = request.getRequestDispatcher("developerhome.jsp");
			dispatcher.forward(request, response);
		}else if(id==3)
		{
			RequestDispatcher dispatcher = request.getRequestDispatcher("testerhome.jsp");
			dispatcher.forward(request, response);
		}
		
	}

}
