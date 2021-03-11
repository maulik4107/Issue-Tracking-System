<%@page import="com.issuetracker.bean.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Admin Home</title>
<%@include file="commonplugins.jsp"%>
</head>
<body>
	<% String create=(String)request.getAttribute("message");%>
	
	<% String remove=(String)request.getAttribute("remove");%>
	
	<% String update=(String)request.getAttribute("update");%>
	
	<% String allocate=(String)request.getAttribute("allocate");%>
	
	<% String profile=(String)request.getAttribute("msg");%>
	
	<% String pmsg=(String)request.getAttribute("pmsg");%>
	
	<% String moduleUpdate=(String)request.getAttribute("updateMessage");%>
	
	<% String editIssue=(String)request.getAttribute("Editmsg");%>
	<%
		HttpSession session1 = request.getSession(false);
	User u = (User) session1.getAttribute("user");
	%>
	<div class="container-scroller">
		<%@include file="_navbar.jsp"%>
		<div class="container-fluid page-body-wrapper">
			<!-- partial:partials/_sidebar.html -->
			<%@include file="adminsidebar.jsp"%>
			<div class="main-panel">
				<div class="content-wrapper"
					style="background-image: url(pages/samples/pic1.jpg); background-repeat: no-repeat; background-position: center; background-size: 1200px;">
					
					<%if(editIssue==null && create==null && moduleUpdate==null && remove==null && update==null && allocate==null &&pmsg==null && profile==null){ %>
					<marquee scrolldelay="10" direction="down" scrollamount="5"
						behavior="slide">
						<h2
							style="font-size: 60px; font-style: italic; font-family: Apple; color: darkblue; text-align: center;">
							Welcome Mr. <%=u.getUserName()%>
						</h2>
					</marquee>
					<% }%>
					<%if(create!=null){ %>
					<marquee scrolldelay="10" direction="down" scrollamount="5"
						behavior="slide">
						<h2
							style="font-size: 60px; font-style: italic; font-family: Apple; color: darkblue; text-align: center;">
							<%=create%>
						</h2>
					</marquee>
					<% }%>
					<%if(editIssue!=null){ %>
					<marquee scrolldelay="10" direction="down" scrollamount="5"
						behavior="slide">
						<h2
							style="font-size: 60px; font-style: italic; font-family: Apple; color: darkblue; text-align: center;">
							<%=editIssue%>
						</h2>
					</marquee>
					<% }%>
					
					<%if(remove!=null){ %>
					<marquee scrolldelay="10" direction="down" scrollamount="5"
						behavior="slide">
						<h2
							style="font-size: 60px; font-style: italic; font-family: Apple; color: darkblue; text-align: center;">
							<%=remove%>
						</h2>
					</marquee>
					<% }%>
					
					<%if(update!=null){ %>
					<marquee scrolldelay="10" direction="down" scrollamount="5"
						behavior="slide">
						<h2
							style="font-size: 60px; font-style: italic; font-family: Apple; color: darkblue; text-align: center;">
							<%=update%>
						</h2>
					</marquee>
					<% }%>
					
					<%if(allocate!=null){ %>
					<marquee scrolldelay="10" direction="down" scrollamount="5"
						behavior="slide">
						<h2
							style="font-size: 60px; font-style: italic; font-family: Apple; color: darkblue; text-align: center;">
							<%=allocate%>
						</h2>
					</marquee>
					<% }%>
					
					<%if(profile!=null){ %>
					<marquee scrolldelay="10" direction="down" scrollamount="5"
						behavior="slide">
						<h2
							style="font-size: 60px; font-style: italic; font-family: Apple; color: darkblue; text-align: center;">
							<%=profile%>
						</h2>
					</marquee>
					<% }%>
					<%if(pmsg!=null){ %>
					<marquee scrolldelay="10" direction="down" scrollamount="5"
						behavior="slide">
						<h2
							style="font-size: 60px; font-style: italic; font-family: Apple; color: darkblue; text-align: center;">
							<%=pmsg%>
						</h2>
					</marquee>
					<% }%>
					<%if(moduleUpdate!=null){ %>
					<marquee scrolldelay="10" direction="down" scrollamount="5"
						behavior="slide">
						<h2
							style="font-size: 60px; font-style: italic; font-family: Apple; color: darkblue; text-align: center;">
							<%=moduleUpdate%>
						</h2>
					</marquee>
					<% }%>
				</div>
			</div>
		</div>
	</div>
	<%@include file="commonjspluggins.jsp"%>
</body>
</html>