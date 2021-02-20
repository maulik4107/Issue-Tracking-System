<%@page import="com.issuetracker.bean.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Project Manager Home</title>
<%@include file="commonplugins.jsp"%>
</head>
<body>
	<%
		HttpSession session1 = request.getSession(false);
	User u = (User) session1.getAttribute("pm");
	%>
	<%String profile=(String)request.getAttribute("msg");%>
	<%String module=(String)request.getAttribute("CreateModule"); %>
	<div class="container-scroller">
		<%@include file="_navbar.jsp"%>
		<div class="container-fluid page-body-wrapper">
			<!-- partial:partials/_sidebar.html -->
			<%@include file="projectmanagersidebar.jsp"%>
			<div class="main-panel">
				<div class="content-wrapper"
					style="background-image: url(pages/samples/pic1.jpg); background-repeat: no-repeat; background-position: center; background-size: 1200px;">
					
					<%if(profile==null && module==null){ %>
					<marquee scrolldelay="10" direction="down" scrollamount="5"
						behavior="slide">
						<h2
							style="font-size: 60px; font-style: italic; font-family: Apple; color: darkblue; text-align: center;">
							Welcome Mr. <%=u.getUserName()%>
						</h2>
					</marquee>
					<%} %>
					
					<%if(profile!=null){ %>
					<marquee scrolldelay="10" direction="down" scrollamount="5"
						behavior="slide">
						<h2
							style="font-size: 60px; font-style: italic; font-family: Apple; color: darkblue; text-align: center;">
							<%=profile%>
						</h2>
					</marquee>
					<%} %>
					
					<%if(module!=null){ %>
					<marquee scrolldelay="10" direction="down" scrollamount="5"
						behavior="slide">
						<h2
							style="font-size: 60px; font-style: italic; font-family: Apple; color: darkblue; text-align: center;">
							<%=module%>
						</h2>
					</marquee>
					<%} %>
					
					
				</div>
			</div>
		</div>
	</div>
	<%@include file="commonjspluggins.jsp"%>
</body>
</html>