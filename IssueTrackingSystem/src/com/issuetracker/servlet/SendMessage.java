package com.issuetracker.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.issuetracker.service.IssueService;
import com.issuetracker.service.impl.IssueServiceImpl;
import com.issuetracker.utill.EmailThread;

/**
 * Servlet implementation class SendMessage
 */
public class SendMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	IssueService issueService=new IssueServiceImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendMessage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int id=Integer.parseInt(request.getParameter("sendId"));
		int sideId=Integer.parseInt(request.getParameter("idsidebar"));
		
		String senderName=null;
		int  role=Integer.parseInt(request.getParameter("projectName"));
		String roleName=null;
		if(sideId==0)
		{
			roleName="Admin";
		}
		if(sideId==1)
		{
			roleName="Project Manager";
		}
		if(sideId==2)
		{
			roleName="Developer";
		}
		if(sideId==3)
		{
			roleName="Tester";
		}
		int userId=Integer.parseInt(request.getParameter("moduleId"));
		String msg=request.getParameter("Message");
		String mail=null;
		String uName=null;
		try {
			 mail=issueService.selectEmail(userId);
			 uName=issueService.getUserName(userId);
			 senderName=issueService.getUserName(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String message = "<center><h1 style='color:darkblue;font-family:apple;font-style:italic;font-size: 40px;'>Welcome to </h1><h2 style='color:darkblue;font-family:apple;font-style:italic;font-size: 30px;'>Issue Tracking System</h2></center>"
				+ "<h2 style='color:darkblue;font-family:apple;font-style:italic;font-size: 20px;'>" + "Dear, "
				+ uName + "</h2><hr>"
				+ "<br><center>***************Your Message***************</center><hr><br>" + "<br>"
				+ msg + "<br><br> Message From : "+senderName+" ("+roleName+") "
				+ "<br><h2 style='color:darkblue;font-family:apple;font-style:italic;font-size: 20px;'>"
				+ "Thank You....." + "</h2>";
	
		EmailThread thread = new EmailThread();
		
		thread.send(mail, message);
		
		Thread t1 = new Thread(thread);
		
		t1.start();
		
		request.setAttribute("email","Email Sent Successfully !!");
		
		if(sideId==0)
		{
			RequestDispatcher dispatcher=request.getRequestDispatcher("AdminHome.jsp");
			dispatcher.forward(request, response);
		}
		if(sideId==1)
		{
			RequestDispatcher dispatcher=request.getRequestDispatcher("projectmanagerhome.jsp");
			dispatcher.forward(request, response);
		}
		if(sideId==2)
		{
			RequestDispatcher dispatcher=request.getRequestDispatcher("developerhome.jsp");
			dispatcher.forward(request, response);
		}
		if(sideId==3)
		{
			RequestDispatcher dispatcher=request.getRequestDispatcher("testerhome.jsp");
			dispatcher.forward(request, response);
		}
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
