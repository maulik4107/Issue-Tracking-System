<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Project Deleted</title>
<%@include file="commonplugins.jsp"%>
</head>
<body>
	<%
		String CreateMsg = (String) request.getAttribute("message");
	%>
	<div class="container-scroller">
		<%@include file="_navbar.jsp"%>
		<div class="container-fluid page-body-wrapper">
			<!-- partial:partials/_sidebar.html -->
			<%@include file="adminsidebar.jsp"%>
			<div class="main-panel">
				<div class="content-wrapper"
					style="background-image: url(pages/samples/pic1.jpg); background-repeat: no-repeat; background-position: center; background-size: 1200px;">

					<marquee scrolldelay="10" direction="down" scrollamount="5"
						behavior="slide">
						<h2
							style="font-size: 60px; font-style: italic; font-family: Apple; color: darkblue; text-align: center;">
						<%=CreateMsg %>
						</h2>
					</marquee>
					<a href="AdminHome.jsp">Go back</a>
				</div>
			</div>
		</div>
	</div>
	<%@include file="commonjspluggins.jsp"%>
</body>
</html>